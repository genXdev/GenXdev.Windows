<##############################################################################
Part of PowerShell module : GenXdev.Windows
Original cmdlet filename  : Get-ChildProcesses.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.270.2025
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
Retrieves all processes that are descendants of the current PowerShell process.

.DESCRIPTION
Examines all running processes and identifies those that have the current
PowerShell process as an ancestor in their parent process chain. This includes
both direct child processes and their descendants (grandchildren, etc.).

.EXAMPLE
Get all child processes of the current PowerShell session
Get-ChildProcesses

.EXAMPLE
Get child processes and display verbose output
Get-ChildProcesses -Verbose
#>
function Get-ChildProcesses {

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    param()

    begin {

        # log start of process detection
        Microsoft.PowerShell.Utility\Write-Verbose 'Starting child process detection...'

        # store current powershell process id for parent chain comparison
        $currentProcessId = $PID
        Microsoft.PowerShell.Utility\Write-Verbose "Current process ID: $currentProcessId"
    }


    process {

        # get all processes currently running on the system
        $allProcesses = Microsoft.PowerShell.Management\Get-Process
        Microsoft.PowerShell.Utility\Write-Verbose "Retrieved $($allProcesses.Count) total processes"

        # filter processes by checking if current process is in their parent chain
        $allProcesses |
            Microsoft.PowerShell.Core\Where-Object {
                $processToCheck = $_

                # traverse up the parent chain until we find our process or hit top
                while ($null -ne $processToCheck.Parent) {

                    if ($processToCheck.Parent.Id -eq $currentProcessId) {
                        Microsoft.PowerShell.Utility\Write-Verbose ("Found child process: $($processToCheck.Name) " + `
                                "ID: $($processToCheck.Id)")
                        return $true
                    }

                    $processToCheck = $processToCheck.Parent
                }

                return $false
            }
    }

    end {

        Microsoft.PowerShell.Utility\Write-Verbose 'Completed child process detection'
    }
}