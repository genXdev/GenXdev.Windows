
################################################################################
<#
.SYNOPSIS
Removes a WireGuard VPN peer configuration.

.DESCRIPTION
This function removes a WireGuard VPN peer configuration from the server running
in a Docker container. It deletes the peer's configuration files and updates the
WireGuard server to stop accepting connections from this peer. The function
validates peer existence before removal and provides confirmation prompts unless
the Force parameter is specified.

.PARAMETER PeerName
The name of the peer to remove from the WireGuard configuration.

.PARAMETER Force
If specified, bypasses confirmation prompts when removing the peer.

.PARAMETER NoDockerInitialize
Skip Docker initialization when already called by parent function.

.PARAMETER ContainerName
The name for the Docker container running the WireGuard service.

.PARAMETER VolumeName
The name for the Docker volume used for persistent storage.

.PARAMETER ServicePort
The port number for the WireGuard service.

.PARAMETER HealthCheckTimeout
Maximum time in seconds to wait for service health check.

.PARAMETER HealthCheckInterval
Interval in seconds between health check attempts.

.PARAMETER ImageName
Custom Docker image name to use for the WireGuard container.

.PARAMETER PUID
User ID for permissions in the container.

.PARAMETER PGID
Group ID for permissions in the container.

.PARAMETER TimeZone
Timezone to use for the container.

.EXAMPLE
Remove-WireGuardPeer -PeerName "MyPhone"

Removes the peer named "MyPhone" with confirmation prompt.

.EXAMPLE
Remove-WireGuardPeer -PeerName "Tablet" -Force

Removes the peer named "Tablet" without confirmation prompt.

.EXAMPLE
Remove-WireGuardPeer "WorkLaptop"

Removes the peer using positional parameter syntax.

.NOTES
This function interacts with the linuxserver/wireguard Docker container to manage
WireGuard peers. It requires the container to be running (use EnsureWireGuard
first). The function will validate peer existence before attempting removal and
provides detailed error handling for failed operations.
#>
###############################################################################
function Remove-WireGuardPeer {

    [CmdletBinding(SupportsShouldProcess)]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]

    param(
        #######################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            HelpMessage = "The name of the peer to remove"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $PeerName,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The name for the Docker container"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $ContainerName = "wireguard",
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The name for the Docker volume for persistent storage"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $VolumeName = "wireguard_data",
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The port number for the WireGuard service"
        )]
        [ValidateRange(1, 65535)]
        [int] $ServicePort = 51820,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Maximum time in seconds to wait for service health check"
        )]
        [ValidateRange(10, 300)]
        [int] $HealthCheckTimeout = 60,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Interval in seconds between health check attempts"
        )]
        [ValidateRange(1, 10)]
        [int] $HealthCheckInterval = 3,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Custom Docker image name to use"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $ImageName = "linuxserver/wireguard",
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "User ID for permissions in the container"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $PUID = "1000",
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Group ID for permissions in the container"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $PGID = "1000",
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Timezone to use for the container"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $TimeZone = "Etc/UTC",
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Force removal without confirmation"
        )]
        [switch] $Force,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Skip Docker initialization when called by parent function"
        )]
        [switch] $NoDockerInitialize
        #######################################################################
    )
    begin {

        # ensure the wireguard service is running if not skipped
        if (-not $NoDockerInitialize) {
            Microsoft.PowerShell.Utility\Write-Verbose `
                "Ensuring WireGuard service is available"

            # copy matching parameters to pass to ensurewireguard function
            $ensureParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Windows\EnsureWireGuard' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # initialize wireguard service with specified parameters
            $null = GenXdev.Windows\EnsureWireGuard @ensureParams
        }
        else {
            Microsoft.PowerShell.Utility\Write-Verbose `
                "Skipping Docker initialization as requested"
        }

        # define helper function to check if peer configuration exists
        function Test-PeerExist {
            param([string]$peerName)

            try {
                # check for existing peer configuration folder using docker exec
                $result = docker exec $ContainerName sh -c ("[ -d /config/peer_$peerName ] && " +
                    "echo 'exists' || echo 'not exists'")

                if ($result -eq 'exists') {
                    return $true
                }

                return $false
            }
            catch {
                Microsoft.PowerShell.Utility\Write-Warning `
                    "Unable to verify peer existence: $_"

                # if we cannot verify assume it exists for safety
                return $true
            }
        }
    }    process {

        try {
            # check if peer exists before attempting removal
            if (-not (Test-PeerExist -peerName $PeerName)) {
                throw "Peer '$PeerName' does not exist"
            }

            # get the peer's public key for wireguard configuration removal
            $publicKey = docker exec $ContainerName sh -c ("cat /config/peer_$PeerName/publickey " +
                "2>/dev/null")

            if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrEmpty($publicKey)) {
                Microsoft.PowerShell.Utility\Write-Warning ("Could not retrieve public key for " +
                    "peer '$PeerName', but will attempt removal anyway")
                $publicKey = $null
            }
            else {
                # trim whitespace from the public key
                $publicKey = $publicKey.Trim()
            }

            # confirm the removal if force is not specified
            $confirmMessage = "Are you sure you want to remove the WireGuard peer '$PeerName'?"
            $operationName = "Removing WireGuard peer '$PeerName'"

            if ($Force -or $PSCmdlet.ShouldProcess($confirmMessage, $operationName)) {
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "Removing WireGuard peer: $PeerName"

                # remove from wireguard configuration if we have the public key
                if (-not [string]::IsNullOrEmpty($publicKey)) {
                    $removeResult = docker exec $ContainerName sh -c ("wg set wg0 peer " +
                        "$publicKey remove")

                    if ($LASTEXITCODE -ne 0) {
                        Microsoft.PowerShell.Utility\Write-Warning `
                            "Failed to remove peer from WireGuard: $removeResult"
                    }
                    else {
                        Microsoft.PowerShell.Utility\Write-Verbose `
                            "Peer removed from WireGuard configuration"
                    }
                }

                # remove peer directory from container filesystem
                $deleteResult = docker exec $ContainerName sh -c "rm -rf /config/peer_$PeerName"

                if ($LASTEXITCODE -ne 0) {
                    throw "Failed to remove peer directory: $deleteResult"
                }

                # save wireguard configuration to persist changes
                $saveResult = docker exec $ContainerName sh -c "wg-quick save wg0"

                if ($LASTEXITCODE -ne 0) {
                    Microsoft.PowerShell.Utility\Write-Warning `
                        "Failed to save WireGuard configuration: $saveResult"
                }

                Microsoft.PowerShell.Utility\Write-Host -ForegroundColor Green `
                    "Peer '$PeerName' removed successfully"

                # return success information for pipeline use
                return [PSCustomObject]@{
                    PeerName = $PeerName
                    PublicKey = $publicKey
                    Success = $true
                    Message = "Peer '$PeerName' removed successfully"
                }
            }

            # return cancellation information when user declines
            return [PSCustomObject]@{
                PeerName = $PeerName
                PublicKey = $publicKey
                Success = $false
                Message = "Peer removal was canceled by user"
            }
        }
        catch {
            Microsoft.PowerShell.Utility\Write-Error `
                "Failed to remove WireGuard peer '$PeerName': $_"
            throw
        }
    }    end {
    }
}
################################################################################
