################################################################################
<#
.SYNOPSIS
Returns the process of the window responsible for hosting the PowerShell terminal.

.DESCRIPTION
Traverses up the process tree from the current PowerShell process to find the
parent window that hosts the terminal. If the immediate parent has no main
window, it looks for similar processes with main windows.

.EXAMPLE
Get-PowershellMainWindowProcess

Returns the process object for the window hosting the current PowerShell session.
#>
function Get-PowershellMainWindowProcess {

    [CmdletBinding()]
    param()

    begin {

        # get the current powershell process
        $currentProcess = [System.Diagnostics.Process]::GetCurrentProcess()

        # initialize parent process tracking
        $parentProcess = $currentProcess

        Write-Verbose "Starting from process: $($currentProcess.ProcessName)"
    }

    process {

        # traverse up the process tree until we find a window or hit the top
        while (($parentProcess.MainWindowHandle -eq 0) -and
            ($null -ne $parentProcess.Parent)) {

            $parentProcess = $parentProcess.Parent
            Write-Verbose "Checking parent process: $($parentProcess.ProcessName)"
        }

        # if we found a process with a main window, use it
        if ($parentProcess.MainWindowHandle -ne 0) {

            Write-Verbose "Found parent with main window: $($parentProcess.ProcessName)"
            $currentProcess = $parentProcess
        }
        else {
            # look for similar processes that have main windows
            $similarProcess = Get-Process -Name $currentProcess.Parent.ProcessName |
                Where-Object { 0 -ne $PSItem.MainWindowHandle } |
                Select-Object -First 1

            if ($null -ne $similarProcess) {

                Write-Verbose "Found similar process with main window: $($similarProcess.ProcessName)"
                $currentProcess = $similarProcess
            }
            else {
                Write-Verbose "No similar parent process found with main window"
            }
        }
    }

    end {

        # return the found process
        $currentProcess
    }
}
################################################################################
