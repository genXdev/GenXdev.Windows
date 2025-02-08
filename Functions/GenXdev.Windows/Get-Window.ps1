################################################################################
<#
.SYNOPSIS
Gets window information for specified processes or window handles.

.DESCRIPTION
Retrieves window information either by process id, name or window handle. Returns
a WindowObj containing details about the main window of the specified
process(es).

.PARAMETER ProcessName
Name of the process(es) to get window information for. Supports wildcards.

.PARAMETER ProcessId
The ID of the process to get window information for.

.PARAMETER WindowHandle
The specific window handle to get information for.

.EXAMPLE
Get-Window -ProcessName "notepad"
Gets window information for all notepad processes.

.EXAMPLE
Get-Window -ProcessId 1234
Gets window information for process with ID 1234.

.EXAMPLE
Get-Window -WindowHandle 12345
Gets window information for specific window handle.
#>
function Get-Window {

    [CmdletBinding(DefaultParameterSetName = "ByProcessName")]
    [Alias("gwin", "window")]
    param (
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ParameterSetName = "ByProcessName",
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "Name of the process to get window information for"
        )]
        [ValidateNotNullOrEmpty()]
        [Alias("Name")]
        [string] $ProcessName,

        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ParameterSetName = "ByProcessId",
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "ID of the process to get window information for"
        )]
        [ValidateNotNull()]
        [Alias("Id", "PID")]
        [int] $ProcessId,

        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ParameterSetName = "ByWindowHandle",
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "Window handle to get information for"
        )]
        [ValidateNotNull()]
        [Alias("Handle", "hWnd")]
        [long] $WindowHandle
        ########################################################################
    )

    begin {

        Write-Verbose "Starting Get-Window with ParameterSet: $($PSCmdlet.ParameterSetName)"
    }

    process {

        # handle window handle parameter
        if ($WindowHandle -gt 0) {

            Write-Verbose "Getting window information for handle: $WindowHandle"
            [GenXdev.Helpers.WindowObj]::GetMainWindow($WindowHandle)
            return
        }

        # handle process id parameter
        if ($ProcessId -gt 0) {

            Write-Verbose "Getting window information for process ID: $ProcessId"
            $process = Get-Process -Id $ProcessId -ErrorAction SilentlyContinue

            if ($null -ne $process -and $process.MainWindowHandle -ne 0) {
                [GenXdev.Helpers.WindowObj]::GetMainWindow($process)
            }
            return
        }

        # handle process name parameter
        Write-Verbose "Getting window information for process name: $ProcessName"
        Get-Process "*$ProcessName*" -ErrorAction SilentlyContinue |
            Where-Object { $_.MainWindowHandle -ne 0 } |
            ForEach-Object {
                [GenXdev.Helpers.WindowObj]::GetMainWindow($_)
            }
    }

    end {
    }
}
################################################################################
