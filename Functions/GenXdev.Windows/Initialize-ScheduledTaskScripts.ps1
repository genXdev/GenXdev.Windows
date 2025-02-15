################################################################################
<#
.SYNOPSIS
Creates scheduled tasks that run PowerShell scripts at specified intervals.

.DESCRIPTION
Creates and configures scheduled tasks that execute PowerShell scripts at various
intervals including:
- System startup
- User logon
- Every hour of specific days (e.g., Monday at 13:00)
- Daily at specific hours (e.g., every day at 15:00)
Each task runs with elevated privileges under the current user's context.

.PARAMETER FilePath
The directory path where the PowerShell scripts for each task will be created.
If not specified, scripts are created in a 'ScheduledTasks' folder in the parent
directory.

.PARAMETER Prefix
A prefix string added to all task names for grouping and identification.
Default is "PS".

.EXAMPLE
Initialize-ScheduledTaskScripts -FilePath "C:\Tasks" -Prefix "MyTasks"

.EXAMPLE
Initialize-ScheduledTaskScripts
#>
function Initialize-ScheduledTaskScripts {

    [CmdletBinding()]
    param(
        ###########################################################################
        [parameter(
            Position = 0,
            Mandatory = $false,
            HelpMessage = "The directory path where task scripts will be created"
        )]
        [string] $FilePath = "",
        ###########################################################################
        [parameter(
            Position = 1,
            Mandatory = $false,
            HelpMessage = "Prefix for the scheduled task names"
        )]
        [string] $Prefix = "PS"
        ###########################################################################
    )

    begin {

        # array of weekdays for creating weekly scheduled tasks
        $daysOfWeek = @(
            "Sunday", "Monday", "Tuesday", "Wednesday",
            "Thursday", "Friday", "Saturday"
        )

        # get current UTC time for calculating task start times
        $now = [DateTime]::UtcNow

        # get current user credentials for task execution context
        $credential = Get-Credential -UserName `
        ([System.Security.Principal.WindowsIdentity]::GetCurrent().Name)

        # set default path if none provided and ensure directory exists
        if ([string]::IsNullOrWhiteSpace($FilePath)) {
            $FilePath = Expand-Path `
                -FilePath "$PSScriptRoot\..\..\..\..\..\ScheduledTasks\" `
                -CreateDirectory
        }
        else {
            $FilePath = Expand-Path -FilePath $FilePath
        }

        # set global workspace for task execution context
        $Global:WorkspaceFolder = Expand-Path "$PSScriptRoot\..\..\..\..\..\"

        Write-Verbose "Task scripts will be created in: $FilePath"
        Write-Verbose "Tasks will be prefixed with: $Prefix"
    }

    process {

        ###########################################################################
        <#
        .SYNOPSIS
        Creates a new scheduled task with specified parameters.

        .DESCRIPTION
        Helper function that creates a PowerShell script file and corresponding
        scheduled task with specified trigger conditions.

        .PARAMETER TaskName
        Name of the scheduled task to create.

        .PARAMETER Description
        Description of what the task does.

        .PARAMETER Trigger
        Scheduled task trigger object defining when the task runs.
        #>
        function New-TaskDefinition {
            param([string]$TaskName, [string]$Description, $Trigger)

            # create full path for the task's PowerShell script
            $scriptPath = Expand-Path -CreateDirectory `
                -FilePath "$FilePath\$TaskName.ps1"

            # create script file with logging if it doesn't exist
            if (-not (Test-Path $scriptPath -ErrorAction SilentlyContinue)) {
                $scriptContent = @"
# $Description

$($Description | ConvertTo-Json) | Out-File '$Global:WorkspaceFolder\scheduledtasks.log.txt' -Append

"@
                $null = Set-Content -Path $scriptPath -Value $scriptContent
            }

            # create task only if it doesn't already exist
            if (-not (Get-ScheduledTask -TaskName $TaskName `
                        -TaskPath "\$Prefix\" -ErrorAction SilentlyContinue)) {

                Write-Verbose "Creating scheduled task: \$Prefix\$TaskName"
                Write-Verbose "Task description: $Description"

                # configure the PowerShell execution command
                $actionArguments = "-ExecutionPolicy Bypass -NoLogo -Command & `
                    `"'$scriptPath'`""
                $action = New-ScheduledTaskAction `
                    -Execute ((Get-Command "pwsh.exe").source) `
                    -Argument $actionArguments `
                    -Id "Exec $TaskName".Replace(" ", "_") `
                    -WorkingDirectory $Global:WorkspaceFolder

                # configure task execution settings
                $settings = New-ScheduledTaskSettingsSet `
                    -AllowStartIfOnBatteries `
                    -DontStopIfGoingOnBatteries `
                    -Hidden `
                    -StartWhenAvailable
                $settings.AllowHardTerminate = $true
                $settings.ExecutionTimeLimit = 'PT1H'
                $settings.Volatile = $false

                # set task expiration 99 years in future
                $trigger.EndBoundary = $now.AddYears(99).ToString(
                    "yyyy-MM-dd'T'HH:mm:ss")

                # convert credential password for task registration
                $ptr = [Runtime.InteropServices.Marshal]::SecureStringToGlobalAllocUnicode(
                    $credential.Password)
                $plainPassword = [Runtime.InteropServices.Marshal]::PtrToStringUni($ptr)
                [Runtime.InteropServices.Marshal]::ZeroFreeGlobalAllocUnicode($ptr)

                # register the task with configured parameters
                $taskParams = @{
                    TaskName    = $TaskName
                    User        = $credential.UserName
                    Password    = $plainPassword
                    RunLevel    = "Highest"
                    Action      = $action
                    Description = $Description
                    Settings    = $settings
                    Trigger     = $trigger
                    TaskPath    = $Prefix
                    Force       = $true
                }
                Register-ScheduledTask @taskParams
            }
        }

        # create system startup triggered task
        New-TaskDefinition `
            -TaskName "${Prefix}_at_startup" `
            -Description "Scheduled-task executed at startup" `
            -Trigger (New-ScheduledTaskTrigger -AtStartup)

        # create user logon triggered task
        New-TaskDefinition `
            -TaskName "${Prefix}_at_logon" `
            -Description "Scheduled-task executed at logon" `
            -Trigger (New-ScheduledTaskTrigger -AtLogOn)

        # create weekly tasks for each day and hour combination
        foreach ($day in $daysOfWeek) {
            for ($hour = 0; $hour -lt 24; $hour++) {
                $taskName = "$Prefix_$($day.ToLower())_$($hour.ToString('D2'))00h_utc"
                $description = "Scheduled-task for $day at $($hour.ToString('D2')):00h"

                # calculate next occurrence of this day and hour
                $dayDiff = ([int]$now.DayOfWeek) - $daysOfWeek.IndexOf($day)
                $at = $now.Date.AddDays($dayDiff).AddHours($hour)
                if ($at -lt $now) { $at = $at.AddDays(7) }

                New-TaskDefinition `
                    -TaskName $taskName `
                    -Description $description `
                    -Trigger (New-ScheduledTaskTrigger -Weekly -DaysOfWeek $day -At $at)
            }
        }

        # create daily tasks for each hour
        for ($hour = 0; $hour -lt 24; $hour++) {
            $taskName = "$Prefix_daily_$($hour.ToString('D2'))00h_utc"
            $description = "Scheduled-task executed Daily at $($hour.ToString('D2')):00h"

            # calculate next occurrence of this hour
            $at = $now.Date.AddHours($hour)
            if ($at -lt $now) { $at = $at.AddDays(1) }

            New-TaskDefinition `
                -TaskName $taskName `
                -Description $description `
                -Trigger (New-ScheduledTaskTrigger -Daily -At $at)
        }
    }

    end {
    }
}
################################################################################
