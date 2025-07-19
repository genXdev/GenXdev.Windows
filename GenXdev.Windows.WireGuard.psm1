if (-not $IsWindows) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}

$osVersion = [System.Environment]::OSVersion.Version
$major = $osVersion.Major
$build = $osVersion.Build

if ($major -ne 10) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}


. "$PSScriptRoot\Functions\GenXdev.Windows.WireGuard\Add-WireGuardPeer.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows.WireGuard\EnsureWireGuard.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows.WireGuard\Get-WireGuardPeerQRCode.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows.WireGuard\Get-WireGuardPeers.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows.WireGuard\Get-WireGuardStatus.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows.WireGuard\Remove-WireGuardPeer.ps1"
. "$PSScriptRoot\Functions\GenXdev.Windows.WireGuard\Reset-WireGuardConfiguration.ps1"
