################################################################################
<#
.SYNOPSIS
Ensures Docker Desktop is installed and available for containerization
operations.

.DESCRIPTION
Verifies if Docker Desktop is installed and properly configured on the system.
If not found, installs Docker Desktop using WinGet and handles the complete
installation process automatically. This function also manages Docker Desktop
service startup, daemon readiness verification, and handles authentication
requirements when necessary. The function includes comprehensive path
management for both system and user-level Docker installations.

.PARAMETER ShowWindow
Shows the Docker Desktop window during initialization when specified. When
this switch is enabled, Docker Desktop will start with its window visible
instead of minimized to the system tray.

.EXAMPLE
EnsureDockerDesktop
Ensures Docker Desktop is installed and properly configured.

.EXAMPLE
EnsureDockerDesktop -ShowWindow
Ensures Docker Desktop is installed, properly configured, and shows its UI
window.
#>
function EnsureDockerDesktop {

    [CmdletBinding()]
    param(
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Show Docker Desktop window during initialization"
        )]
        [switch]$ShowWindow
        #######################################################################
    )

    begin {

        #######################################################################
        <#
        .SYNOPSIS
        Checks if the WinGet PowerShell module is installed.

        .DESCRIPTION
        Attempts to import the Microsoft.WinGet.Client module and verifies its
        presence by checking if the module is available after import attempt.
        This function is used to determine if WinGet capabilities are
        available before attempting package installations.

        .EXAMPLE
        IsWinGetInstalled
        Returns $true if WinGet module is available, $false otherwise.
        #>
        #######################################################################
        function IsWinGetInstalled {

            # attempt to load the winget module silently without error output
            Microsoft.PowerShell.Core\Import-Module "Microsoft.WinGet.Client" `
                -ErrorAction SilentlyContinue

            # verify if module was loaded successfully by checking module list
            $module = Microsoft.PowerShell.Core\Get-Module `
                "Microsoft.WinGet.Client" `
                -ErrorAction SilentlyContinue

            # return true if module object exists, false otherwise
            return $null -ne $module
        }

        #######################################################################
        <#
        .SYNOPSIS
        Installs the WinGet PowerShell module.

        .DESCRIPTION
        Installs and imports the Microsoft.WinGet.Client module for package
        management operations. Forces installation to override any conflicts
        and ensures the module is available for Docker Desktop installation.

        .EXAMPLE
        InstallWinGet
        Installs the WinGet PowerShell module from PowerShell Gallery.
        #>
        #######################################################################
        function InstallWinGet {

            # output status message about winget installation
            Microsoft.PowerShell.Utility\Write-Verbose ("Installing WinGet " +
                "PowerShell client...")

            # install winget module with force to ensure success and allow
            # clobber
            $null = PowerShellGet\Install-Module "Microsoft.WinGet.Client" `
                -Force `
                -AllowClobber

            # load the newly installed module into current session
            Microsoft.PowerShell.Core\Import-Module "Microsoft.WinGet.Client"
        }
    }

    process {

        # verify if docker desktop executable is available in current session
        if (@(Microsoft.PowerShell.Core\Get-Command 'docker.exe' `
            -ErrorAction SilentlyContinue).Length -eq 0) {

            # define common docker installation paths for system and user
            # installs
            $dockerPaths = @(
                "${env:ProgramFiles}\Docker\Docker\resources\bin",
                "${env:LOCALAPPDATA}\Programs\Docker\Docker\resources\bin"
            )

            # initialize flag to track if docker was found in known paths
            $dockerFound = $false

            # iterate through each potential docker installation path
            foreach ($path in $dockerPaths) {

                # check if docker executable exists in current path
                if (Microsoft.PowerShell.Management\Test-Path `
                    (Microsoft.PowerShell.Management\Join-Path $path `
                        "docker.exe")) {

                    # get current user PATH environment variable
                    $currentPath = [Environment]::GetEnvironmentVariable('PATH',
                        'User')

                    # add docker path to user PATH if not already present
                    if ($currentPath -notlike "*$path*") {

                        # inform user about path modification
                        Microsoft.PowerShell.Utility\Write-Verbose ("Adding " +
                            "Docker to system PATH...")

                        # update user PATH environment variable permanently
                        [Environment]::SetEnvironmentVariable(
                            'PATH',
                            "$currentPath;$path",
                            'User')
                    }

                    # update current session's path for immediate
                    # availability only if not already present
                    if ($env:PATH -notlike "*$path*") {
                        $env:PATH = "$env:PATH;$path"
                    }

                    # mark docker as found and exit loop
                    $dockerFound = $true
                    break
                }
            }

            # install docker if not found in known installation paths
            if (-not $dockerFound) {

                # inform user about docker installation process
                Microsoft.PowerShell.Utility\Write-Host ("Docker Desktop not " +
                    "found. Installing Docker Desktop...")

                # ensure winget is available before attempting docker
                # installation
                if (-not (IsWinGetInstalled)) {
                    InstallWinGet
                }

                # install docker desktop using winget package manager
                $null = Microsoft.WinGet.Client\Install-WinGetPackage `
                    -Id 'Docker.DockerDesktop' `
                    -Force

                # re-check docker paths after installation to update PATH
                foreach ($path in $dockerPaths) {

                    # verify docker executable exists in path after installation
                    if (Microsoft.PowerShell.Management\Test-Path `
                        (Microsoft.PowerShell.Management\Join-Path $path `
                            "docker.exe")) {

                        # get current user PATH environment variable
                        $currentPath = [Environment]::GetEnvironmentVariable(
                            'PATH', 'User')

                        # add docker path to PATH if not already present
                        if ($currentPath -notlike "*$path*") {

                            # inform user about path update after installation
                            Microsoft.PowerShell.Utility\Write-Verbose (
                                "Adding Docker to system PATH...")

                            # update user PATH environment variable
                            [Environment]::SetEnvironmentVariable(
                                'PATH',
                                "$currentPath;$path",
                                'User')

                            # update current session's path immediately only if not already present
                            if ($env:PATH -notlike "*$path*") {
                                $env:PATH = "$env:PATH;$path"
                            }
                        }
                        break
                    }
                }

                # verify docker installation was successful by checking command
                if (-not (Microsoft.PowerShell.Core\Get-Command 'docker.exe' `
                    -ErrorAction SilentlyContinue)) {

                    throw "Docker Desktop installation failed."
                }
            }
        }

        # check if docker desktop process is currently running
        $dockerDesktopProcess = Microsoft.PowerShell.Management\Get-Process `
            "Docker Desktop" `
            -ErrorAction SilentlyContinue

        # start docker desktop if process is not running
        if (-not $dockerDesktopProcess) {

            # inform user about docker desktop startup
            Microsoft.PowerShell.Utility\Write-Host "Starting Docker Desktop..."

            # try to find docker desktop executable via get-command
            $dockerExePath = Microsoft.PowerShell.Core\Get-Command `
                "Docker Desktop.exe" `
                -ErrorAction SilentlyContinue

            # start docker desktop if found via get-command
            if ($dockerExePath) {

                # start docker desktop process using found executable path
                if ($ShowWindow) {
                    # start with window visible if ShowWindow is specified
                    Microsoft.PowerShell.Management\Start-Process `
                        $dockerExePath.Source `
                        -WindowStyle Normal
                } else {
                    # start minimized by default (hidden in tray)
                    Microsoft.PowerShell.Management\Start-Process `
                        $dockerExePath.Source `
                        -WindowStyle Minimized
                }

                # wait for docker desktop to initialize (30 seconds)
                Microsoft.PowerShell.Utility\Start-Sleep 30
            }
            else {

                # define common docker desktop executable paths
                $dockerDesktopPaths = @(
                    "${env:ProgramFiles}\Docker\Docker\Docker Desktop.exe",
                    ("${env:LOCALAPPDATA}\Programs\Docker\Docker\" +
                        "Docker Desktop.exe")
                )

                # try each known docker desktop installation path
                foreach ($path in $dockerDesktopPaths) {

                    # check if docker desktop executable exists at current path
                    if (Microsoft.PowerShell.Management\Test-Path $path) {

                        # start docker desktop from found path with appropriate
                        # window style
                        if ($ShowWindow) {
                            # start with window visible if ShowWindow is specified
                            Microsoft.PowerShell.Management\Start-Process $path `
                                -WindowStyle Normal
                        } else {
                            # start minimized by default (hidden in tray)
                            Microsoft.PowerShell.Management\Start-Process $path `
                                -WindowStyle Minimized
                        }

                        # wait for docker desktop to initialize
                        Microsoft.PowerShell.Utility\Start-Sleep 30
                        break
                    }
                }
            }
        }
        # docker Desktop is already running, show window if -ShowWindow is
        # specified
        elseif ($ShowWindow) {

            # inform user that we're bringing docker desktop window to
            # foreground
            Microsoft.PowerShell.Utility\Write-Verbose ("Bringing Docker " +
                "Desktop window to the foreground...")

            # get the docker desktop window using the get-window function
            $dockerWindows = GenXdev.Windows\Get-Window `
                -ProcessName "Docker Desktop"

            # handle case where we found docker window(s)
            if ($dockerWindows) {

                # get first docker window from results
                $dockerWindow = $dockerWindows | `
                    Microsoft.PowerShell.Utility\Select-Object -First 1

                # bring window to foreground and restore it if minimized
                Microsoft.PowerShell.Utility\Write-Verbose ("Found Docker " +
                    "Desktop window, bringing to foreground...")

                $dockerWindow.Focus()

                $null = $dockerWindow.Restore()
            }
            else {

                # fallback to starting docker desktop again to bring foreground
                Microsoft.PowerShell.Utility\Write-Verbose ("Docker Desktop " +
                    "window not found, trying to start the application...")

                $dockerExePath = Microsoft.PowerShell.Core\Get-Command `
                    "Docker Desktop.exe" `
                    -ErrorAction SilentlyContinue

                # start docker desktop if executable was found
                if ($dockerExePath) {
                    Microsoft.PowerShell.Management\Start-Process `
                        $dockerExePath.Source `
                        -WindowStyle Normal
                }
            }
        }

        # wait for docker daemon to become ready for commands
        Microsoft.PowerShell.Utility\Write-Host ("Checking Docker Desktop " +
            "status...") -ForegroundColor Cyan

        # set timeout for waiting for docker daemon (600 seconds)
        $timeout = 600
        $elapsed = 0
        $engineMessageShown = $false
        $loginMessageShown = $false

        # loop until docker daemon is ready or timeout is reached
        while ($elapsed -lt $timeout) {

            # check if docker engine is running by trying a simple docker
            # command
            try {

                # attempt to get docker server version to verify engine status
                $null = docker.exe version --format '{{.Server.Version}}' 2>$null

                # verify command executed successfully
                if ($LASTEXITCODE -eq 0) {

                    # engine is running, check if user needs to log in
                    $dockerInfo = docker.exe info 2>&1

                    # check if login is required based on docker info output
                    if ($dockerInfo -match "not logged in" -or `
                        $dockerInfo -match "Please log in") {

                        # show login message only once
                        if (-not $loginMessageShown) {
                            Microsoft.PowerShell.Utility\Write-Host ("Docker " +
                                "engine is running, but user is not logged " +
                                "in. Please log in via Docker Desktop.") `
                                -ForegroundColor Yellow
                            $loginMessageShown = $true
                        }

                        # continue waiting or break - for many operations,
                        # login isn't required
                        Microsoft.PowerShell.Utility\Write-Host ("Docker " +
                            "engine is running and ready for basic " +
                            "operations.") -ForegroundColor Green
                        break
                    } else {

                        # either logged in or login check failed, assume docker
                        # is ready
                        Microsoft.PowerShell.Utility\Write-Host ("Docker " +
                            "engine is running and ready.") `
                            -ForegroundColor Green
                        break
                    }
                }
            }
            catch {

                # docker command failed, engine likely not ready
            }

            # show engine startup message only once
            if (-not $engineMessageShown) {
                Microsoft.PowerShell.Utility\Write-Host ("Waiting for " +
                    "Docker engine to start...") -ForegroundColor Yellow
                $engineMessageShown = $true
            }

            # wait before next check and increment elapsed time
            Microsoft.PowerShell.Utility\Start-Sleep -Seconds 5
            $elapsed += 5
        }

        # throw error if docker daemon failed to start within timeout
        if ($elapsed -ge $timeout) {
            throw ("Docker daemon failed to start within $timeout seconds.")
        }

        # output final success message about docker desktop readiness
        Microsoft.PowerShell.Utility\Write-Verbose ("✅ Docker Desktop is " +
            "ready.")
    }

    end {
        if ($ShowWindow) {

            try {
                $a = (GenXDev.Windows\Get-Window -ProcessName "Docker Desktop") ;
                if ($null -eq $a) { return }
                $a.Show()
                $a.Restore()
                GenXDev.Windows\Set-WindowPosition -WindowHelper $a -Monitor 0 -Right
                GenXDev.Windows\Set-WindowPosition -Left -Monitor 0 -Left
            }
            catch {

            }
        }
    }
}
################################################################################
