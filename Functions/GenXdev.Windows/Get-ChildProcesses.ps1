###############################################################################

<#
.SYNOPSIS
Retrieves child processes whose parent chain includes the current PowerShell process.

.DESCRIPTION
Returns processes that are children of the current PowerShell process by examining their parent process chain.

#>
function Get-ChildProcesses {
    $currentPID = $PID
    $processes = Get-Process;
    $processes | Where-Object {
        $process = $PSItem
        while ($null -ne $process.Parent) {

            if ($process.Parent.Id -eq $currentPID) {

                return $true
            }

            $process = $process.Parent
        }
        return $false
    }
}
