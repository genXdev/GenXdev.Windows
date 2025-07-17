###############################################################################
<#
.SYNOPSIS
Returns a window helper object for the PowerShell terminal's main window.

.DESCRIPTION
Retrieves a WindowObj helper object that represents the main window of the current
PowerShell host process. This allows manipulation and interaction with the
terminal window itself.

.EXAMPLE
$mainWindow = Get-PowershellMainWindow
$null = $mainWindow.SetForeground()

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
        Microsoft.PowerShell.Utility\Write-Verbose 'Starting to locate PowerShell main window...'
    }


    process {

        # get the powershell host process using the helper function
        Microsoft.PowerShell.Utility\Write-Verbose 'Retrieving PowerShell host process...'
        $process = GenXdev.Windows\Get-PowershellMainWindowProcess

        # verify we have a valid process before proceeding
        if ($null -eq $process -or $process.MainWindowHandle -eq 0) {
            Microsoft.PowerShell.Utility\Write-Error 'Failed to retrieve a valid PowerShell process with a main window'
            $process = Microsoft.PowerShell.Management\Get-Process -Id $PID
        }

        Microsoft.PowerShell.Utility\Write-Verbose "Found PowerShell process with ID: $($process.Id)"

        # attempt to get the main window handle from the process
        Microsoft.PowerShell.Utility\Write-Verbose 'Attempting to get main window handle...'
        $mainWindow = [GenXdev.Helpers.WindowObj]::GetMainWindow($process)[0]

        # verify we have a valid window handle
        if ($null -eq $mainWindow) {
            return $null
        }

        Microsoft.PowerShell.Utility\Write-Verbose "Successfully retrieved main window handle: $($mainWindow.Handle)"

        # return the window object for manipulation
        $mainWindow
    }

    end {
    }
}