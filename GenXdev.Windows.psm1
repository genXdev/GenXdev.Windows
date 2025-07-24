if (-not $IsWindows) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}

$osVersion = [System.Environment]::OSVersion.Version
$major = $osVersion.Major
$build = $osVersion.Build

if ($major -ne 10) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}


. "$PSScriptRoot\Functions\GenXdev.Windows\CurrentUserHasElevatedRights.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\EnsureDockerDesktop.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\EnsurePSTools.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Get-ActiveUser.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Get-ChildProcesses.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Get-ClipboardFiles.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Get-CurrentFocusedProcess.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Get-DesktopScalingFactor.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Get-ForegroundWindow.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Get-KnownFolderPath.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Get-MonitorCount.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Get-MpCmdRunPath.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Get-OpenedFileHandleProcesses.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Get-PowershellMainWindow.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Get-PowershellMainWindowProcess.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Get-Window.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Initialize-ScheduledTaskScripts.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Pop-Window.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Push-Window.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Send-Key.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Set-ClipboardFiles.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Set-ForegroundWindow.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Set-KnownFolderPath.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Set-TaskbarAlignment.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Set-WindowPosition.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Set-WindowPositionForSecondary.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Set-WindowsWallpaper.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Start-ProcessWithPriority.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Test-PathUsingWindowsDefender.ps1"
