################################################################################
<#
.SYNOPSIS
Starts a process with a specified priority level.

.DESCRIPTION
Launches an executable with a customizable priority level and provides options for
waiting and process handling. This function wraps Start-Process with additional
functionality to control process priority and execution behavior.

.PARAMETER FilePath
The path to the executable file to run. This parameter is mandatory and must
contain a valid path to an executable file.

.PARAMETER ArgumentList
Arguments to pass to the executable. Multiple arguments can be provided as an
array of strings.

.PARAMETER Priority
Sets the process priority level. Valid values are: Idle, BelowNormal, Low,
Normal, AboveNormal, High, RealTime. Defaults to BelowNormal. Higher priorities
may impact system performance.

.PARAMETER NoWait
Switch to determine if the function should wait for process completion. When
specified, the function returns immediately after starting the process.

.PARAMETER PassThru
Switch to return the process object after creation. Useful when you need to
manipulate the process after it starts.

.EXAMPLE
Start-ProcessWithPriority -FilePath "notepad.exe" -Priority "Low" -NoWait

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

        # log the start of process execution with priority level
        Write-Verbose "Starting process '$FilePath' with priority '$Priority'"
    }

    process {

        # launch the process with specified parameters and capture its handle
        $process = Start-Process `
            -FilePath $FilePath `
            -ArgumentList $ArgumentList `
            -PassThru `
            -NoNewWindow

        # ensure the process started successfully
        if ($null -eq $process) {
            Write-Warning "Failed to start process '$FilePath'"
            return
        }

        # apply the requested priority level to the running process
        $process.PriorityClass = $Priority
        Write-Verbose "Process started with ID: $($process.Id)"

        # return early if immediate execution is requested
        if ($NoWait) {
            Write-Verbose "Not waiting for process completion"
            return
        }

        # block execution until the process completes
        Write-Verbose "Waiting for process to complete"
        $process.WaitForExit()

        # return process information if requested
        if ($PassThru) {
            Write-Verbose "Returning process object"
            return $process
        }
    }

    end {
    }
}
################################################################################
