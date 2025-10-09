<##############################################################################
Part of PowerShell module : GenXdev.Windows
Original cmdlet filename  : Get-PowershellMainWindowProcess.ps1
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
Returns the process object for the window hosting the PowerShell terminal.

.DESCRIPTION
Traverses up the process tree starting from the current PowerShell process to
locate the parent window responsible for hosting the terminal. If the immediate
parent process doesn't have a main window handle, it searches for similar
processes that do have main windows. This is useful for identifying the actual
terminal window process (like Windows Terminal, ConHost, etc.) that contains
the PowerShell session.

.EXAMPLE
$hostProcess = Get-PowershellMainWindowProcess
Write-Host "PowerShell is hosted in: $($hostProcess.ProcessName)"

Returns the process hosting the current PowerShell session and displays its name.
#>

function Get-PowershellMainWindowProcess {

    [CmdletBinding()]
    param()

    begin {
        # get reference to the powershell process currently executing this code
        $currentProcess = [System.Diagnostics.Process]::GetCurrentProcess()

        # initialize parent tracking, starting with current process
        $parentProcess = $currentProcess.Parent

        # log the starting point of our search
        Microsoft.PowerShell.Utility\Write-Verbose "Starting process tree traversal from: $($currentProcess.ProcessName)"
    }


    process {

        # traverse up process tree until we find a window or hit the root
        while ((($null -ne $parentProcess) -and ($parentProcess.MainWindowHandle -eq 0)) -and
            ($null -ne $parentProcess.Parent)) {

            $parentProcess = $parentProcess.Parent
            Microsoft.PowerShell.Utility\Write-Verbose "Examining parent process: $($parentProcess.ProcessName)"
        }

        # if parent has a main window, use that process
        if (($null -ne $parentProcess) -and ($parentProcess.MainWindowHandle -ne 0)) {

            Microsoft.PowerShell.Utility\Write-Verbose "Found parent with main window: $($parentProcess.ProcessName)"
            return $parentProcess
        }

        return (
            ($parentProcess -and ($parentProcess.MainWindowHandle -ne 0) ?
            $parentProcess : (
                $currentProcess ? $currentProcess : (Microsoft.PowerShell.Management\Get-Process -Id $PID)
            )
            )
        )
    }
}