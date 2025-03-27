################################################################################
<#
.SYNOPSIS
Returns the process object for the window hosting the PowerShell terminal.

.DESCRIPTION
Traverses up the process tree starting from the current PowerShell process to
locate the parent window responsible for hosting the terminal. If the immediate
parent process doesn't have a main window handle, it searches for similar
processes that do have main windows. This is useful for identifying the actual
terminal window process (like Windows Terminal, ConHost, etc.) that contains
the PowerShell session.

.EXAMPLE
$hostProcess = Get-PowershellMainWindowProcess
Write-Host "PowerShell is hosted in: $($hostProcess.ProcessName)"

Returns the process hosting the current PowerShell session and displays its name.
#>
function Get-PowershellMainWindowProcess {

    [CmdletBinding()]
    param()

    begin {
        # get reference to the powershell process currently executing this code
        $currentProcess = [System.Diagnostics.Process]::GetCurrentProcess()

        # initialize parent tracking, starting with current process
        $parentProcess = $currentProcess.Parent

        # log the starting point of our search
        Microsoft.PowerShell.Utility\Write-Verbose "Starting process tree traversal from: $($currentProcess.ProcessName)"
    }


process {

        # traverse up process tree until we find a window or hit the root
        while ((($null -ne $parentProcess) -and ($parentProcess.MainWindowHandle -eq 0)) -and
            ($null -ne $parentProcess.Parent)) {

            $parentProcess = $parentProcess.Parent
            Microsoft.PowerShell.Utility\Write-Verbose "Examining parent process: $($parentProcess.ProcessName)"
        }

        # if parent has a main window, use that process
        if (($null -ne $parentProcess) -and ($parentProcess.MainWindowHandle -ne 0)) {

            Microsoft.PowerShell.Utility\Write-Verbose "Found parent with main window: $($parentProcess.ProcessName)"
            $currentProcess = $parentProcess
        }
        else {
            # look for other instances of parent process that have main windows
            $similarProcess = Microsoft.PowerShell.Management\Get-Process -Name $currentProcess.Parent.ProcessName |
            Microsoft.PowerShell.Core\Where-Object { 0 -ne $PSItem.MainWindowHandle } |
            Microsoft.PowerShell.Utility\Select-Object -First 1

            if ($null -ne $similarProcess) {

                Microsoft.PowerShell.Utility\Write-Verbose "Found similar process with window: $($similarProcess.ProcessName)"
                $currentProcess = $similarProcess
            }
            else {
                Microsoft.PowerShell.Utility\Write-Verbose "No window-owning process found in hierarchy"
            }
        }

        # Additional check for environments like Visual Studio Code
        if ($currentProcess.ProcessName -eq "Code") {
            Microsoft.PowerShell.Utility\Write-Verbose "Detected Visual Studio Code as the host. Adjusting logic..."
            $vscodeProcess = Microsoft.PowerShell.Management\Get-Process -Name "Code" |
            Microsoft.PowerShell.Core\Where-Object { $_.Id -eq $currentProcess.Id } |
            Microsoft.PowerShell.Utility\Select-Object -First 1

            if ($null -ne $vscodeProcess) {
                Microsoft.PowerShell.Utility\Write-Verbose "Using Visual Studio Code process as the host."
                $currentProcess = $vscodeProcess
            }
        }

        # Additional check for environments like Visual Studio
        if ($currentProcess.ProcessName -eq "devenv") {
            Microsoft.PowerShell.Utility\Write-Verbose "Detected Visual Studio (devenv) as the host. Adjusting logic..."
            $vsProcess = Microsoft.PowerShell.Management\Get-Process -Name "devenv" |
            Microsoft.PowerShell.Core\Where-Object { $_.Id -eq $currentProcess.Id } |
            Microsoft.PowerShell.Utility\Select-Object -First 1

            if ($null -ne $vsProcess) {
                Microsoft.PowerShell.Utility\Write-Verbose "Using Visual Studio process as the host."
                $currentProcess = $vsProcess
            }
        }

        # Additional check for VSCodium (VSCode fork)
        if ($currentProcess.ProcessName -eq "VSCodium") {
            Microsoft.PowerShell.Utility\Write-Verbose "Detected VSCodium as the host. Adjusting logic..."
            $vscodiumProcess = Microsoft.PowerShell.Management\Get-Process -Name "VSCodium" |
            Microsoft.PowerShell.Core\Where-Object { $_.Id -eq $currentProcess.Id } |
            Microsoft.PowerShell.Utility\Select-Object -First 1

            if ($null -ne $vscodiumProcess) {
                Microsoft.PowerShell.Utility\Write-Verbose "Using VSCodium process as the host."
                $currentProcess = $vscodiumProcess
            }
        }

        # Additional check for Code - OSS (open-source VSCode fork)
        if ($currentProcess.ProcessName -eq "Code - OSS") {
            Microsoft.PowerShell.Utility\Write-Verbose "Detected Code - OSS as the host. Adjusting logic..."
            $codeOssProcess = Microsoft.PowerShell.Management\Get-Process -Name "Code - OSS" |
            Microsoft.PowerShell.Core\Where-Object { $_.Id -eq $currentProcess.Id } |
            Microsoft.PowerShell.Utility\Select-Object -First 1

            if ($null -ne $codeOssProcess) {
                Microsoft.PowerShell.Utility\Write-Verbose "Using Code - OSS process as the host."
                $currentProcess = $codeOssProcess
            }
        }

        # Additional check for JetBrains IDEs (e.g., IntelliJ IDEA, PyCharm, etc.)
        if ($currentProcess.ProcessName -match "idea64|pycharm64|webstorm64|clion64|goland64|rider64") {
            Microsoft.PowerShell.Utility\Write-Verbose "Detected JetBrains IDE as the host. Adjusting logic..."
            $jetbrainsProcess = Microsoft.PowerShell.Management\Get-Process -Name $currentProcess.ProcessName |
            Microsoft.PowerShell.Core\Where-Object { $_.Id -eq $currentProcess.Id } |
            Microsoft.PowerShell.Utility\Select-Object -First 1

            if ($null -ne $jetbrainsProcess) {
                Microsoft.PowerShell.Utility\Write-Verbose "Using JetBrains IDE process as the host."
                $currentProcess = $jetbrainsProcess
            }
        }
    }

    end {

        # return the process we identified as the window host
        $currentProcess
    }
}
################################################################################