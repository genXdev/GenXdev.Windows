################################################################################
<#
.SYNOPSIS
Gets the number of monitors connected to the system.

.DESCRIPTION
Uses WPF Screen Helper to determine the number of connected display monitors.

.EXAMPLE
Get-MonitorCount
#>
function Get-MonitorCount {

    [CmdletBinding()]
    param()

    begin {

        Write-Verbose "Retrieving monitor count using WpfScreenHelper.Screen"
    }

    process {

        # get the count of all connected screens
        $screenCount = @([WpfScreenHelper.Screen]::AllScreens).Count

        Write-Verbose "Found $screenCount monitor(s)"

        # return the screen count
        $screenCount
    }

    end {
    }
}
################################################################################
