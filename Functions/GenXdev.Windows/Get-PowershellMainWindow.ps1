###############################################################################

<#
.SYNOPSIS
Returns a window helper object for the mainwindow of the process responsible for hosting the Powershell terminal

.DESCRIPTION
Returns a window helper object for the mainwindow of the process responsible for hosting the Powershell terminal
#>
function Get-PowershellMainWindow {

    [CmdletBinding()]

    param()

    [GenXdev.Helpers.WindowObj]::GetMainWindow((Get-PowershellMainWindowProcess))[0];
}
