        ###############################################################################
function Get-ForegroundWindow {

    [CmdletBinding()]
    param()

    begin {
        # define the windows api functions needed for window handling
        # this adds two critical User32.dll methods via P/Invoke:
        # - GetForegroundWindow: gets handle of active window
        Microsoft.PowerShell.Utility\Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class User32FW {
    [DllImport("user32.dll")]
    public static extern IntPtr GetForegroundWindow();
}
"@
    }


    process {

        # get the handle to the currently active window
        Microsoft.PowerShell.Utility\Write-Verbose "Attempting to get foreground window handle"
        Microsoft.PowerShell.Utility\Write-Output ([User32FW]::GetForegroundWindow())
    }

    end {
    }
}
        ###############################################################################