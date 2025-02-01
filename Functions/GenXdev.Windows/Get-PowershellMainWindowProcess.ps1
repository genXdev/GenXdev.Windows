###############################################################################

<#
.SYNOPSIS
Returns the process of the window responsible for hosting the Powershell terminal

.DESCRIPTION
Returns the process of the window responsible for hosting the Powershell terminal
#>
function Get-PowershellMainWindowProcess {

    [CmdletBinding()]
    param()

    $PowershellProcess = [System.Diagnostics.Process]::GetCurrentProcess();
    $PProcess = $PowershellProcess;

    while (($PProcess.MainWindowHandle -eq 0) -and ($null -ne $PProcess.Parent)) {

        $PProcess = $PProcess.Parent;
    }

    if ($PProcess.MainWindowHandle -ne 0) {

        Write-Verbose "Parent has mainwindow"

        $PowershellProcess = $PProcess;
    }

    else {

        $PProcess = Get-Process -Name $PowershellProcess.Parent.ProcessName | Where-Object { 0 -ne $PSItem.MainWindowHandle } | Select-Object -First 1;

        if ($null -ne $PProcess) {

            Write-Verbose "Found simular process that has mainwindow"
            $PowershellProcess = $PProcess
        }
        else {
            Write-Verbose "No simular parent process found with main window"
        }
    }

    $PowershellProcess
}
