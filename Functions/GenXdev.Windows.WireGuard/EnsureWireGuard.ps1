###############################################################################
<#
.SYNOPSIS
Ensures WireGuard VPN service is installed and running via Docker container.

.DESCRIPTION
This function sets up and manages the WireGuard VPN service using Docker
Desktop. It automatically ensures Docker Desktop is running, pulls the latest
WireGuard Docker image, creates persistent storage volumes, and manages the
container lifecycle including health monitoring and restart capabilities.

WireGuard is a simple, fast, and modern VPN that utilizes state-of-the-art
cryptography. It offers superior performance and simplicity compared to
traditional VPN solutions like OpenVPN, with minimal configuration overhead
and excellent cross-platform support.

.PARAMETER ContainerName
The name for the Docker container. Default: "wireguard"

.PARAMETER VolumeName
The name for the Docker volume for persistent storage of configuration files
and client certificates. Default: "wireguard_data"

.PARAMETER ServicePort
The UDP port number for the WireGuard service to listen on. Must be between
1-65535. Default: 51820

.PARAMETER HealthCheckTimeout
Maximum time in seconds to wait for service health check before timing out.
Must be between 10-300 seconds. Default: 60

.PARAMETER HealthCheckInterval
Interval in seconds between health check attempts during startup validation.
Must be between 1-10 seconds. Default: 3

.PARAMETER ImageName
Custom Docker image name to use instead of the default. If not specified,
uses the official "linuxserver/wireguard" image from Docker Hub.

.PARAMETER PUID
User ID for file permissions inside the container. Should match your host
system user ID for proper file access. Default: "1000"

.PARAMETER PGID
Group ID for file permissions inside the container. Should match your host
system group ID for proper file access. Default: "1000"

.PARAMETER TimeZone
Timezone identifier to use for container logging and timestamps. Uses standard
timezone database format. Default: "Etc/UTC"

.PARAMETER Force
Forces complete rebuilding of Docker container and removes all existing data.
This will stop and remove existing containers and volumes, pull the latest
WireGuard image, and create a fresh container with clean configuration.

.EXAMPLE
EnsureWireGuard

.EXAMPLE
EnsureWireGuard -ContainerName "my_wireguard" -ServicePort 51821

.EXAMPLE
EnsureWireGuard -VolumeName "custom_vpn_data" -HealthCheckTimeout 120

.EXAMPLE
EnsureWireGuard -PUID 1001 -PGID 1001 -TimeZone "America/New_York"

.EXAMPLE
EnsureWireGuard -Force

.NOTES
To generate client configurations after setup:
- Run: docker exec -it wireguard /app/show-peer 1

For Android 10 and above:
- Install the official WireGuard app from Google Play Store
- Scan the QR code or import the config file to connect

