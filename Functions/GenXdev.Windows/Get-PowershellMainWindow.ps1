<##############################################################################
Part of PowerShell module : GenXdev.Windows
Original cmdlet filename  : Get-PowershellMainWindow.ps1
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
Returns a window helper object for the PowerShell terminal's main window.

.DESCRIPTION
Retrieves a WindowObj helper object that represents the main window of the current
PowerShell host process. This allows manipulation and interaction with the
terminal window itself.

.OUTPUTS
GenXdev.Helpers.WindowObj
Represents the main window of the PowerShell host process with properties and
methods for window manipulation.
#>
function Get-PowershellMainWindow {

    [CmdletBinding()]
    [OutputType([GenXdev.Helpers.WindowObj])]
    param()

    begin {
        # log the start of the window retrieval process
        Microsoft.PowerShell.Utility\Write-Verbose 'Starting to locate PowerShell main window...'
    }


    process {

        # get the powershell host process using the helper function
        Microsoft.PowerShell.Utility\Write-Verbose 'Retrieving PowerShell host process...'
        $process = GenXdev.Windows\Get-PowershellMainWindowProcess

        # verify we have a valid process before proceeding
        if (($null -eq $process) -or ($process.MainWindowHandle -eq 0)) {

            Microsoft.PowerShell.Utility\Write-Error 'Failed to retrieve a valid PowerShell process with a main window'
            $process = Microsoft.PowerShell.Management\Get-Process -Id $PID
        }

        Microsoft.PowerShell.Utility\Write-Verbose "Found PowerShell host process with ID: $($process.Id) ($($process.ProcessName))"

        # attempt to get the main window handle from the process
        Microsoft.PowerShell.Utility\Write-Verbose 'Attempting to get main window handle...'

        # the C# ResolveEffectiveProcess method now handles all terminal/host scenarios
        # including WindowsTerminal, VS Code, and other IDEs automatically
        $mainWindow = [GenXdev.Helpers.WindowObj]::GetMainWindow($process)[0]

        # verify we have a valid window handle
        if ($null -eq $mainWindow) {
            return $null
        }

        Microsoft.PowerShell.Utility\Write-Verbose "Successfully retrieved main window handle: $($mainWindow.Handle)`r`nTitle: $($mainWindow.Title)"

        # return the window object for manipulation
        $mainWindow
    }

    end {
    }
}