###############################################################################
<#
.SYNOPSIS
Retrieves the [Process] object of the window that has keyboard focus on Windows.

.DESCRIPTION
    This function retrieves the [Process] object of the window that currently has keyboard focus on Windows.

.EXAMPLE
    Get-CurrentFocusedProcess
#>

function Get-CurrentFocusedProcess {
    [CmdletBinding()]
    param()

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

    $foregroundWindow = [User32]::GetForegroundWindow()
    $processId = 0
    [User32]::GetWindowThreadProcessId($foregroundWindow, [ref]$processId)

    if ($processId -ne 0) {
        $process = Get-Process -Id $processId -ErrorAction SilentlyContinue
        if ($process) {
            return $process
        }
    }

    Write-Warning "Failed to retrieve the process of the current focused window."
}
