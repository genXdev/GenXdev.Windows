################################################################################
<#
.SYNOPSIS
Configures Windows 11+ taskbar alignment between center and left positions.

.DESCRIPTION
Sets the taskbar alignment in Windows 11 and newer versions by modifying the
registry key 'TaskbarAl' under HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\
Explorer\Advanced. The alignment can be set to either center (value 1) or left
(value 0).

.PARAMETER Justify
Specifies the desired taskbar alignment: 'Center' or 'Left'. This setting is
converted to the appropriate registry value (1 for Center, 0 for Left).

.EXAMPLE
Set-TaskbarAlignment -Justify Left
# Sets the Windows 11 taskbar to left alignment

.EXAMPLE
Set-TaskAlign Center -WhatIf
# Shows what would happen if taskbar was set to center alignment
#>
function Set-TaskbarAlignment {

    [CmdletBinding(SupportsShouldProcess = $true)]
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
        ########################################################################
    )

    begin {

        # store the registry path for taskbar settings
        $regPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"

        # log the requested alignment change for troubleshooting
        Write-Verbose "Setting taskbar alignment to: $Justify"
    }

    process {

        # convert the alignment choice to its corresponding registry value
        $value = if ($Justify -eq "Left") { 0 } else { 1 }

        # check if we should proceed with the registry modification
        if ($PSCmdlet.ShouldProcess(
                "Windows Taskbar Alignment",
                "Set alignment to $Justify"
            )) {

            # update the registry key
            $null = Set-ItemProperty -Path $regPath `
                -Name "TaskbarAl" `
                -Value $value

            Write-Verbose "Registry value 'TaskbarAl' set to: $value"
        }
    }

    end {
    }
}
################################################################################
