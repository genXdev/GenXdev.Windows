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