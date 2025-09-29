<##############################################################################
Part of PowerShell module : GenXdev.Windows
Original cmdlet filename  : Get-DesktopScalingFactor.ps1
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
Retrieves the Windows display scaling factor (DPI setting) for a specified monitor.

.DESCRIPTION
Gets the current Windows display scaling factor configured for a monitor in the
system. The scaling factor is expressed as a percentage where 100 represents
standard scaling (96 DPI). Common values are 100, 125, 150, and 200.
If no monitor is specified, returns the scaling factor for the primary display.

.PARAMETER Monitor
Specifies the zero-based index of the monitor to check. The primary monitor is
index 0, secondary monitor is 1, and so on. Valid values range from 0 to 32.

.EXAMPLE
Get-DesktopScalingFactor -Monitor 0
Returns the scaling factor percentage for the primary monitor

.EXAMPLE
Get-DesktopScalingFactor 1
Returns the scaling factor percentage for the second monitor using positional
parameter
###############################################################################>
function Get-DesktopScalingFactor {

    [CmdletBinding()]
    [OutputType([System.Single])]
    param(
        ########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $false,
            HelpMessage = 'The monitor index to check (0 = primary monitor)'
        )]
        [ValidateRange(0, 99)]
        [Alias('m', 'mon')]
        [int] $Monitor = 0
        ########################################################################
    )

    begin {

        # log the requested monitor index for troubleshooting
        Microsoft.PowerShell.Utility\Write-Verbose "Getting scaling factor for monitor index: $Monitor"
    }


    process {

        # invoke the native method to retrieve the current scaling factor
        # uses the GenXdev.Helpers.DesktopInfo class's static method
        [GenXdev.Helpers.DesktopInfo]::getScalingFactor($Monitor)
    }

    end {
    }
}