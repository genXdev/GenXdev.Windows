################################################################################
<#
.SYNOPSIS
Retrieves child processes whose parent chain includes the current PowerShell process.

.DESCRIPTION
Returns processes that are children of the current PowerShell process by examining
their parent process chain. This includes both direct children and descendants.

.EXAMPLE
$childProcs = Get-ChildProcesses
#>
function Get-ChildProcesses {

    [CmdletBinding()]
    param()

    begin {
        Write-Verbose "Starting child process detection..."

        # store current process id for comparison
        $currentProcessId = $PID
        Write-Verbose "Current process ID: $currentProcessId"
    }

    process {
        # get all running processes
        $allProcesses = Get-Process
        Write-Verbose "Retrieved $($allProcesses.Count) total processes"

        # filter processes by checking their parent chain
        $allProcesses | Where-Object {
            $processToCheck = $_

            # traverse up the parent chain until we find our process or hit the top
            while ($null -ne $processToCheck.Parent) {

                if ($processToCheck.Parent.Id -eq $currentProcessId) {
                    Write-Verbose "Found child process: $($processToCheck.Name) (ID: $($processToCheck.Id))"
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
