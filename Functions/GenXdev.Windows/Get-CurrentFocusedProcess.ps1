################################################################################
<#
.SYNOPSIS
Retrieves the process object of the window that has keyboard focus on Windows.

.DESCRIPTION
Uses Windows API calls to identify and return the Process object associated with
the currently focused window in the Windows operating system.

.EXAMPLE
Get-CurrentFocusedProcess

.EXAMPLE
$process = Get-CurrentFocusedProcess
Write-Host "Currently focused window belongs to: $($process.ProcessName)"
#>
function Get-CurrentFocusedProcess {

    [CmdletBinding()]
    param()

    begin {

        # define the required windows api functions
        Add-Type -TypeDefinition @"
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

        # get handle of the foreground window
        Write-Verbose "Getting foreground window handle"
        $foregroundWindow = [User32]::GetForegroundWindow()

        # get the process id of the window
        Write-Verbose "Retrieving process ID from window handle"
        $processId = 0
        $null = [User32]::GetWindowThreadProcessId($foregroundWindow, [ref]$processId)

        if ($processId -ne 0) {

            # attempt to get the process object
            Write-Verbose "Getting process object for ID: $processId"
            $process = Get-Process -Id $processId -ErrorAction SilentlyContinue

            if ($process) {
                Write-Verbose "Found process: $($process.ProcessName)"
                return $process
            }
        }

        Write-Warning "Failed to retrieve the process of the current focused window."
    }

    end {}
}
################################################################################
