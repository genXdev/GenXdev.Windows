################################################################################

<#
.SYNOPSIS
Sets the alignment for the Windows 11+ Taskbar.

.DESCRIPTION
Modifies the Windows Registry to change the taskbar alignment in Windows 11 and
newer versions between center and left positions.

.PARAMETER Justify
Specifies the taskbar alignment. Valid values are 'Center' or 'Left'.

.EXAMPLE
Set-TaskbarAlignment -Justify Left

.EXAMPLE
Set-TaskbarAlignment Center
#>
function Set-TaskbarAlignment {

    [CmdletBinding()]
    [Alias("Set-TaskAlign")]

    param(
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = "The taskbar alignment (Center or Left)"
        )]
        [ValidateSet("Center", "Left")]
        [string] $Justify
    )

    begin {

        # define the registry path for taskbar settings
        $regPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"

        Write-Verbose "Setting taskbar alignment to: $Justify"
    }

    process {

        # set registry value: 0 for Left, 1 for Center alignment
        $value = if ($Justify -eq "Left") { 0 } else { 1 }

        # modify the registry to change taskbar alignment
        $null = Set-ItemProperty -Path $regPath -Name "TaskbarAl" -Value $value

        Write-Verbose "Registry value 'TaskbarAl' set to: $value"
    }

    end {
    }
}

################################################################################
