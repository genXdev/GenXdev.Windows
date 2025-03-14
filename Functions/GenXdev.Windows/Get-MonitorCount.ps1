################################################################################
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
        Write-Verbose "Starting monitor detection using WpfScreenHelper.Screen"
    }

    process {

        # use wpf screen helper to get array of all connected display monitors
        $screenCount = @([WpfScreenHelper.Screen]::AllScreens).Count

        Write-Verbose "Detected $screenCount physical monitor(s) connected"

        # return the total number of monitors found
        $screenCount
    }

    end {
    }
}
################################################################################