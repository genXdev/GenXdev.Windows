################################################################################
<#
.SYNOPSIS
Creates daily and hourly PowerShell scripts and their corresponding scheduled task.

.DESCRIPTION
Creates daily and hourly PowerShell scripts and their corresponding scheduled tasks
that will run as the current user with elevated privileges. Tasks are created for:
- Every hour of every day of the week
- Every hour daily
- At system startup
- At user logon

.PARAMETER FilePath
The directory path where the task scripts will be created. If not specified,
defaults to a ScheduledTasks folder in the parent directory.

.PARAMETER Prefix
A prefix for the scheduled task names. Default is "PS".

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

        # define days of week array for task creation
        $daysOfWeek = @(
            "Sunday", "Monday", "Tuesday", "Wednesday",
            "Thursday", "Friday", "Saturday"
        )

        # get current UTC time for task scheduling
        $now = [DateTime]::UtcNow

        # get current user credentials for task execution
        $credential = Get-Credential -UserName `
            ([System.Security.Principal.WindowsIdentity]::GetCurrent().Name)

        # normalize and validate file path
        if ([string]::IsNullOrWhiteSpace($FilePath)) {
            $FilePath = Expand-Path `
                -FilePath "$PSScriptRoot\..\..\..\..\..\ScheduledTasks\" `
                -CreateDirectory
        }
        else {
            $FilePath = Expand-Path -FilePath $FilePath
        }

        # set global workspace folder
        $Global:WorkspaceFolder = Expand-Path "$PSScriptRoot\..\..\..\..\..\"

        Write-Verbose "Using script directory: $FilePath"
        Write-Verbose "Using task prefix: $Prefix"
    }

    process {

        function New-TaskDefinition {
            param([string]$TaskName, [string]$Description, $Trigger)

            # create script path
            $scriptPath = Expand-Path -CreateDirectory `
                -FilePath "$FilePath\$TaskName.ps1"

            # create script file if it doesn't exist
            if (-not (Test-Path $scriptPath -ErrorAction SilentlyContinue)) {
                $scriptContent = @"
# $Description

$($Description | ConvertTo-Json) | Out-File '$Global:WorkspaceFolder\scheduledtasks.log.txt' -Append

"@
                $null = Set-Content -Path $scriptPath -Value $scriptContent
            }

            # check if task already exists
            if (-not (Get-ScheduledTask -TaskName $TaskName `
                -TaskPath "\$Prefix\" -ErrorAction SilentlyContinue)) {

                Write-Verbose "Creating task \$Prefix\$TaskName : $Description"

                # create task action
                $actionArguments = "-ExecutionPolicy Bypass -NoLogo -Command & `
                    `"'$scriptPath'`""
                $action = New-ScheduledTaskAction `
                    -Execute ((Get-Command "pwsh.exe").source) `
                    -Argument $actionArguments `
                    -Id "Exec $TaskName".Replace(" ", "_") `
                    -WorkingDirectory $Global:WorkspaceFolder

                # create task settings
                $settings = New-ScheduledTaskSettingsSet `
                    -AllowStartIfOnBatteries `
                    -DontStopIfGoingOnBatteries `
                    -Hidden `
                    -StartWhenAvailable
                $settings.AllowHardTerminate = $true
                $settings.ExecutionTimeLimit = 'PT1H'
                $settings.Volatile = $false

                # set task end boundary
                $trigger.EndBoundary = $now.AddYears(99).ToString(
                    "yyyy-MM-dd'T'HH:mm:ss")

                # convert secure string password for task registration
                $ptr = [Runtime.InteropServices.Marshal]::SecureStringToGlobalAllocUnicode(
                    $credential.Password)
                $plainPassword = [Runtime.InteropServices.Marshal]::PtrToStringUni($ptr)
                [Runtime.InteropServices.Marshal]::ZeroFreeGlobalAllocUnicode($ptr)

                # register the scheduled task
                $taskParams = @{
                    TaskName = $TaskName
                    User = $credential.UserName
                    Password = $plainPassword
                    RunLevel = "Highest"
                    Action = $action
                    Description = $Description
                    Settings = $settings
                    Trigger = $trigger
                    TaskPath = $Prefix
                    Force = $true
                }
                Register-ScheduledTask @taskParams
            }
        }

        # create startup task
        New-TaskDefinition `
            -TaskName "${Prefix}_at_startup" `
            -Description "Scheduled-task executed at startup" `
            -Trigger (New-ScheduledTaskTrigger -AtStartup)

        # create logon task
        New-TaskDefinition `
            -TaskName "${Prefix}_at_logon" `
            -Description "Scheduled-task executed at logon" `
            -Trigger (New-ScheduledTaskTrigger -AtLogOn)

        # create weekly tasks for each day and hour
        foreach ($day in $daysOfWeek) {
            for ($hour = 0; $hour -lt 24; $hour++) {
                $taskName = "$Prefix_$($day.ToLower())_$($hour.ToString('D2'))00h_utc"
                $description = "Scheduled-task for $day at $($hour.ToString('D2')):00h"

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
