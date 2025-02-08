################################################################################
<#
.SYNOPSIS
Sets the specified window as the foreground window.

.DESCRIPTION
Attempts to bring the specified window to the foreground using multiple Win32 API
calls for maximum compatibility.

.PARAMETER WindowHandle
The handle to the window that should be brought to the foreground.

.EXAMPLE
Set-ForegroundWindow -WindowHandle $hwnd
#>
function Set-ForegroundWindow {

    [CmdletBinding()]
    param (
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = "Window handle to set as foreground window"
        )]
        [IntPtr] $WindowHandle
        ########################################################################
    )

    begin {

        Write-Verbose "Attempting to set foreground window for handle: $WindowHandle"
    }

    process {

        try {
            # first attempt to switch to the window using SwitchToThisWindow
            Write-Verbose "Attempting SwitchToThisWindow method..."
            $null = [GenXdev.Helpers.WindowObj]::SwitchToThisWindow($WindowHandle, $false)
        }
        catch {
            Write-Verbose "SwitchToThisWindow failed: $($_.Exception.Message)"
        }

        try {
            # second attempt using SetForegroundWindow as fallback
            Write-Verbose "Attempting SetForegroundWindow method..."
            $null = [GenXdev.Helpers.WindowObj]::SetForegroundWindow($WindowHandle)
        }
        catch {
            Write-Verbose "SetForegroundWindow failed: $($_.Exception.Message)"
        }
    }

    end {
    }
}
################################################################################
