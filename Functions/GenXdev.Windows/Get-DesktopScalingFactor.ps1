################################################################################
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
#>
function Get-DesktopScalingFactor {

    [CmdletBinding()]
    param(
        ########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $false,
            HelpMessage = "The monitor index to check (0 = primary monitor)"
        )]
        [ValidateRange(0, 99)]
        [int] $Monitor = 0
        ########################################################################
    )

    begin {

        # log the requested monitor index for troubleshooting
        Write-Verbose "Getting scaling factor for monitor index: $Monitor"
    }

    process {

        # invoke the native method to retrieve the current scaling factor
        # uses the GenXdev.Helpers.DesktopInfo class's static method
        [GenXdev.Helpers.DesktopInfo]::getScalingFactor($Monitor)
    }

    end {
    }
}
################################################################################
