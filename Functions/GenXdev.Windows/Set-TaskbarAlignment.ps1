<##############################################################################
Part of PowerShell module : GenXdev.Windows
Original cmdlet filename  : Set-TaskbarAlignment.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.264.2025
################################################################################
MIT License

Copyright 2021-2025 GenXdev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
################################################################################>
###############################################################################
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
Sets the Windows 11 taskbar to left alignment

.EXAMPLE
Set-TaskAlign Center -WhatIf
Shows what would happen if taskbar was set to center alignment
#>
function Set-TaskbarAlignment {

    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = 'The taskbar alignment (Center or Left)'
        )]
        [ValidateSet('Center', 'Left')]
        [string] $Justify
        ########################################################################
    )

    begin {

        # store the registry path for taskbar settings
        $regPath = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced'

        # log the requested alignment change for troubleshooting
        Microsoft.PowerShell.Utility\Write-Verbose "Setting taskbar alignment to: $Justify"
    }


    process {

        # convert the alignment choice to its corresponding registry value
        $value = if ($Justify -eq 'Left') { 0 } else { 1 }

        # check if we should proceed with the registry modification
        if ($PSCmdlet.ShouldProcess(
                'Windows Taskbar Alignment',
                "Set alignment to $Justify"
            )) {

            # update the registry key
            $null = Microsoft.PowerShell.Management\Set-ItemProperty -Path $regPath `
                -Name 'TaskbarAl' `
                -Value $value

            Microsoft.PowerShell.Utility\Write-Verbose "Registry value 'TaskbarAl' set to: $value"
        }
    }

    end {
    }
}