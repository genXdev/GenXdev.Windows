<##############################################################################
Part of PowerShell module : GenXdev.Windows
Original cmdlet filename  : Get-CurrentFocusedProcess.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.298.2025
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
        Microsoft.PowerShell.Utility\Add-Type -TypeDefinition @'
using System;
using System.Runtime.InteropServices;

public class User32 {
    [DllImport("user32.dll")]
    public static extern IntPtr GetForegroundWindow();

    [DllImport("user32.dll")]
    public static extern int GetWindowThreadProcessId(IntPtr hWnd, out int processId);
}
'@
    }


    process {

        # get the handle to the currently active window
        Microsoft.PowerShell.Utility\Write-Verbose 'Attempting to get foreground window handle'
        $foregroundWindow = [User32]::GetForegroundWindow()

        # retrieve the process id associated with the window handle
        Microsoft.PowerShell.Utility\Write-Verbose 'Getting process ID from window handle'
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

        Microsoft.PowerShell.Utility\Write-Warning 'Could not retrieve process for the focused window'
    }

    end {
    }
}