For more information, see: https://www.wireguard.com/
###############################################################################>
function EnsureWireGuard {

    [CmdletBinding()]
    [OutputType([System.Boolean])]

    param(
        #######################################################################
        [Parameter(
            Position = 0,
            Mandatory = $false,
            HelpMessage = "The name for the Docker container"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $ContainerName = "wireguard",
        #######################################################################
        [Parameter(
            Position = 1,
            Mandatory = $false,
            HelpMessage = ("The name for the Docker volume for persistent " +
                          "storage")
        )]
        [ValidateNotNullOrEmpty()]
        [string] $VolumeName = "wireguard_data",
        #######################################################################
        [Parameter(
            Position = 2,
            Mandatory = $false,
            HelpMessage = "The port number for the WireGuard service"
        )]
        [ValidateRange(1, 65535)]
        [int] $ServicePort = 51820,
        #######################################################################
        [Parameter(
            Position = 3,
            Mandatory = $false,
            HelpMessage = ("Maximum time in seconds to wait for service " +
                          "health check")
        )]
        [ValidateRange(10, 300)]
        [int] $HealthCheckTimeout = 60,
        #######################################################################
        [Parameter(
            Position = 4,
            Mandatory = $false,
            HelpMessage = "Interval in seconds between health check attempts"
        )]
        [ValidateRange(1, 10)]
        [int] $HealthCheckInterval = 3,
        #######################################################################
        [Parameter(
            Position = 5,
            Mandatory = $false,
            HelpMessage = "Custom Docker image name to use"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $ImageName = "linuxserver/wireguard",
        #######################################################################
        [Parameter(
            Position = 6,
            Mandatory = $false,
            HelpMessage = "User ID for permissions in the container"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $PUID = "1000",
        #######################################################################
        [Parameter(
            Position = 7,
            Mandatory = $false,
            HelpMessage = "Group ID for permissions in the container"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $PGID = "1000",
        #######################################################################
        [Parameter(
            Position = 8,
            Mandatory = $false,
            HelpMessage = "Timezone to use for the container"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $TimeZone = "Etc/UTC",
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

        # set script-scoped variables from parameters for container management
        $script:containerName = $ContainerName

        # set docker image name for pulling and container creation
        $script:imageName = $ImageName

        # set script-scoped variables for docker volume and networking
        $script:volumeName = $VolumeName

        # set script-scoped variables for service configuration
        $script:servicePort = $ServicePort

        # set script-scoped variables for health monitoring timeouts
        $script:healthCheckTimeout = $HealthCheckTimeout

        # set script-scoped variable for health check retry intervals
        $script:healthCheckInterval = $HealthCheckInterval

        # set script-scoped variables for container environment settings
        $script:puid = $PUID

        $script:pgid = $PGID

        $script:timezone = $TimeZone

        # store original location for cleanup at the end of the function
        $script:originalLocation = `
            (Microsoft.PowerShell.Management\Get-Location).Path

        #######################################################################
        <#
        .SYNOPSIS
        Tests if Docker is available and responsive to commands.

        .DESCRIPTION
        Verifies Docker Desktop is running by attempting to query the Docker
        version. Returns true if Docker responds successfully, false otherwise.
        #>
        function Test-DockerAvailability {

            try {

                # attempt to get docker version to verify docker is running
                $null = docker version --format "{{.Server.Version}}" 2>$null

                return $LASTEXITCODE -eq 0
            }
            catch {

                return $false
            }
        }
        #######################################################################
        <#
        .SYNOPSIS
        Tests if a Docker image exists locally.

        .DESCRIPTION
        Queries Docker for the existence of a specific image by name. Returns
        true if the image is found locally, false if not found or on error.

        .PARAMETER ImageName
        The Docker image name to search for in the local image repository.
        #>
        function Test-DockerImage {

            param([string]$ImageName)

            try {

                # query docker for existing images matching the specified name
                $images = docker images $ImageName --format "{{.Repository}}" `
                    2>$null

                return -not [string]::IsNullOrWhiteSpace($images)
            }
            catch {

                return $false
            }
        }
        #######################################################################
        <#
        .SYNOPSIS
        Tests if a Docker container exists (running or stopped).

        .DESCRIPTION
        Searches for a Docker container by exact name match, including both
        running and stopped containers. Returns true if found, false otherwise.

        .PARAMETER ContainerName
        The exact container name to search for in Docker container list.
        #>
        function Test-DockerContainer {

            param([string]$ContainerName)

            try {

                # search for containers with exact name match including stopped ones
                $containers = docker ps -a --filter "name=^${ContainerName}$" `
                    --format "{{.ID}}" 2>$null

                return -not [string]::IsNullOrWhiteSpace($containers)
            }
            catch {

                return $false
            }
        }
        #######################################################################
        <#
        .SYNOPSIS
        Tests if a Docker container is currently running.

        .DESCRIPTION
        Checks specifically for running containers with the given name. Returns
        true if the container exists and is actively running, false otherwise.

        .PARAMETER ContainerName
        The exact container name to check for running status.
        #>
        function Test-DockerContainerRunning {

            param([string]$ContainerName)

            try {

                # search for running containers with exact name match
                $containers = docker ps --filter "name=^${ContainerName}$" `
                    --format "{{.ID}}" 2>$null

                return -not [string]::IsNullOrWhiteSpace($containers)
            }
            catch {

                return $false
            }
        }
        #######################################################################
        <#
        .SYNOPSIS
        Safely removes a Docker container with proper error handling.

        .DESCRIPTION
        Stops and removes a Docker container if it exists. Uses ShouldProcess
        for confirmation and provides verbose logging. Handles errors gracefully
        without throwing exceptions.

        .PARAMETER ContainerName
        The name of the container to stop and remove from Docker.
        #>
        function Remove-DockerContainer {

            [CmdletBinding(SupportsShouldProcess)]
            param([string]$ContainerName)

            try {

                # check if container exists before attempting removal
                if (Test-DockerContainer $ContainerName) {

                    if ($PSCmdlet.ShouldProcess($ContainerName,
                        "Stop and remove Docker container")) {

                        # output verbose information about container removal
                        Microsoft.PowerShell.Utility\Write-Verbose `
                            "Stopping and removing container: $ContainerName"

                        # stop the container gracefully before removal
                        $null = docker stop $ContainerName 2>$null

                        # remove the container completely from docker
                        $null = docker rm $ContainerName 2>$null
                    }
                }
            }
            catch {

                # warn about container removal failures without throwing
                Microsoft.PowerShell.Utility\Write-Warning `
                    "Failed to remove container ${ContainerName}: $_"
            }
        }
        #######################################################################
        <#
        .SYNOPSIS
        Safely removes a Docker volume with proper error handling.

        .DESCRIPTION
        Removes a Docker volume if it exists. Uses ShouldProcess for
        confirmation and provides verbose logging. Handles errors gracefully
        without throwing exceptions.

        .PARAMETER VolumeName
        The name of the Docker volume to remove from the system.
        #>
        function Remove-DockerVolume {

            [CmdletBinding(SupportsShouldProcess)]
            param([string]$VolumeName)

            try {

                if ($PSCmdlet.ShouldProcess($VolumeName,
                    "Remove Docker volume")) {

                    # output verbose information about volume removal
                    Microsoft.PowerShell.Utility\Write-Verbose `
                        "Removing Docker volume: $VolumeName"

                    # remove the docker volume and discard output
                    $null = docker volume rm $VolumeName 2>$null
                }
            }
            catch {

                # warn about volume removal failures without throwing
                Microsoft.PowerShell.Utility\Write-Warning `
                    "Failed to remove volume ${VolumeName}: $_"
            }
        }
        #######################################################################
        <#
        .SYNOPSIS
        Tests if the WireGuard service is healthy and responding.

        .DESCRIPTION
        Performs health checks on the WireGuard container by examining container
        logs for startup indicators and checking if the service port is
        listening. Returns true if healthy, false otherwise.
        #>
        function Test-ServiceHealth {

            try {

                # first check if container is running before health tests
                $containerRunning = Test-DockerContainerRunning `
                    $script:containerName

                if (-not $containerRunning) {

                    return $false
                }

                # check container logs for successful startup messages
                $logs = docker logs $script:containerName 2>&1

                # look for indications that wireguard is running properly
                if ($logs -match "Server started" -or
                    $logs -match "WireGuard started" -or
                    $logs -match "UDP listening") {

                    # log successful health check for debugging
                    Microsoft.PowerShell.Utility\Write-Verbose `
                        "WireGuard service health check passed"

                    return $true
                }

                # alternatively check if the port is listening using netstat
                $netstatOutput = & netstat -an |
                    Microsoft.PowerShell.Utility\Select-String `
                        -Pattern ":$($script:servicePort) "

                if (-not [string]::IsNullOrEmpty($netstatOutput)) {

                    # log successful health check for debugging
                    Microsoft.PowerShell.Utility\Write-Verbose `
                        ("WireGuard service health check passed " +
                         "(port is listening)")

                    return $true
                }

                return $false
            }
            catch {

                # log failed health check with error details for debugging
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "WireGuard service health check failed: $_"

                return $false
            }
        }
        #######################################################################
        <#
        .SYNOPSIS
        Waits for the WireGuard service to become healthy and ready.

        .DESCRIPTION
        Repeatedly checks service health until it becomes ready or timeout is
        reached. Uses configurable timeout and interval settings for retry
        logic. Returns true if service becomes ready, false on timeout.
        #>
        function Wait-ServiceReady {

            # output verbose information about waiting for service readiness
            Microsoft.PowerShell.Utility\Write-Verbose `
                "Waiting for WireGuard service to become ready..."

            # initialize retry counter for health check attempts
            $retryCount = 0

            # calculate maximum retry attempts based on timeout and interval
            $maxRetries = [math]::Floor($script:healthCheckTimeout / `
                $script:healthCheckInterval)

            while ($retryCount -lt $maxRetries) {

                # test service health and return success if ready
                if (Test-ServiceHealth) {

                    # log successful service readiness
                    Microsoft.PowerShell.Utility\Write-Verbose `
                        "WireGuard service is ready and responding"

                    return $true
                }

                # increment retry counter for next attempt
                $retryCount++

                # output verbose information about retry attempt progress
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "Service not ready yet, attempt $retryCount/$maxRetries..."

                # wait between health check attempts as configured
                Microsoft.PowerShell.Utility\Start-Sleep `
                    -Seconds $script:healthCheckInterval
            }

            # warn about service readiness timeout after all retries
            Microsoft.PowerShell.Utility\Write-Warning `
                ("WireGuard service did not become ready within " +
                 "$script:healthCheckTimeout seconds")

            return $false
        }
        #######################################################################
        <#
        .SYNOPSIS
        Pulls the latest WireGuard Docker image from registry.

        .DESCRIPTION
        Downloads the specified WireGuard Docker image from Docker Hub or
        configured registry. Provides verbose logging and error handling.
        Returns true on success, false on failure.
        #>
        function Get-WireGuardImage {

            try {

                # output verbose information about docker image pull operation
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "Pulling WireGuard image: $script:imageName"

                # pull the specified docker image from registry
                $pullResult = docker pull $script:imageName 2>&1

                # check if docker pull command failed
                if ($LASTEXITCODE -ne 0) {

                    throw "Failed to pull WireGuard image: $pullResult"
                }

                # log successful image pull completion
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "✅ WireGuard image pulled successfully"

                return $true
            }
            catch {

                # log error details for image pull failure
                Microsoft.PowerShell.Utility\Write-Error `
                    "Failed to pull WireGuard image: $_"

                return $false
            }
        }
        #######################################################################
        <#
        .SYNOPSIS
        Creates and starts a new WireGuard Docker container.

        .DESCRIPTION
        Creates a new WireGuard container with proper configuration including
        networking capabilities, persistent volume mounting, environment
        variables, and restart policies. Uses ShouldProcess for confirmation.
        #>
        function New-WireGuardContainer {

            [CmdletBinding(SupportsShouldProcess)]
            param()

            try {

                # output verbose information about container creation process
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "Creating WireGuard container..."

                # check if docker volume already exists in the system
                $volumeExists = docker volume ls `
                    --filter "name=^${script:volumeName}$" `
                    --format "{{.Name}}" 2>$null

                # create docker volume if it doesn't exist yet
                if ([string]::IsNullOrWhiteSpace($volumeExists)) {

                    # use shouldprocess to confirm volume creation
                    if ($PSCmdlet.ShouldProcess("$script:volumeName",
                        "Create Docker volume")) {

                        # output verbose information about volume creation
                        Microsoft.PowerShell.Utility\Write-Verbose `
                            "Creating Docker volume: $script:volumeName"

                        # create the docker volume for persistent storage
                        $volumeResult = docker volume create $script:volumeName `
                            2>&1

                        # check if volume creation failed
                        if ($LASTEXITCODE -ne 0) {

                            throw ("Failed to create Docker volume " +
                                  "$script:volumeName`: $volumeResult")
                        }
                    }
                }

                # prepare docker run arguments for container creation
                $dockerArgs = @(
                    "run", "-d"
                    "--name", $script:containerName
                    "--cap-add", "NET_ADMIN"
                    "--cap-add", "SYS_MODULE"
                    "-e", "PUID=$($script:puid)"
                    "-e", "PGID=$($script:pgid)"
                    "-e", "TZ=$($script:timezone)"
                    "-p", "$($script:servicePort):51820/udp"
                    "-v", "$($script:volumeName):/config"
                    "--restart", "unless-stopped"
                )

                # add the docker image name as final argument
                $dockerArgs += $script:imageName

                # output verbose information about docker command execution
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "Docker command: docker $($dockerArgs -join ' ')"

                # use shouldprocess to confirm container creation
                if ($PSCmdlet.ShouldProcess("$script:containerName",
                    "Create WireGuard container")) {

                    # execute docker run command to create container
                    $result = & docker @dockerArgs 2>&1

                    # check if container creation failed
                    if ($LASTEXITCODE -ne 0) {

                        throw "Failed to create container: $result"
                    }
                }

                # wait for container to initialize properly after creation
                Microsoft.PowerShell.Utility\Start-Sleep -Seconds 5

                # log successful container creation
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "✅ WireGuard container created successfully"

                return $true
            }
            catch {

                # log error details for container creation failure
                Microsoft.PowerShell.Utility\Write-Error `
                    "Failed to create WireGuard container: $_"

                return $false
            }
        }
        #######################################################################
    }    process {

        try {

            # ensure docker desktop is available and running properly
            Microsoft.PowerShell.Utility\Write-Verbose `
                "Ensuring Docker Desktop is available..."

            GenXdev.Windows\EnsureDockerDesktop

            # verify docker is responding to commands after ensuring it's running
            if (-not (Test-DockerAvailability)) {

                throw "Docker is not available or not responding"
            }

            # handle force cleanup if requested by user for fresh installation
            if ($Force) {

                # output verbose information about forced cleanup process
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "Force flag specified - cleaning up existing resources..."

                # remove existing container and volume for clean slate
                Remove-DockerContainer $script:containerName

                Remove-DockerVolume $script:volumeName
            }

            # ensure we have the latest wireguard image available locally
            if (-not (Test-DockerImage $script:imageName) -or $Force) {

                # pull the docker image if not present or force specified
                if (-not (Get-WireGuardImage)) {

                    throw "Failed to obtain WireGuard Docker image"
                }
            }
            else {

                # log that image is already available locally
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "✅ WireGuard image already available"
            }

            # check current container state for appropriate action
            $containerExists = Test-DockerContainer $script:containerName

            $containerRunning = Test-DockerContainerRunning $script:containerName

            # handle existing container scenarios based on current state
            if ($containerExists) {

                # check if container is currently running
                if ($containerRunning) {

                    # verify container health for running container
                    if (Test-ServiceHealth) {

                        # log successful health check result
                        Microsoft.PowerShell.Utility\Write-Verbose `
                            "✅ WireGuard container is healthy and responding"
                    }
                    else {

                        # restart unhealthy running container to fix issues
                        Microsoft.PowerShell.Utility\Write-Verbose `
                            ("Container is running but not responding - " +
                             "restarting...")

                        # restart the container to fix health issues
                        $null = docker restart $script:containerName 2>$null

                        # wait for container to restart properly
                        Microsoft.PowerShell.Utility\Start-Sleep -Seconds 10

                        # wait for service to become ready after restart
                        $serviceReady = Wait-ServiceReady

                        # warn if service is not ready after restart attempt
                        if (-not $serviceReady) {

                            Microsoft.PowerShell.Utility\Write-Warning `
                                ("WireGuard service may not be fully ready " +
                                 "after restart")
                        }
                    }
                }
                else {

                    # start existing stopped container
                    Microsoft.PowerShell.Utility\Write-Verbose `
                        "Starting existing container..."

                    # start the stopped container
                    $null = docker start $script:containerName 2>$null

                    # wait for container to start properly
                    Microsoft.PowerShell.Utility\Start-Sleep -Seconds 10

                    # wait for service to become ready after start
                    $serviceReady = Wait-ServiceReady

                    # log or warn about service readiness after start
                    if ($serviceReady) {

                        Microsoft.PowerShell.Utility\Write-Verbose `
                            "✅ WireGuard service is ready after container start"
                    }
                    else {

                        Microsoft.PowerShell.Utility\Write-Warning `
                            ("WireGuard service may not be fully ready " +
                             "after start")
                    }
                }
            }
            else {

                # create and start new container when none exists
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "Creating and starting WireGuard container..."

                # attempt to create new wireguard container
                if (-not (New-WireGuardContainer)) {

                    throw "Failed to create WireGuard container"
                }

                # wait for service to be ready after creation
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "Waiting for WireGuard service to be ready..."

                $serviceReady = Wait-ServiceReady

                # log or warn about service readiness after creation
                if ($serviceReady) {

                    Microsoft.PowerShell.Utility\Write-Verbose `
                        "✅ WireGuard service is ready"
                }
                else {

                    Microsoft.PowerShell.Utility\Write-Warning `
                        ("WireGuard service may not be fully ready " +
                         "after creation")
                }
            }

            # perform final validation of service state before returning
            Microsoft.PowerShell.Utility\Write-Verbose `
                "Performing final validation..."

            # check if container is running and service is healthy
            if ((Test-DockerContainerRunning $script:containerName) -and `
                (Test-ServiceHealth)) {

                # log successful service operation
                Microsoft.PowerShell.Utility\Write-Verbose `
                    ("✅ WireGuard VPN service is fully " +
                     "operational on port $script:servicePort")

                # display instructions for client configuration to user
                Microsoft.PowerShell.Utility\Write-Host -ForegroundColor Green @"

To generate client configurations:
- Run: docker exec -it $script:containerName /app/show-peer 1
This will display a QR code or config file for the client.

For Android 10 and above:
1. Install the official WireGuard app from Google Play Store
2. Scan the QR code or import the config file to connect
"@

                return $true
            }
            else {

                # warn about potential service issues
                Microsoft.PowerShell.Utility\Write-Warning `
                    "WireGuard service may not be fully operational"

                return $false
            }
        }
        catch {

            # log error details for any failures in the process
            Microsoft.PowerShell.Utility\Write-Error `
                "Failed to ensure WireGuard service: $_"

            throw
        }
    }    end {

        # restore original location for cleanup after function execution
        Microsoft.PowerShell.Management\Set-Location $script:originalLocation
    }
}
        ###############################################################################
