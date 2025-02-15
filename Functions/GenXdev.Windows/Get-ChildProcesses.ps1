################################################################################
<#
.SYNOPSIS
Retrieves all processes that are descendants of the current PowerShell process.

.DESCRIPTION
Examines all running processes and identifies those that have the current
PowerShell process as an ancestor in their parent process chain. This includes
both direct child processes and their descendants (grandchildren, etc.).

.EXAMPLE
# Get all child processes of the current PowerShell session
Get-ChildProcesses

.EXAMPLE
# Get child processes and display verbose output
Get-ChildProcesses -Verbose
#>
function Get-ChildProcesses {

    [CmdletBinding()]
    param()

    begin {

        # log start of process detection
        Write-Verbose "Starting child process detection..."

        # store current powershell process id for parent chain comparison
        $currentProcessId = $PID
        Write-Verbose "Current process ID: $currentProcessId"
    }

    process {

        # get all processes currently running on the system
        $allProcesses = Get-Process
        Write-Verbose "Retrieved $($allProcesses.Count) total processes"

        # filter processes by checking if current process is in their parent chain
        $allProcesses |
        Where-Object {
            $processToCheck = $_

            # traverse up the parent chain until we find our process or hit top
            while ($null -ne $processToCheck.Parent) {

                if ($processToCheck.Parent.Id -eq $currentProcessId) {
                    Write-Verbose "Found child process: $($processToCheck.Name) `
                            (ID: $($processToCheck.Id))"
                    return $true
                }

                $processToCheck = $processToCheck.Parent
            }

            return $false
        }
    }

    end {

        Write-Verbose "Completed child process detection"
    }
}
################################################################################
