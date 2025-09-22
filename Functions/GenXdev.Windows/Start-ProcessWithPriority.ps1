<##############################################################################
Part of PowerShell module : GenXdev.Windows
Original cmdlet filename  : Start-ProcessWithPriority.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.280.2025
################################################################################
MIT License

Copyright 2021-2025 GenXdev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
################################################################################>
###############################################################################
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

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias('nice')]

    param (
        ########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            HelpMessage = 'Path to the executable to run'
        )]
        [ValidateNotNullOrEmpty()]
        [string] $FilePath,
        ########################################################################
        [Parameter(
            Position = 1,
            Mandatory = $false,
            HelpMessage = 'Arguments to pass to the executable'
        )]
        [string[]] $ArgumentList = '',
        ########################################################################
        [Parameter(
            Position = 2,
            Mandatory = $false,
            HelpMessage = 'Process priority level'
        )]
        [ValidateSet(
            'Idle',
            'BelowNormal',
            'Low',
            'Normal',
            'AboveNormal',
            'High',
            'RealTime'
        )]
        [string] $Priority = 'BelowNormal',
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Don't wait for process completion"
        )]
        [switch] $NoWait,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Return the process object'
        )]
        [switch] $PassThru
        ########################################################################
    )

    begin {
        # log the start of process execution with priority level
        Microsoft.PowerShell.Utility\Write-Verbose "Starting process '$FilePath' with priority '$Priority'"
    }


    process {
        # check if the user wants to proceed with starting the process
        $processDescription = "Start process '$FilePath' with priority '$Priority'"
        if (-not $PSCmdlet.ShouldProcess($processDescription)) {
            return
        }

        # launch the process with specified parameters and capture its handle
        $process = Microsoft.PowerShell.Management\Start-Process `
            -FilePath $FilePath `
            -ArgumentList $ArgumentList `
            -PassThru `
            -NoNewWindow

        # ensure the process started successfully
        if ($null -eq $process) {
            Microsoft.PowerShell.Utility\Write-Warning "Failed to start process '$FilePath'"
            return
        }

        # apply the requested priority level to the running process
        $process.PriorityClass = $Priority
        Microsoft.PowerShell.Utility\Write-Verbose "Process started with ID: $($process.Id)"

        # return early if immediate execution is requested
        if ($NoWait) {
            Microsoft.PowerShell.Utility\Write-Verbose 'Not waiting for process completion'
            if ($PassThru) {
                return $process
            }
            return
        }

        # block execution until the process completes
        Microsoft.PowerShell.Utility\Write-Verbose 'Waiting for process to complete'
        $process.WaitForExit()

        # return process information if requested
        if ($PassThru) {
            Microsoft.PowerShell.Utility\Write-Verbose 'Returning process object'
            return $process
        }
    }

    end {
    }
}