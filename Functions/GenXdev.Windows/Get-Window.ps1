################################################################################
<#
.SYNOPSIS
Gets window information for specified processes or window handles.

.DESCRIPTION
Retrieves window information using process name, ID, or window handle. Returns
WindowObj objects containing details about the main windows of matching processes.
Supports wildcards when searching by process name.

.PARAMETER ProcessName
Name of the process(es) to get window information for. Supports wildcards.

.PARAMETER ProcessId
Process ID to get window information for. Must be a valid running process ID.

.PARAMETER WindowHandle
Window handle to get information for. Must be a valid window handle number.

.EXAMPLE
Get-Window -ProcessName "notepad"
Gets window information for all running Notepad instances.

.EXAMPLE
gwin -Id 1234
Gets window information for the process with ID 1234 using the alias.

.EXAMPLE
window -Handle 45678
Gets window information for specific window handle using the alias.
#>
function Get-Window {

    [CmdletBinding()]
    [Alias("gwin", "window")]
    param (
        ########################################################################
        [Parameter(
            Position = 0,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "Name of the process to get window information for"
        )]
        [ValidateNotNullOrEmpty()]
        [Alias("Name")]
        [SupportsWildcards()]
        [string] $ProcessName,

        ########################################################################
        [Parameter(
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "ID of the process to get window information for"
        )]
        [ValidateNotNull()]
        [Alias("Id", "PID")]
        [int] $ProcessId,

        ########################################################################
        [Parameter(
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "Window handle to get information for"
        )]
        [ValidateNotNull()]
        [Alias("Handle", "hWnd")]
        [long] $WindowHandle
        ########################################################################
    )

    begin {
        Microsoft.PowerShell.Utility\Write-Verbose "Starting Get-Window with ParameterSet: $($PSCmdlet.ParameterSetName)"
    }


process {

        # if window handle provided, get window info directly
        if ($WindowHandle -ne 0) {

            Microsoft.PowerShell.Utility\Write-Verbose "Getting window information for handle: $WindowHandle"
            [GenXdev.Helpers.WindowObj]::GetMainWindow($WindowHandle)
            return
        }

        # if process id provided, get window info for that specific process
        if ($ProcessId -ne 0) {

            Microsoft.PowerShell.Utility\Write-Verbose "Getting window information for process ID: $ProcessId"
            $process = Microsoft.PowerShell.Management\Get-Process -Id $ProcessId -ErrorAction SilentlyContinue

            if ($null -ne $process -and $process.MainWindowHandle -ne 0) {
                [GenXdev.Helpers.WindowObj]::GetMainWindow($process)
            }
            return
        }

        # get window info for all processes matching the name pattern
        Microsoft.PowerShell.Utility\Write-Verbose "Getting window information for process name: $ProcessName"
        if (-not ($ProcessName.Contains("*") -or $ProcessName.Contains("?"))) {

            $ProcessName = "$ProcessName*"
        }
        Microsoft.PowerShell.Management\Get-Process "$ProcessName" -ErrorAction SilentlyContinue |
        Microsoft.PowerShell.Core\Where-Object { $_.MainWindowHandle -ne 0 } |
        Microsoft.PowerShell.Core\ForEach-Object {
            [GenXdev.Helpers.WindowObj]::GetMainWindow($_)
        }
    }

    end {
    }
}
################################################################################