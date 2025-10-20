if (-not $IsWindows) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}

$osVersion = [System.Environment]::OSVersion.Version
$major = $osVersion.Major

if ($major -ne 10) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}



. "$PSScriptRoot\Functions\GenXdev.Windows\CurrentUserHasElevatedRights.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\EnsureDockerDesktop.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\EnsurePSTools.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Get-KnownFolderPath.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Get-WindowPosition.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Initialize-ScheduledTaskScripts.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Invoke-WindowsUpdate.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Pop-Window.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Push-Window.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Send-Key.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Set-ClipboardFiles.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Set-KnownFolderPath.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Set-WindowPosition.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows\Set-WindowPositionForSecondary.ps1"
