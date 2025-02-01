###############################################################################

function Get-MonitorCount {

    @([WpfScreenHelper.Screen]::AllScreens).Count
}
