###############################################################################

<#
.SYNOPSIS
Returns the scaling factor that is configured for a monitor

.DESCRIPTION
Returns the scaling factor that is configured for a monitor

.PARAMETER monitor
The monitor to return the scaling factor for, or if not supplied the primary monitor is used
#>
function Get-DesktopScalingFactor {

    [CmdletBinding()]

    param(
        [parameter(Mandatory = $false, Position = 0)]
        [int] $monitor = 0
    )

    [GenXdev.Helpers.DesktopInfo]::getScalingFactor($monitor)
}
