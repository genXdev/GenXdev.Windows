###############################################################################
<#
.SYNOPSIS
Gets the handle of the currently active foreground window.

.DESCRIPTION
This function retrieves the window handle (HWND) of the window that is
currently in the foreground and has keyboard focus. It uses Windows API
functions through P/Invoke to interact with the User32.dll library.

.EXAMPLE
Get-ForegroundWindow

Returns the IntPtr handle of the currently active window.

.EXAMPLE
$windowHandle = Get-ForegroundWindow
Write-Host "Active window handle: $windowHandle"

Stores the foreground window handle in a variable and displays it.
#>
function Get-ForegroundWindow {

    [CmdletBinding()]
    param()

    begin {

        # define the windows api functions needed for window handling
        # this adds critical User32.dll method via P/Invoke for getting the
        # currently active window handle
        Microsoft.PowerShell.Utility\Add-Type -TypeDefinition @'
using System;
using System.Runtime.InteropServices;

public class User32FW {
    [DllImport("user32.dll")]
    public static extern IntPtr GetForegroundWindow();
}
'@
    }

    process {

        # output verbose information about the operation being performed
        Microsoft.PowerShell.Utility\Write-Verbose 'Attempting to get foreground window handle'

        # call the windows api to get the handle of the currently active window
        Microsoft.PowerShell.Utility\Write-Output ([User32FW]::GetForegroundWindow())
    }

    end {
    }
}
###############################################################################