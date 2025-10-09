<##############################################################################
Part of PowerShell module : GenXdev.Windows
Original cmdlet filename  : Set-ForegroundWindow.ps1
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