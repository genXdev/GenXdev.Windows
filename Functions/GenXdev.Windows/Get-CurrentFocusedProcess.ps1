###############################################################################
<#
.SYNOPSIS
Retrieves the process object of the window that currently has keyboard focus.

.DESCRIPTION
This function uses Windows API calls through P/Invoke to identify and return the
Process object associated with the currently focused window. It leverages the
User32.dll functions GetForegroundWindow and GetWindowThreadProcessId to determine
which window has focus and obtain its associated process ID.

.EXAMPLE
$focusedProcess = Get-CurrentFocusedProcess
Write-Host "Active window process: $($focusedProcess.ProcessName)"

.NOTES
Requires Windows operating system as it uses Windows-specific API calls.
May return null if the process cannot be accessed due to permissions.
###############################################################################>
function Get-CurrentFocusedProcess {

    [CmdletBinding()]
    param()

    begin {
        # define the windows api functions needed for window handling
        # this adds two critical User32.dll methods via P/Invoke:
        # - GetForegroundWindow: gets handle of active window
        # - GetWindowThreadProcessId: gets process ID from window handle
        Microsoft.PowerShell.Utility\Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class User32 {
    [DllImport("user32.dll")]
    public static extern IntPtr GetForegroundWindow();

    [DllImport("user32.dll")]
    public static extern int GetWindowThreadProcessId(IntPtr hWnd, out int processId);
}
"@
    }


process {

        # get the handle to the currently active window
        Microsoft.PowerShell.Utility\Write-Verbose "Attempting to get foreground window handle"
        $foregroundWindow = [User32]::GetForegroundWindow()

        # retrieve the process id associated with the window handle
        Microsoft.PowerShell.Utility\Write-Verbose "Getting process ID from window handle"
        $processId = 0
        $null = [User32]::GetWindowThreadProcessId($foregroundWindow, [ref]$processId)

        # verify we got a valid process id
        if ($processId -ne 0) {

            # attempt to get the process object using the process id
            Microsoft.PowerShell.Utility\Write-Verbose "Retrieving process object for ID: $processId"
            $process = Microsoft.PowerShell.Management\Get-Process -Id $processId -ErrorAction SilentlyContinue

            # return the process if found
            if ($process) {
                Microsoft.PowerShell.Utility\Write-Verbose "Successfully found process: $($process.ProcessName)"
                return $process
            }
        }

        Microsoft.PowerShell.Utility\Write-Warning "Could not retrieve process for the focused window"
    }

    end {
    }
}
        ###############################################################################