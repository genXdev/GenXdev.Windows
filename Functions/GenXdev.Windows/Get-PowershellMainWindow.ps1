<##############################################################################
Part of PowerShell module : GenXdev.Windows
Original cmdlet filename  : Get-PowershellMainWindow.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.272.2025
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