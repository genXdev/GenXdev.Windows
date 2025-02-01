###############################################################################

<#
.SYNOPSIS
Sets the alignment for the Windows 11+ Taskbar

.DESCRIPTION
Sets the alignment for the Windows 11+ Taskbar

.PARAMETER Justify
The new alignment
#>
function Set-TaskbarAlignment() {

    [CmdletBinding()]

    param(
        [Parameter(Mandatory)]
        [ValidateSet(
            "Center",
            "Left"
        )]
        $Justify
    )

    $RegPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"

    if ($Justify -eq "Left") {
        Set-ItemProperty -Path $RegPath -Name TaskbarAl -Value 0
    }
    elseif ($Justify -eq "Center") {
        Set-ItemProperty -Path $RegPath -Name TaskbarAl -Value 1
    }
}
