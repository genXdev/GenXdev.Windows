###############################################################################
<#
.SYNOPSIS
Creates daily and hourly PowerShell scripts and their corresponding scheduled task

.DESCRIPTION
Creates daily and hourly PowerShell scripts and their corresponding scheduled task that will run as system

.PARAMETER FilePath
The path of the directory where the scripts will reside

.PARAMETER Prefix
A Prefix for the Scheduled-Task names

#>
function Initialize-ScheduledTaskScripts {

    param(

        [parameter(
            Mandatory = $false
        )]
        [string] $FilePath = "",


        [parameter(
            Mandatory = $false
        )]
        [string] $Prefix = "PS"
    )

    # check parameters
    if ([string]::IsNullOrWhiteSpace($FilePath)) {

        $FilePath = Expand-Path -FilePath "$PSScriptRoot\..\..\..\..\..\ScheduledTasks\" -CreateDirectory
    }
    else {

        $FilePath = Expand-Path -FilePath $FilePath
    }

    $Global:WorkspaceFolder = Expand-Path "$PSScriptRoot\..\..\..\..\..\"

    # Define an array with the names of the days of the week
    $DaysOfWeek = @("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
    $Now = [DateTime]::UtcNow;

    # $Principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -RunLevel Highest
    $Credential = Get-Credential -UserName ([System.Security.Principal.WindowsIdentity]::GetCurrent().Name)
    # $Credential = Get-Credential

    # define function
    function CheckTask {

        param([string]$TaskName, [string] $Description, $Trigger)

        # Define the path to the PowerShell script for this task
        $ScriptPath = Expand-Path -CreateDirectory -FilePath "$FilePath\$TaskName.ps1"

        # Create the PowerShell script file if it doesn't already exist
        if (-not (Test-Path $ScriptPath -ErrorAction SilentlyContinue)) {
            # "# $Description`r`n`r`n" | Out-File -FilePath $ScriptPath -Force
            "# $Description`r`n`r`n$($Description | ConvertTo-Json) | Out-File '$Global:WorkspaceFolder\scheduledtasks.log.txt' -Append`r`n" | Out-File -FilePath $ScriptPath -Force

            # "Invoke-Command -Credential (`r`n`tGet-Credential -UserName `"$([System.Security.Principal.WindowsIdentity]::GetCurrent().Name)`"`r`n) -ScriptBlock {`r`n`r`n`t# Scripts in this block are using the profile of $([System.Security.Principal.WindowsIdentity]::GetCurrent().Name)`r`n`r`n}" | Out-File -FilePath $ScriptPath -Append
            # "Invoke-Command -Credential (`r`n`tGet-Credential -UserName `"$([System.Security.Principal.WindowsIdentity]::GetCurrent().Name)`"`r`n) -ScriptBlock {`r`n`r`n`t# Scripts in this block are using the profile of $([System.Security.Principal.WindowsIdentity]::GetCurrent().Name)`r`n`r`n`tSendAutomateCloudMessage `"$($Description.Replace('"', '``"'))`"`r`n}" | Out-File -FilePath $ScriptPath -Append
        }

        # Check if the task already exists
        if (-not (Get-ScheduledTask -TaskName $TaskName -TaskPath "\$Prefix\" -ErrorAction SilentlyContinue)) {

            Write-Verbose "Creating task \$Prefix\ '$Description'"

            # Define the arguments for the New-ScheduledTaskAction cmdlet
            $ActionArguments = "-ExecutionPolicy Bypass -NoLogo -Command & `"'$ScriptPath'`"";

            # Create the scheduled task action
            $Action = New-ScheduledTaskAction -Execute ((Get-Command "pwsh.exe").source) -Argument $ActionArguments -Id "Exec $TaskName".Replace(" ", "_") -WorkingDirectory $Global:WorkspaceFolder

            # Create the scheduled task settings
            $Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -Hidden -StartWhenAvailable
            $Settings.AllowHardTerminate = $True
            # $Settings.DeleteExpiredTaskAfter = 'PT0S'
            $Settings.ExecutionTimeLimit = 'PT1H'
            $Settings.Volatile = $False

            # $Trigger.StartBoundary = $Now.ToString("yyyy-MM-dd'T'HH:mm:ss")
            $Trigger.EndBoundary = $Now.AddYears(99).ToString("yyyy-MM-dd'T'HH:mm:ss")

            $Ptr = [System.Runtime.InteropServices.Marshal]::SecureStringToGlobalAllocUnicode($Credential.Password)
            $PlainPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringUni($Ptr)
            [System.Runtime.InteropServices.Marshal]::ZeroFreeGlobalAllocUnicode($Ptr)

            # Combine all parameters
            $Parameters = @{
                "TaskName"    = $TaskName
                # "Principal"   = $Principal
                "User"        = $Credential.UserName
                "Password"    = $PlainPassword
                "RunLevel"    = "Highest"
                "Action"      = $Action
                "Description"	= $Description
                "Settings"    = $Settings
                "Trigger"     = $Trigger
                "TaskPath"    = $Prefix
                "Force"       = $true
            }

            Register-ScheduledTask @Parameters -Force
        }
    }

    # Define the name of the scheduled task for daily execution at this time
    $TaskName = $Prefix + "_at_startup"
    $Description = "Scheduled-task executed at startup";
    # Create the scheduled task trigger
    $Trigger = New-ScheduledTaskTrigger -AtStartup
    # delegate
    CheckTask $TaskName $Description $Trigger
    #-------------------------------------------------------
    # Define the name of the scheduled task for daily execution at this time
    $TaskName = $Prefix + "_at_logon"
    $Description = "Scheduled-task executed at logon";
    # Create the scheduled task trigger
    $Trigger = New-ScheduledTaskTrigger -AtLogOn
    # delegate
    CheckTask $TaskName $Description $Trigger
    #-------------------------------------------------------

    # Loop through each day of the week
    foreach ($Day in $DaysOfWeek) {

        # Loop through each hour of the day (0-23)
        for ($Hour = 0; $Hour -lt 24; $Hour++) {

            # Define the name of the scheduled task for this hour on this day
            $TaskName = "$Prefix" + "_" + $Day.ToLower() + "_" + $Hour.ToString("D2") + "00h_utc"
            $Description = "Scheduled-task for $Day at $($Hour.ToString('D2')):00h";

            # Create the scheduled task trigger
            $DayDiff = ([int]$Now.DayOfWeek) - $DaysOfWeek.IndexOf($Day);
            $At = $Now.Date.AddDays($DayDiff).AddHours($Hour);
            if ($At -lt $Now) { $At = $At.AddDays(7) }
            $Trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek $Day -At $At

            # delegate
            CheckTask $TaskName $Description $Trigger
        }
    }

    # Loop through each hour of the day (0-23)
    for ($Hour = 0; $Hour -lt 24; $Hour++) {

        # Define the name of the scheduled task for daily execution at this time
        $TaskName = $Prefix + "_daily_" + $Hour.ToString("D2") + "00h_utc"
        $Description = "Scheduled-task executed Daily at $($Hour.ToString('D2')):00h";

        # Create the scheduled task trigger
        $DayDiff = ([int]$Now.DayOfWeek) - $DaysOfWeek.IndexOf($Day);
        $At = $Now.Date.AddDays($DayDiff).AddHours($Hour);
        if ($At -lt $Now) { $At = $At.AddDays(7) }
        $Trigger = New-ScheduledTaskTrigger -Daily -At $At

        # delegate
        CheckTask $TaskName $Description $Trigger
    }
}
