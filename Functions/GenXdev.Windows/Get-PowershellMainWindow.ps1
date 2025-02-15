################################################################################
<#
.SYNOPSIS
Returns a window helper object for the PowerShell terminal's main window.

.DESCRIPTION
Retrieves a WindowObj helper object that represents the main window of the current
PowerShell host process. This allows manipulation and interaction with the
terminal window itself.

.EXAMPLE
$mainWindow = Get-PowershellMainWindow
$mainWindow.SetForeground()

.OUTPUTS
GenXdev.Helpers.WindowObj
Represents the main window of the PowerShell host process with properties and
methods for window manipulation.
#>
function Get-PowershellMainWindow {

    [CmdletBinding()]
    [OutputType([GenXdev.Helpers.WindowObj])]
    param()

    begin {

        # log the start of the window retrieval process
        Write-Verbose "Starting to locate PowerShell main window..."
    }

    process {

        # get the powershell host process using the helper function
        Write-Verbose "Retrieving PowerShell host process..."
        $process = Get-PowershellMainWindowProcess

        # verify we have a valid process before proceeding
        if ($null -eq $process) {
            Write-Error "Failed to retrieve PowerShell host process"
            return
        }

        Write-Verbose "Found PowerShell process with ID: $($process.Id)"

        # attempt to get the main window handle from the process
        Write-Verbose "Attempting to get main window handle..."
        $mainWindow = [GenXdev.Helpers.WindowObj]::GetMainWindow($process)[0]

        # verify we have a valid window handle
        if ($null -eq $mainWindow) {
            Write-Error "Failed to retrieve main window for PowerShell process"
            return
        }

        Write-Verbose "Successfully retrieved main window handle: $($mainWindow.Handle)"

        # return the window object for manipulation
        $mainWindow
    }

    end {
    }
}
################################################################################
