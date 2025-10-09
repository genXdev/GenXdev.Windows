<##############################################################################
Part of PowerShell module : GenXdev.Windows
Original cmdlet filename  : Get-MonitorCount.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.300.2025
################################################################################
Copyright (c)  René Vaessen / GenXdev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
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