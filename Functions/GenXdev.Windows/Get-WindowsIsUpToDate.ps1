################################################################################
<#
.SYNOPSIS
Checks if Windows is up to date and optionally installs available updates.

.DESCRIPTION
This function checks for both Windows updates and winget package updates. It can
display available updates or automatically install them. The function requires
administrative privileges to install Windows updates and can optionally reboot
the system if updates require a restart.

.PARAMETER AutoInstall
Automatically install available Windows and winget updates instead of just
checking for their availability.

.PARAMETER AutoReboot
Automatically reboot the system if installed updates require a restart. This
parameter only has effect when AutoInstall is also specified.

.EXAMPLE
Get-WindowsIsUpToDate

Checks for available Windows and winget updates without installing them.

.EXAMPLE
Get-WindowsIsUpToDate -AutoInstall

Automatically installs all available Windows and winget updates.

.EXAMPLE
updatewindows -AutoInstall -AutoReboot

Installs all updates and reboots automatically if required using the alias.
#>
function Get-WindowsIsUpToDate {

    [CmdletBinding()]
    [OutputType([System.Boolean])]
    [Alias("updatewindows")]

    param(
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Automatically install available Windows updates"
        )]
        [switch] $AutoInstall,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Automatically reboot if updates require a restart"
        )]
        [switch] $AutoReboot
        ###############################################################################
    )

    begin {

        # initialize tracking variable for winget update availability
        [bool] $wingetHasUpdates = $false

        # process winget updates if auto-install is requested
        if ($AutoInstall) {

            # automatically install all available winget packages
            winget update --all --verbose `
                --accept-package-agreements `
                --accept-source-agreements `
                --authentication-mode silent `
                --disable-interactivity `
                --include-unknown

            # verify if any winget updates remain after installation
            try {

                # get list of packages with available upgrades
                $wingetOutput = winget list --upgrade-available `
                    --accept-source-agreements 2>&1

                # parse output to determine if updates are still available
                # filter out header lines and match package data rows
                $wingetHasUpdates = ($wingetOutput |
                    Microsoft.PowerShell.Core\Where-Object {
                        $_ -match "^\S+\s+\S+\s+\S+\s+\S+\s*$" -and
                        $_ -notmatch "^Name\s+Id\s+Version\s+Available"
                    }).Count -gt 0
            }
            catch {

                # assume no updates if winget check fails to avoid false positives
                $wingetHasUpdates = $false

                Microsoft.PowerShell.Utility\Write-Verbose (
                    "Failed to check winget updates: ${_}")
            }
        }
        else {

            # check for available winget updates without installing them
            try {

                # get list of packages with available upgrades
                $wingetOutput = winget list --upgrade-available `
                    --accept-source-agreements 2>&1

                # parse output to identify packages needing updates
                # filter out header lines and match package data rows
                $wingetUpdates = $wingetOutput |
                    Microsoft.PowerShell.Core\Where-Object {
                        $_ -match "^\S+\s+\S+\s+\S+\s+\S+\s*$" -and
                        $_ -notmatch "^Name\s+Id\s+Version\s+Available"
                    }

                $wingetHasUpdates = $wingetUpdates.Count -gt 0

                # display available winget updates when not auto-installing
                if ($wingetHasUpdates -and -not $AutoInstall) {

                    Microsoft.PowerShell.Utility\Write-Host (
                        "Available Winget Updates:") -ForegroundColor Yellow

                    Microsoft.PowerShell.Utility\Write-Host (
                        "=========================") -ForegroundColor Yellow

                    # show header and package information in formatted output
                    $wingetOutput |
                        Microsoft.PowerShell.Core\Where-Object {
                            $_ -match "^Name\s+Id\s+Version\s+Available" -or
                            $_ -match "^\S+\s+\S+\s+\S+\s+\S+\s*$"
                        } |
                        Microsoft.PowerShell.Core\ForEach-Object {
                            Microsoft.PowerShell.Utility\Write-Host $_ `
                                -ForegroundColor White
                        }

                    Microsoft.PowerShell.Utility\Write-Host ""
                }

                # continue execution to also check windows updates
            }
            catch {

                # assume no updates if winget check fails to avoid false positives
                $wingetHasUpdates = $false

                Microsoft.PowerShell.Utility\Write-Verbose (
                    "Failed to check winget updates: ${_}")
            }
        }

        # verify administrative privileges are available for windows updates
        if (-not (GenXdev.Windows\CurrentUserHasElevatedRights)) {

            Microsoft.PowerShell.Utility\Write-Error (
                "This cmdlet requires administrative privileges.")

            # return opposite of winget status to indicate overall system state
            return (-not $wingetHasUpdates)
        }

        # initialize com objects for windows update operations
        try {

            # create main session object for update operations
            $updateSession = Microsoft.PowerShell.Utility\New-Object `
                -ComObject Microsoft.Update.Session

            # create searcher object to find available updates
            $updateSearcher = $updateSession.CreateUpdateSearcher()
        }
        catch {

            Microsoft.PowerShell.Utility\Write-Error (
                "Failed to initialize Windows Update session: ${_}")

            # return opposite of winget status if windows update init fails
            return (-not $wingetHasUpdates)
        }
    }

    process {

        try {

            # search for updates that are not installed and not hidden
            Microsoft.PowerShell.Utility\Write-Verbose (
                "Searching for Windows updates...")

            $searchResult = $updateSearcher.Search("IsInstalled=0 and IsHidden=0")

            $updates = $searchResult.Updates

            # check if any updates were found
            if ($updates.Count -eq 0 -and -not $wingetHasUpdates) {

                Microsoft.PowerShell.Utility\Write-Verbose (
                    "No updates available. System is up to date.")

                return $true
            }

            # return false if updates exist but autoinstall is not requested
            if (-not $AutoInstall) {

                if ($updates.Count -gt 0) {
                    Microsoft.PowerShell.Utility\Write-Host "Available Windows Updates:" -ForegroundColor Cyan
                    Microsoft.PowerShell.Utility\Write-Host "==========================" -ForegroundColor Cyan

                    foreach ($update in $updates) {
                        if (-not $update.IsHidden) {
                            Microsoft.PowerShell.Utility\Write-Host "• $($update.Title)" -ForegroundColor White
                            Microsoft.PowerShell.Utility\Write-Host "  Size: $([math]::Round($update.MaxDownloadSize / 1MB, 2)) MB" -ForegroundColor Gray
                            if ($update.Description) {
                                $description = $update.Description
                                if ($description.Length -gt 100) {
                                    $description = $description.Substring(0, 97) + "..."
                                }
                                Microsoft.PowerShell.Utility\Write-Host "  $description" -ForegroundColor Gray
                            }
                            Microsoft.PowerShell.Utility\Write-Host ""
                        }
                    }

                    Microsoft.PowerShell.Utility\Write-Verbose (
                        "$($updates.Count) Windows updates are available but AutoInstall " +
                        "is not specified.")
                }

                if ($wingetHasUpdates) {
                    Microsoft.PowerShell.Utility\Write-Verbose (
                        "Winget updates are available but AutoInstall is not specified.")
                }

                # inform user how to install the available updates
                if ($updates.Count -gt 0 -or $wingetHasUpdates) {

                    Microsoft.PowerShell.Utility\Write-Host (
                        "To install these updates automatically, use:") `
                        -ForegroundColor Green

                    Microsoft.PowerShell.Utility\Write-Host (
                        "  Get-WindowsIsUpToDate -AutoInstall") `
                        -ForegroundColor Cyan

                    Microsoft.PowerShell.Utility\Write-Host (
                        "  updatewindows -AutoInstall") `
                        -ForegroundColor Cyan

                    Microsoft.PowerShell.Utility\Write-Host ""

                    Microsoft.PowerShell.Utility\Write-Host (
                        "To install and automatically reboot if needed, use:") `
                        -ForegroundColor Green

                    Microsoft.PowerShell.Utility\Write-Host (
                        "  Get-WindowsIsUpToDate -AutoInstall -AutoReboot") `
                        -ForegroundColor Cyan

                    Microsoft.PowerShell.Utility\Write-Host (
                        "  updatewindows -AutoInstall -AutoReboot") `
                        -ForegroundColor Cyan

                    Microsoft.PowerShell.Utility\Write-Host ""
                }

                return $false
            }

            # prepare to install the available updates
            Microsoft.PowerShell.Utility\Write-Verbose (
                "Found $($updates.Count) updates to install.")

            $updatesToInstall = Microsoft.PowerShell.Utility\New-Object -ComObject Microsoft.Update.UpdateColl

            # filter out hidden updates and add valid ones to install collection
            foreach ($update in $updates) {

                if ($update.IsHidden -eq $false) {

                    $null = $updatesToInstall.Add($update)
                }
            }

            # verify we have updates to install after filtering
            if ($updatesToInstall.Count -eq 0) {

                Microsoft.PowerShell.Utility\Write-Verbose (
                    "No valid updates to install after filtering.")

                return $true
            }

            # create downloader and configure it with the filtered updates
            $downloader = $updateSession.CreateUpdateDownloader()

            $downloader.Updates = $updatesToInstall

            # download the updates before installation
            Microsoft.PowerShell.Utility\Write-Verbose "Downloading updates..."

            $downloadResult = $downloader.Download()

            # check if download was successful (result code 2 = success)
            if ($downloadResult.ResultCode -ne 2) {

                Microsoft.PowerShell.Utility\Write-Error (
                    "Failed to download updates. Result code: " +
                    "$($downloadResult.ResultCode)")

                return $false
            }

            # create installer and configure it with the downloaded updates
            $installer = $updateSession.CreateUpdateInstaller()

            $installer.Updates = $updatesToInstall

            # install the downloaded updates
            Microsoft.PowerShell.Utility\Write-Verbose "Installing updates..."

            $installResult = $installer.Install()

            # check if installation was successful (result code 2 = success)
            if ($installResult.ResultCode -ne 2) {

                Microsoft.PowerShell.Utility\Write-Error (
                    "Failed to install updates. Result code: " +
                    "$($installResult.ResultCode)")

                return $false
            }

            # handle reboot requirement if updates need system restart
            if ($installResult.RebootRequired -and $AutoReboot) {

                Microsoft.PowerShell.Utility\Write-Verbose (
                    "Reboot required. Initiating reboot...")

                Microsoft.PowerShell.Management\Restart-Computer -Force

                # return false since system needs reboot to complete updates
                return $false
            }
            elseif ($installResult.RebootRequired) {

                Microsoft.PowerShell.Utility\Write-Verbose (
                    "Reboot required but AutoReboot not specified.")

                return $false
            }

            # search again for remaining updates after installation
            $newSearchResult = $updateSearcher.Search("IsInstalled=0 and IsHidden=0")

            # check if all updates have been successfully installed
            # also consider winget updates in the final determination
            if ($newSearchResult.Updates.Count -eq 0 -and -not $wingetHasUpdates) {

                Microsoft.PowerShell.Utility\Write-Verbose (
                    "No more updates available after installation.")

                return $true
            }
            else {

                if ($newSearchResult.Updates.Count -gt 0) {
                    Microsoft.PowerShell.Utility\Write-Verbose (
                        "Additional Windows updates found after installation.")
                }

                if ($wingetHasUpdates) {
                    Microsoft.PowerShell.Utility\Write-Verbose (
                        "Winget updates still available.")
                }

                return $false
            }
        }
        catch {

            Microsoft.PowerShell.Utility\Write-Error (
                "Error during update process: ${_}")

            return $false
        }
    }

    end {

        # release com objects to prevent memory leaks
        if ($updateSession) {

            $null = [System.Runtime.InteropServices.Marshal]::ReleaseComObject(
                $updateSession)
        }
    }
}
################################################################################