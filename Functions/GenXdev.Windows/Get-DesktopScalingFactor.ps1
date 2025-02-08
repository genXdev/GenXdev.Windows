################################################################################
<#
.SYNOPSIS
Returns the scaling factor configured for a monitor.

.DESCRIPTION
Returns the Windows display scaling factor (DPI setting) that is configured for
the specified monitor. If no monitor is specified, returns the scaling factor for
the primary monitor.

.PARAMETER Monitor
The index of the monitor to check (0-based). The primary monitor is 0.

.EXAMPLE
Get-DesktopScalingFactor -Monitor 0
Returns the scaling factor for the primary monitor

.EXAMPLE
Get-DesktopScalingFactor 1
Returns the scaling factor for the second monitor
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
        [ValidateRange(0, 32)]
        [int] $Monitor = 0
        ########################################################################
    )

    begin {

        Write-Verbose "Getting scaling factor for monitor index: $Monitor"
    }

    process {

        # call the native method to get the scaling factor
        [GenXdev.Helpers.DesktopInfo]::getScalingFactor($Monitor)
    }

    end {
    }
}
################################################################################
