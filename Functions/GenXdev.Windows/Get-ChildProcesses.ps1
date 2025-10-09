<##############################################################################
Part of PowerShell module : GenXdev.Windows
Original cmdlet filename  : Get-ChildProcesses.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.300.2025
################################################################################
Copyright (c)  René Vaessen / GenXdev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
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