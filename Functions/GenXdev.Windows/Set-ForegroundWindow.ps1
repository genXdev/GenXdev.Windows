<##############################################################################
Part of PowerShell module : GenXdev.Windows
Original cmdlet filename  : Set-ForegroundWindow.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.268.2025
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
Brings the specified window to the foreground and makes it the active window.

.DESCRIPTION
Makes a window the foreground window using multiple Win32 API methods for maximum
reliability. First attempts using SwitchToThisWindow API, then falls back to
SetForegroundWindow if needed. This dual approach ensures consistent window
activation across different Windows versions and scenarios.

.PARAMETER WindowHandle
An IntPtr handle to the target window. This handle can be obtained from Windows
API calls or PowerShell window management functions like Get-Process
MainWindowHandle.

.EXAMPLE
Make Notepad the active window using full parameter name
$hwnd = (Get-Process notepad).MainWindowHandle
Set-ForegroundWindow -WindowHandle $hwnd -WhatIf

.EXAMPLE
Using positional parameter for simpler syntax
$hwnd = (Get-Process notepad).MainWindowHandle
Set-ForegroundWindow $hwnd
#>
function Set-ForegroundWindow {

    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = 'Window handle to set as foreground window'
        )]
        [IntPtr] $WindowHandle
        ########################################################################
    )

    begin {
        # log the activation attempt with the window handle
        Microsoft.PowerShell.Utility\Write-Verbose "Attempting to set foreground window for handle: $WindowHandle"
    }


    process {

        if ($PSCmdlet.ShouldProcess("Window $WindowHandle", 'Set as foreground window')) {

            try {
                # try the preferred SwitchToThisWindow API first as it's more reliable
                Microsoft.PowerShell.Utility\Write-Verbose 'Attempting primary method: SwitchToThisWindow...'
                $null = [GenXdev.Helpers.WindowObj]::SwitchToThisWindow($WindowHandle, $false)
            }
            catch {
                # log failure of primary activation method
                Microsoft.PowerShell.Utility\Write-Verbose "SwitchToThisWindow failed: $($_.Exception.Message)"
            }

            try {
                # attempt SetForegroundWindow as fallback if first method failed
                Microsoft.PowerShell.Utility\Write-Verbose 'Attempting fallback method: SetForegroundWindow...'
                $null = [GenXdev.Helpers.WindowObj]::SetForegroundWindow($WindowHandle)
            }
            catch {
                # log failure of backup activation method
                Microsoft.PowerShell.Utility\Write-Verbose "SetForegroundWindow failed: $($_.Exception.Message)"
            }
        }
    }

    end {
    }
}