<##############################################################################
Part of PowerShell module : GenXdev.Windows
Original cmdlet filename  : Set-WindowsWallpaper.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.270.2025
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
################################################################################
<#
.SYNOPSIS
Sets a random wallpaper from a specified directory.

.DESCRIPTION
Selects a random image file from the specified directory and sets it as the
Windows desktop wallpaper. Supports JPG/JPEG image formats and configures the
wallpaper to "fit" the screen by default.

.PARAMETER InputObject
The file path pattern to search for wallpaper images. Supports wildcards and
recursive search. This is the path to the directory containing the wallpaper
images. When multiple images are found, one is selected at random.

.PARAMETER AllDrives
Search across all available drives.

.PARAMETER NoRecurse
Do not recurse into subdirectories.

.EXAMPLE
Set-WindowsWallpaper -InputObject "C:\Wallpapers\*.jpg"
Sets a random wallpaper from the specified directory.

.EXAMPLE
nextbg
Sets a random wallpaper from the default wallpaper directory.
#>
function Set-WindowsWallpaper {
    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias("setaswallpaper")]
    param (
        ###############################################################################
        <#
        .PARAMETER InputObject
        The file path pattern to search for wallpaper images. Supports wildcards and
        recursive search. This is the path to the directory containing the wallpaper
        images. When multiple images are found, one is selected at random.
        #>
        [Parameter(
            Position = 0,
            Mandatory = $false,
            HelpMessage = 'Path to the directory containing the wallpaper images',
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [Alias('Path', 'FullName', 'FilePath', 'Input')]
        [Object] $InputObject = '.\',
        ###############################################################################
        <#
        .PARAMETER AllDrives
        Search across all available drives.
        #>
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Search across all available drives'
        )]

        [switch] $AllDrives,
        ###############################################################################
        <#
        .PARAMETER NoRecurse
        Do not recurse into subdirectories.
        #>
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Do not recurse into subdirectories'
        )]
        [switch] $NoRecurse
        ###############################################################################
    )

    begin {

        $params = GenXdev.Helpers\Copy-IdenticalParamValues `
            -BoundParameters $PSBoundParameters `
            -FunctionName 'GenXdev.FileSystem\ResolveInputObjectFileNames' `
            -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable -Scope Local -ErrorAction SilentlyContinue)

        $fileNames = @(GenXdev.FileSystem\ResolveInputObjectFileNames @params -InputObject $InputObject);
    }

    process {

        # expand input file names, select a random file, and process it
        $fileNames |
            # select a random file from the expanded list
            Microsoft.PowerShell.Utility\Get-Random |
            # ensure only one file is selected
            Microsoft.PowerShell.Utility\Select-Object -First 1 |
            Microsoft.PowerShell.Core\ForEach-Object {

                # expand the path of the selected file
                $file = GenXdev.FileSystem\Expand-Path $_

                # if the file is a FileInfo object, get its full path
                # ensures compatibility with registry calls
                if ($file -is [System.IO.FileInfo]) {
                    $file = $file.FullName
                }

                # show the selected wallpaper path for debugging
                Microsoft.PowerShell.Utility\Write-Verbose (
                    "Selected wallpaper: $file"
                )

                # ShouldProcess support for state-changing operation
                if ($PSCmdlet.ShouldProcess($file, 'Set Windows wallpaper')) {
                    # set wallpaper style to fit the screen (10 = fit, 0 = center)
                    # configures the wallpaper to "fit" the desktop
                    $wallpaperStyle = '10'

                    # set tile wallpaper to off (0 = off)
                    # disables wallpaper tiling
                    $tileWallpaper = '0'

                    # update the registry with the new wallpaper path
                    # sets the actual wallpaper file
                    Microsoft.PowerShell.Management\Set-ItemProperty -Path (
                        'HKCU:\Control Panel\Desktop\'
                    ) `
                        -Name Wallpaper -Value $file

                    # update the registry with the wallpaper style
                    # sets the wallpaper style to fit
                    Microsoft.PowerShell.Management\Set-ItemProperty -Path (
                        'HKCU:\Control Panel\Desktop\'
                    ) `
                        -Name WallpaperStyle -Value $wallpaperStyle

                    # update the registry with the tile wallpaper setting
                    # disables wallpaper tiling in the registry
                    Microsoft.PowerShell.Management\Set-ItemProperty -Path (
                        'HKCU:\Control Panel\Desktop\'
                    ) `
                        -Name TileWallpaper -Value $tileWallpaper

                    # define a C# class to access the Windows API for updating wallpaper
                    # enables immediate wallpaper refresh without logoff
                    try {
                        Microsoft.PowerShell.Utility\Add-Type -ErrorAction SilentlyContinue -TypeDefinition @'
    using System;
    using System.Runtime.InteropServices;

    public class Wallpaper {
        [DllImport("user32.dll", CharSet=CharSet.Auto)]
        public static extern int SystemParametersInfo (
            int uAction, int uParam, string lpvParam, int fuWinIni);
    }
'@
                    }
                    catch {}
                    # apply the wallpaper changes using the Windows API
                    # 20 = SPI_SETDESKWALLPAPER
                    # 0x1 | 0x2 = SPIF_UPDATEINIFILE | SPIF_SENDWININICHANGE
                    # triggers the desktop to update immediately
                    [Wallpaper]::SystemParametersInfo(20, 0, $file, 0x1 -bor 0x2)

                    # inform the user that the wallpaper has been updated
                    Microsoft.PowerShell.Utility\Write-Verbose (
                        'Wallpaper has been updated successfully'
                    )
                }
            }
    }

    end {

    }
}
################################################################################