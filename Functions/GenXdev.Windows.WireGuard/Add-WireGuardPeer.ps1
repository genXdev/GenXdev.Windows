###############################################################################
<#
.SYNOPSIS
Adds a new WireGuard VPN peer (client) configuration to the server.

.DESCRIPTION
This function adds a new peer to the WireGuard VPN server running in a Docker
container. It generates a new client configuration with a unique IP address,
creates necessary cryptographic keys, and returns the configuration details.
The function can optionally save the configuration to a file or display a QR
code for easy mobile device setup. The function validates peer names, checks
for duplicates, and handles various error conditions gracefully.

.PARAMETER PeerName
A unique name for the peer that will be used to identify the peer in the
WireGuard configuration and for the generated configuration filename. The name
must be less than 100 characters and cannot contain invalid characters like
< > " / \ | ? * :

.PARAMETER AllowedIPs
The IP ranges that will be routed through the VPN for this peer. Specify
multiple ranges separated by commas. Default is "0.0.0.0/0, ::/0" which
routes all IPv4 and IPv6 traffic through the VPN tunnel.

.PARAMETER DNS
DNS servers to use for this peer when connected to the VPN. Specify multiple
servers separated by commas. Default is "1.1.1.1, 1.0.0.1" which uses
Cloudflare's secure DNS servers.

.PARAMETER OutputPath
The directory path where the peer configuration file should be saved when
SaveConfig is enabled. The directory will be created if it doesn't exist.
Default is "$env:USERPROFILE\WireGuardConfigs".

.PARAMETER ContainerName
The name of the Docker container running the WireGuard service. Must match
the container name used when initializing the service. Default is "wireguard".

.PARAMETER VolumeName
The name of the Docker volume used for persistent storage of WireGuard
configurations and keys. Must match the volume name used during
initialization. Default is "wireguard_data".

.PARAMETER ServicePort
The UDP port number that the WireGuard service listens on for VPN
connections. Must be a valid port number between 1 and 65535. Default is
51820 which is the standard WireGuard port.

.PARAMETER HealthCheckTimeout
Maximum time in seconds to wait for the WireGuard service health check to
complete. Valid range is 10 to 300 seconds. Default is 60 seconds.

.PARAMETER HealthCheckInterval
Interval in seconds between health check attempts when waiting for the
service to become ready. Valid range is 1 to 10 seconds. Default is 3
seconds.

.PARAMETER ImageName
The Docker image name to use for the WireGuard container. Default is
"linuxserver/wireguard" which is the official LinuxServer.io WireGuard image.

.PARAMETER PUID
User ID for file permissions inside the Docker container. Should match the
host user ID to avoid permission issues with volume mounts. Default is "1000".

.PARAMETER PGID
Group ID for file permissions inside the Docker container. Should match the
host group ID to avoid permission issues with volume mounts. Default is
"1000".

.PARAMETER TimeZone
Timezone to use for the container logs and scheduling. Should be a valid
timezone identifier. Default is "Etc/UTC" for consistent UTC timestamps.

.PARAMETER SaveConfig
When specified, saves the generated peer configuration to a .conf file in the
OutputPath directory. The file will be named with the peer name followed by
.conf extension.

.PARAMETER ShowQRCode
When specified, displays a QR code in the console that can be scanned by the
WireGuard mobile app for easy configuration import. Useful for mobile device
setup.

.PARAMETER NoDockerInitialize
When specified, skips the Docker container initialization check. Use this
when the function is called by another function that has already ensured the
WireGuard service is running.

.PARAMETER Force
When specified, forces a rebuild of the Docker container and removes existing
data. This will destroy all existing peer configurations and server keys.

.PARAMETER WhatIf
Shows what would happen if the cmdlet runs. The cmdlet is not run.

.PARAMETER Confirm
Prompts you for confirmation before running the cmdlet.

