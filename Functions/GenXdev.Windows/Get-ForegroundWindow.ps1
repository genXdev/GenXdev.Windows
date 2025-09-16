<##############################################################################
Part of PowerShell module : GenXdev.Windows
Original cmdlet filename  : Get-ForegroundWindow.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.264.2025
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