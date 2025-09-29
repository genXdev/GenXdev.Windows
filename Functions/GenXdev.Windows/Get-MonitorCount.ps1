<##############################################################################
Part of PowerShell module : GenXdev.Windows
Original cmdlet filename  : Get-MonitorCount.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.288.2025
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
Gets the total number of display monitors connected to the system.

.DESCRIPTION
Uses the Windows Presentation Foundation (WPF) Screen helper class to accurately
determine the number of physical display monitors currently connected to the
system. This includes both active and detected but disabled monitors.

.EXAMPLE
Get-MonitorCount
Returns the total number of connected monitors (e.g. 2)

.EXAMPLE
$screens = Get-MonitorCount -Verbose
Returns monitor count with verbose output showing detection process
#>
function Get-MonitorCount {

    [CmdletBinding()]
    param()

    begin {
        Microsoft.PowerShell.Utility\Write-Verbose 'Starting monitor detection using WpfScreenHelper.Screen'
    }


    process {

        # use wpf screen helper to get array of all connected display monitors
        $screenCount = @([WpfScreenHelper.Screen]::AllScreens).Count

        Microsoft.PowerShell.Utility\Write-Verbose "Detected $screenCount physical monitor(s) connected"

        # return the total number of monitors found
        $screenCount
    }

    end {
    }
}