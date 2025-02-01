###############################################################################

function Set-ForegroundWindow {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [IntPtr] $WindowHandle
    )

    try {

        [void] [GenXdev.Helpers.WindowObj]::SwitchToThisWindow($WindowHandle, $false);
    }
    catch {

    }
    try {

        [void] [GenXdev.Helpers.WindowObj]::SetForegroundWindow($WindowHandle)
    }
    catch {

    }
}
