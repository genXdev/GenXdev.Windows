################################################################################
<#
.SYNOPSIS
Returns a window helper object for the PowerShell terminal's main window.

.DESCRIPTION
Retrieves and returns a window helper object that represents the main window of
the process hosting the current PowerShell terminal session.

.EXAMPLE
Get-PowershellMainWindow

.OUTPUTS
GenXdev.Helpers.WindowObj
#>
function Get-PowershellMainWindow {

    [CmdletBinding()]
    [OutputType([GenXdev.Helpers.WindowObj])]

    param()

    begin {

        Write-Verbose "Retrieving PowerShell main window process..."
    }

    process {

        # get the powershell host process
        $process = Get-PowershellMainWindowProcess

        # verify we have a valid process
        if ($null -eq $process) {
            Write-Error "Failed to retrieve PowerShell host process"
            return
        }

        Write-Verbose "Found PowerShell process with ID: $($process.Id)"

        # get the main window from the powershell host process
        $mainWindow = [GenXdev.Helpers.WindowObj]::GetMainWindow($process)[0]

        # verify we have a valid window handle
        if ($null -eq $mainWindow) {
            Write-Error "Failed to retrieve main window for PowerShell process"
            return
        }

        Write-Verbose "Main window handle: $($mainWindow.Handle)"

        # return the window object
        $mainWindow
    }

    end {
    }
}
################################################################################
