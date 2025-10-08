<##############################################################################
Part of PowerShell module : GenXdev.Windows
Original cmdlet filename  : EnsurePSTools.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.298.2025
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
Ensures Sysinternals tools (PSTools) are installed and available.

.DESCRIPTION
Verifies if Sysinternals tools like handle.exe are installed and properly
configured on the system. If not found, installs the Sysinternals Suite
using WinGet and handles the complete installation process automatically.

.PARAMETER Force
Switch to force reinstallation of Sysinternals tools even if they are already
installed.

.PARAMETER PSExeName
The executable name to check for verifying Sysinternals tools installation.
Default is 'handle.exe'.

.EXAMPLE
EnsurePSTools
Ensures Sysinternals tools are installed and properly configured.

.EXAMPLE
EnsurePSTools -Force -PSExeName 'procexp.exe'
Forces reinstallation of Sysinternals tools and uses procexp.exe to verify
installation.
###############################################################################>
function EnsurePSTools {

    [CmdletBinding()]
    param(
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Force reinstallation of Sysinternals tools'
        )]
        [switch]$Force,
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 0,
            HelpMessage = 'The executable name to verify installation'
        )]
        [string]$PSExeName = 'handle.exe'
        ########################################################################
    )

    begin {

        ########################################################################
        <#
        .SYNOPSIS
        Checks if the WinGet PowerShell module is installed.

        .DESCRIPTION
        Attempts to import the Microsoft.WinGet.Client module and verifies its
        presence by checking if the module is loaded after import.

        .EXAMPLE
        IsWinGetInstalled
        Returns $true if Microsoft.WinGet.Client module is installed, otherwise $false.
        #>
        function IsWinGetInstalled {

            # attempt to load the winget module silently
            Microsoft.PowerShell.Core\Import-Module 'Microsoft.WinGet.Client' `
                -ErrorAction SilentlyContinue

            # verify if module was loaded successfully
            $ModuleObj = Microsoft.PowerShell.Core\Get-Module 'Microsoft.WinGet.Client' `
                -ErrorAction SilentlyContinue

            # return true if module exists, false otherwise
            return $null -ne $ModuleObj
        }

        ########################################################################
        <#
        .SYNOPSIS
        Installs the WinGet PowerShell module.

        .DESCRIPTION
        Installs and imports the Microsoft.WinGet.Client module for package
        management using PowerShellGet.

        .EXAMPLE
        InstallWinGet
        Installs and imports the Microsoft.WinGet.Client module.
        #>
        function InstallWinGet {

            # request consent before installing winget module
            $wingetConsent = GenXdev.FileSystem\Confirm-InstallationConsent `
                -ApplicationName 'Microsoft.WinGet.Client PowerShell Module' `
                -Source 'PowerShell Gallery' `
                -Description 'Required for automated software package management via WinGet' `
                -Publisher 'Microsoft'

            if (-not $wingetConsent) {
                throw 'Installation consent denied for Microsoft.WinGet.Client PowerShell module'
            }

            # log installation progress through verbose messages
            Microsoft.PowerShell.Utility\Write-Verbose 'Installing WinGet PowerShell client...'

            # install winget module with force parameter to ensure success
            $null = PowerShellGet\Install-Module 'Microsoft.WinGet.Client' -Force -AllowClobber

            # load the newly installed module into the current session
            Microsoft.PowerShell.Core\Import-Module 'Microsoft.WinGet.Client'
        }
    }

    process {

        # check if we should install/reinstall based on force flag or missing executable
        if ($Force -or (@(Microsoft.PowerShell.Core\Get-Command $PSExeName `
                        -ErrorAction SilentlyContinue).Length -eq 0)) {

            # request consent before installing sysinternals packages
            $sysinternalsConsent = GenXdev.FileSystem\Confirm-InstallationConsent `
                -ApplicationName 'Microsoft Sysinternals Suite' `
                -Source 'WinGet' `
                -Description 'System administration and diagnostic tools (handle.exe, procexp.exe, etc.)' `
                -Publisher 'Microsoft'

            if (-not $sysinternalsConsent) {
                throw 'Installation consent denied for Microsoft Sysinternals Suite. Cannot proceed without system tools.'
            }

            # inform user about installation process starting
            Microsoft.PowerShell.Utility\Write-Host 'Installing Sysinternals packages...'

            # make sure winget module is available before proceeding
            if (-not (IsWinGetInstalled)) {
                InstallWinGet
            }

            # search for available sysinternals packages using winget
            $sysinternalsPackages = Microsoft.WinGet.Client\Find-WinGetPackage `
                -Name 'Microsoft.Sysinternals' |
                Microsoft.PowerShell.Core\Where-Object {
                    $_.Id -like 'Microsoft.Sysinternals*'
                }

            # install each found sysinternals package
            foreach ($package in $sysinternalsPackages) {
                try {
                    # log which package is being installed
                    Microsoft.PowerShell.Utility\Write-Verbose (
                        "Installing $($package.Name) ($($package.Id))..."
                    )

                    # install the package with force to ensure success
                    $null = Microsoft.WinGet.Client\Install-WinGetPackage -Id $package.Id -Force
                }
                catch {
                    # log any installation failures with details
                    Microsoft.PowerShell.Utility\Write-Warning (
                        "Failed to install $($package.Name): $($_.Exception.Message)"
                    )
                }
            }

            # verify installation succeeded unless force was specified
            if (-not $Force -and (-not (Microsoft.PowerShell.Core\Get-Command $PSExeName `
                            -ErrorAction SilentlyContinue))) {
                throw "Sysinternals installation failed. $PSExeName not found."
            }
        }

        # log successful completion of the function
        Microsoft.PowerShell.Utility\Write-Verbose '✅ Sysinternals tools are ready.'
    }

    end {
    }
}