.EXAMPLE
Add-WireGuardPeer -PeerName "MyPhone" -AllowedIPs "0.0.0.0/0, ::/0" `
    -DNS "1.1.1.1, 1.0.0.1" -SaveConfig -OutputPath `
    "$env:USERPROFILE\WireGuardConfigs" -ShowQRCode -ContainerName "wireguard" `
    -VolumeName "wireguard_data" -ServicePort 51820 -HealthCheckTimeout 60 `
    -HealthCheckInterval 3 -ImageName "linuxserver/wireguard" -PUID "1000" `
    -PGID "1000" -TimeZone "Etc/UTC"

.EXAMPLE
Add-WireGuardPeer "MyTablet" -ShowQRCode

.NOTES
This function interacts with the linuxserver/wireguard Docker container to
manage WireGuard peers. It requires Docker to be installed and the WireGuard
container to be running. Use EnsureWireGuard function first to initialize the
service if needed.
        ###############################################################################>

        ###############################################################################
function Add-WireGuardPeer {

    [CmdletBinding(SupportsShouldProcess)]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]

    param(
        #######################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            HelpMessage = "A unique name for the peer"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $PeerName,
        #######################################################################
        [Parameter(
            Position = 1,
            Mandatory = $false,
            HelpMessage = ("The IP ranges that will be routed through the " +
                "VPN")
        )]
        [ValidateNotNullOrEmpty()]
        [string] $AllowedIPs = "0.0.0.0/0, ::/0",
        #######################################################################
        [Parameter(
            Position = 2,
            Mandatory = $false,
            HelpMessage = "DNS servers to use for this peer"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $DNS = "1.1.1.1, 1.0.0.1",
        #######################################################################
        [Parameter(
            Position = 3,
            Mandatory = $false,
            HelpMessage = ("The path where the peer configuration file " +
                "should be saved")
        )]
        [ValidateNotNullOrEmpty()]
        [Alias("outfile", "OutputFile")]
        [string] $OutputPath = "$env:USERPROFILE\WireGuardConfigs",
        #######################################################################
        [Parameter(
            Position = 4,
            Mandatory = $false,
            HelpMessage = "The name for the Docker container"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $ContainerName = "wireguard",
        #######################################################################
        [Parameter(
            Position = 5,
            Mandatory = $false,
            HelpMessage = ("The name for the Docker volume for persistent " +
                "storage")
        )]
        [ValidateNotNullOrEmpty()]
        [string] $VolumeName = "wireguard_data",
        #######################################################################
        [Parameter(
            Position = 6,
            Mandatory = $false,
            HelpMessage = "The port number for the WireGuard service"
        )]
        [ValidateRange(1, 65535)]
        [int] $ServicePort = 51820,
        #######################################################################
        [Parameter(
            Position = 7,
            Mandatory = $false,
            HelpMessage = ("Maximum time in seconds to wait for service " +
                "health check")
        )]
        [ValidateRange(10, 300)]
        [int] $HealthCheckTimeout = 60,
        #######################################################################
        [Parameter(
            Position = 8,
            Mandatory = $false,
            HelpMessage = ("Interval in seconds between health check " +
                "attempts")
        )]
        [ValidateRange(1, 10)]
        [int] $HealthCheckInterval = 3,
        #######################################################################
        [Parameter(
            Position = 9,
            Mandatory = $false,
            HelpMessage = "Custom Docker image name to use"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $ImageName = "linuxserver/wireguard",
        #######################################################################
        [Parameter(
            Position = 10,
            Mandatory = $false,
            HelpMessage = "User ID for permissions in the container"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $PUID = "1000",
        #######################################################################
        [Parameter(
            Position = 11,
            Mandatory = $false,
            HelpMessage = "Group ID for permissions in the container"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $PGID = "1000",
        #######################################################################
        [Parameter(
            Position = 12,
            Mandatory = $false,
            HelpMessage = "Timezone to use for the container"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $TimeZone = "Etc/UTC",
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Save the peer configuration to a file"
        )]
        [switch] $SaveConfig,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ("Show QR code in the console for easy mobile " +
                "setup")
        )]
        [switch] $ShowQRCode,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ("Skip Docker initialization (used when already " +
                "called by parent function)")
        )]
        [switch] $NoDockerInitialize,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ("Force rebuild of Docker container and remove " +
                "existing data")
        )]
        [Alias("ForceRebuild")]
        [switch] $Force
        #######################################################################
    )    begin {

        # ensure the wireguard service is running unless explicitly skipped
        if (-not $NoDockerInitialize) {

            # log verbose message about ensuring service availability
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

            # log verbose message about skipping docker initialization
            Microsoft.PowerShell.Utility\Write-Verbose `
                "Skipping Docker initialization as requested"
        }

        #######################################################################
        # define helper function to validate peer name format and constraints
        function Test-PeerNameFormat {

            param([string]$peerName)

            # check for null or whitespace peer name
            if ([string]::IsNullOrWhiteSpace($peerName)) {
                throw "Peer name cannot be empty or whitespace"
            }

            # check for peer name length exceeding maximum allowed
            if ($peerName.Length -gt 100) {
                throw ("Peer name is too long. Maximum length is 100 " +
                    "characters")
            }

            # define list of characters that are invalid for peer names
            $invalidChars = @('<', '>', '"', '/', '\', '|', '?', '*', ':')

            # check each character in peer name for invalid characters
            foreach ($char in $invalidChars) {

                # throw error if invalid character is found
                if ($peerName.Contains($char)) {
                    throw "Peer name contains invalid character '$char'"
                }
            }

            return $true
        }

        #######################################################################
        # define helper function to check if peer configuration already exists
        function Test-PeerExist {

            param([string]$peerName)

            try {

                # check for existing peer configuration files in container
                $existingPeers = & docker exec $ContainerName sh -c `
                    "ls -1 /config/peer_*"

                # iterate through existing peer configurations
                foreach ($existingPeer in $existingPeers) {

                    # check if current peer name matches existing peer
                    if ($existingPeer -match "peer_$peerName") {
                        return $true
                    }
                }

                return $false
            }
            catch {

                # log warning if unable to verify peer existence
                Microsoft.PowerShell.Utility\Write-Warning `
                    "Unable to verify peer existence: $_"

                # proceed with creation attempt if verification fails
                return $false
            }
        }
    }

    process {

        try {

            # validate peer name format using helper function
            Test-PeerNameFormat -peerName $PeerName

            # check if peer already exists using helper function
            if (Test-PeerExist -peerName $PeerName) {
                throw "A peer with name '$PeerName' already exists"
            }

            # ask for confirmation before creating the peer
            if ($PSCmdlet.ShouldProcess("WireGuard peer '$PeerName'",
                "Add peer")) {

                # log verbose message about adding new peer
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "Adding new WireGuard peer: $PeerName"

                # create the peer in the docker container using add-peer script
                $result = docker exec $ContainerName sh -c "/app/add-peer $PeerName"

                # check if peer creation command succeeded
                if ($LASTEXITCODE -ne 0) {
                    throw "Failed to add peer: $result"
                }

                # log verbose message about successful peer addition
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "Peer $PeerName added successfully"

                # get the peer configuration details from container
                $peerConfig = docker exec $ContainerName sh -c `
                    "cat /config/peer_$PeerName/peer_$PeerName.conf"

                # check if configuration retrieval succeeded and is not empty
                if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrEmpty($peerConfig)) {
                    throw "Failed to retrieve peer configuration"
                }

                # save configuration to file if requested by user
                if ($SaveConfig) {

                    # ask for confirmation before saving configuration file
                    if ($PSCmdlet.ShouldProcess(
                        "Configuration file for peer '$PeerName'",
                        "Save to $OutputPath")) {

                        # create output directory if it doesn't exist
                        if (-not (Microsoft.PowerShell.Management\Test-Path `
                            $OutputPath)) {

                            # create directory with force flag to create parent dirs
                            $null = Microsoft.PowerShell.Management\New-Item `
                                -ItemType Directory `
                                -Path $OutputPath `
                                -Force
                        }

                        # build full path for configuration file
                        $configFile = Microsoft.PowerShell.Management\Join-Path `
                            -Path $OutputPath `
                            -ChildPath "$PeerName.conf"

                        # write peer configuration to file with utf8 encoding
                        $peerConfig |
                            Microsoft.PowerShell.Utility\Out-File `
                                -FilePath $configFile `
                                -Encoding utf8 `
                                -Force

                        # display success message with configuration file location
                        Microsoft.PowerShell.Utility\Write-Host `
                            -ForegroundColor Green `
                            "Peer configuration saved to: $configFile"
                    }
                }

                # show qr code if requested by user
                if ($ShowQRCode) {

                    # display message about qr code generation
                    Microsoft.PowerShell.Utility\Write-Host `
                        "Generating QR code for peer $PeerName..."

                    # generate qr code using show-peer script in container
                    $qrCode = docker exec $ContainerName sh -c `
                        "/app/show-peer $PeerName"

                    # check if qr code generation succeeded
                    if ($LASTEXITCODE -eq 0) {

                        # display the qr code to console
                        Microsoft.PowerShell.Utility\Write-Host $qrCode

                        # display instruction message for qr code usage
                        Microsoft.PowerShell.Utility\Write-Host `
                            -ForegroundColor Green `
                            "Scan this QR code with the WireGuard mobile app"
                    }
                    else {

                        # log warning if qr code generation failed
                        Microsoft.PowerShell.Utility\Write-Warning `
                            "Failed to generate QR code: $qrCode"
                    }
                }

                # create hash table with peer details for return object
                $peerDetails = @{
                    PeerName = $PeerName
                    Configuration = $peerConfig
                    ConfigurationPath = if ($SaveConfig) { $configFile } else {
                        $null
                    }
                    QRCodeGenerated = $ShowQRCode
                }

                # return peer details as powershell custom object
                return [PSCustomObject]$peerDetails
            }
        }
        catch [System.Net.WebException] {

            # log error for network-related exceptions
            Microsoft.PowerShell.Utility\Write-Error `
                "Network error when adding WireGuard peer: $_"
            throw
        }
        catch [System.TimeoutException] {

            # log error for timeout-related exceptions
            Microsoft.PowerShell.Utility\Write-Error `
                "Timeout when adding WireGuard peer: $_"
            throw
        }
        catch {

            # log error for all other exceptions
            Microsoft.PowerShell.Utility\Write-Error `
                "Failed to add WireGuard peer: $_"
            throw
        }
    }

    end {

    }
}
        ###############################################################################
