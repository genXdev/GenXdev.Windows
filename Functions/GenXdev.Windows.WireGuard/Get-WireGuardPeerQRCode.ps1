###############################################################################
<#
.SYNOPSIS
Generates a QR code for a WireGuard VPN peer configuration.

.DESCRIPTION
This function generates a QR code for a WireGuard VPN peer configuration that
can be scanned by mobile devices for easy setup. The QR code is displayed in
the console and can be used to quickly configure WireGuard clients on
smartphones and tablets. The function interacts with the linuxserver/wireguard
Docker container to generate QR codes for peer configurations.

.PARAMETER PeerName
The name of the peer to generate a QR code for.

.PARAMETER NoDockerInitialize
Skip Docker initialization (used when already called by parent function).

.PARAMETER Force
Force rebuild of Docker container and remove existing data.

.PARAMETER ContainerName
The name for the Docker container.

.PARAMETER VolumeName
The name for the Docker volume for persistent storage.

.PARAMETER ServicePort
The port number for the WireGuard service.

.PARAMETER HealthCheckTimeout
Maximum time in seconds to wait for service health check.

.PARAMETER HealthCheckInterval
Interval in seconds between health check attempts.

.PARAMETER ImageName
Custom Docker image name to use.

.PARAMETER PUID
User ID for permissions in the container.

.PARAMETER PGID
Group ID for permissions in the container.

.PARAMETER TimeZone
Timezone to use for the container.

.EXAMPLE
Get-WireGuardPeerQRCode -PeerName "MyPhone"

.EXAMPLE
Get-WireGuardPeerQRCode -PeerName "Tablet" -NoDockerInitialize

.NOTES
This function requires the container to be running (use EnsureWireGuard first)
and the peer to exist (use Add-WireGuardPeer to create peers).
        ###############################################################################>

function Get-WireGuardPeerQRCode {

    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]

    param(
        ###############################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            HelpMessage = "The name of the peer to generate a QR code for"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $PeerName,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ("Skip Docker initialization (used when already " +
                          "called by parent function)")
        )]
        [switch] $NoDockerInitialize,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ("Force rebuild of Docker container and remove " +
                          "existing data")
        )]
        [Alias("ForceRebuild")]
        [switch] $Force,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The name for the Docker container"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $ContainerName = "wireguard",
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The name for the Docker volume for persistent storage"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $VolumeName = "wireguard_data",
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The port number for the WireGuard service"
        )]
        [ValidateRange(1, 65535)]
        [int] $ServicePort = 51820,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ("Maximum time in seconds to wait for service " +
                          "health check")
        )]
        [ValidateRange(10, 300)]
        [int] $HealthCheckTimeout = 60,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Interval in seconds between health check attempts"
        )]
        [ValidateRange(1, 10)]
        [int] $HealthCheckInterval = 3,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Custom Docker image name to use"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $ImageName = "linuxserver/wireguard",
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "User ID for permissions in the container"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $PUID = "1000",
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Group ID for permissions in the container"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $PGID = "1000",
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Timezone to use for the container"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $TimeZone = "Etc/UTC"
        ###############################################################################
    )    begin {

        # ensure the WireGuard service is running
        if (-not $NoDockerInitialize) {

            Microsoft.PowerShell.Utility\Write-Verbose `
                "Ensuring WireGuard service is available"

            # copy matching parameters to pass to EnsureWireGuard function
            $ensureParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Windows\EnsureWireGuard' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # initialize WireGuard service with specified parameters
            $null = GenXdev.Windows\EnsureWireGuard @ensureParams
        }
        else {

            Microsoft.PowerShell.Utility\Write-Verbose `
                "Skipping Docker initialization as requested"
        }

        # define helper function to check if peer exists
        function Test-PeerExist {

            param([string]$peerName)

            try {

                # check for existing peer configuration folder
                $result = docker exec $ContainerName sh -c `
                    "[ -d /config/peer_$peerName ] && echo 'exists' || echo 'not exists'"

                if ($result -eq 'exists') {

                    return $true
                }

                return $false
            }
            catch {

                Microsoft.PowerShell.Utility\Write-Warning `
                    "Unable to verify peer existence: $_"

                # proceed with attempt even if we cannot verify existence
                return $false
            }
        }
    }    process {

        try {

            # check if peer exists before proceeding
            if (-not (Test-PeerExist -peerName $PeerName)) {

                throw ("Peer '$PeerName' does not exist. Create it with " +
                       "Add-WireGuardPeer first")
            }

            Microsoft.PowerShell.Utility\Write-Verbose `
                "Generating QR code for peer: $PeerName"

            # generate QR code using the container's show-peer command
            $qrCode = docker exec $ContainerName /app/show-peer $PeerName

            if ($LASTEXITCODE -ne 0) {

                throw "Failed to generate QR code: $qrCode"
            }

            # output the QR code to the console with formatting
            Microsoft.PowerShell.Utility\Write-Host ""

            Microsoft.PowerShell.Utility\Write-Host -ForegroundColor Cyan `
                "QR Code for peer '$PeerName':"

            Microsoft.PowerShell.Utility\Write-Host ""

            Microsoft.PowerShell.Utility\Write-Host $qrCode

            Microsoft.PowerShell.Utility\Write-Host ""

            Microsoft.PowerShell.Utility\Write-Host -ForegroundColor Green `
                ("Scan this QR code with the WireGuard mobile app to set up " +
                "the connection.")

            # return structured data about the QR code
            return [PSCustomObject]@{
                PeerName = $PeerName
                QRCode = $qrCode
                Message = "QR code generated successfully for peer '$PeerName'"
            }
        }
        catch {

            Microsoft.PowerShell.Utility\Write-Error `
                "Failed to generate QR code for peer '$PeerName': $_"

            throw
        }
    }    end {

        # no specific cleanup needed for this function
    }
}
        ###############################################################################
