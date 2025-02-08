################################################################################
<#
.SYNOPSIS
Starts a process with a specified priority level.

.DESCRIPTION
Launches an executable with a customizable priority level and provides options for
waiting and process handling.

.PARAMETER FilePath
The path to the executable file to run.

.PARAMETER ArgumentList
Optional arguments to pass to the executable.

.PARAMETER Priority
The priority level for the process. Valid values are: Idle, BelowNormal, Low,
Normal, AboveNormal, High, RealTime. Defaults to BelowNormal.

.PARAMETER NoWait
If specified, doesn't wait for the process to complete.

.PARAMETER PassThru
If specified, returns the process object.

.EXAMPLE
Start-ProcessWithPriority -FilePath "notepad.exe" -Priority "Low"

.EXAMPLE
nice notepad.exe -Priority High
#>
function Start-ProcessWithPriority {

    [CmdletBinding()]
    [Alias("nice")]

    param (
        ########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            HelpMessage = "Path to the executable to run"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $FilePath,
        ########################################################################
        [Parameter(
            Position = 1,
            Mandatory = $false,
            HelpMessage = "Arguments to pass to the executable"
        )]
        [string[]] $ArgumentList = "",
        ########################################################################
        [Parameter(
            Position = 2,
            Mandatory = $false,
            HelpMessage = "Process priority level"
        )]
        [ValidateSet(
            "Idle",
            "BelowNormal",
            "Low",
            "Normal",
            "AboveNormal",
            "High",
            "RealTime"
        )]
        [string] $Priority = "BelowNormal",
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Don't wait for process completion"
        )]
        [switch] $NoWait,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Return the process object"
        )]
        [switch] $PassThru
        ########################################################################
    )

    begin {
        Write-Verbose "Starting process '$FilePath' with priority '$Priority'"
    }

    process {
        # start the process and get its handle
        $process = Start-Process `
            -FilePath $FilePath `
            -ArgumentList $ArgumentList `
            -PassThru `
            -NoNewWindow

        # verify process started successfully
        if ($null -eq $process) {
            Write-Warning "Failed to start process '$FilePath'"
            return
        }

        # set the process priority
        $process.PriorityClass = $Priority
        Write-Verbose "Process started with ID: $($process.Id)"

        # return early if NoWait is specified
        if ($NoWait) {
            Write-Verbose "Not waiting for process completion"
            return
        }

        # wait for process to complete
        Write-Verbose "Waiting for process to complete"
        $process.WaitForExit()

        # return process object if PassThru is specified
        if ($PassThru) {
            Write-Verbose "Returning process object"
            return $process
        }
    }

    end {
    }
}
################################################################################
