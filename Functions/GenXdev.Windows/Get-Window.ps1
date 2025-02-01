################################################################################
<#
.SYNOPSIS
Gets window information for specified processes or window handles.

.DESCRIPTION
Retrieves window information either by process id, name or window handle. Returns
a WindowObj containing details about the main window of the specified process(es).

.PARAMETER ProcessId
The ID of the process to get window information for.

.PARAMETER ProcessName
The name of the process(es) to get window information for. Supports wildcards.

.PARAMETER WindowHandle
The specific window handle to get information for.

.EXAMPLE
Get-Window -ProcessName "notepad"

.EXAMPLE
Get-Window -ProcessId 1234

.EXAMPLE
Get-Window -WindowHandle 12345
#>
function Get-Window {

    [CmdletBinding(DefaultParameterSetName = "ByProcessName")]
    [Alias()]
    param (
        #######################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ParameterSetName = "ByProcessName",
            HelpMessage = "Name of the process to get window information for"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $ProcessName,

        #######################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ParameterSetName = "ByProcessId",
            HelpMessage = "ID of the process to get window information for"
        )]
        [ValidateNotNull()]
        [int] $ProcessId,

        #######################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ParameterSetName = "ByWindowHandle",
            HelpMessage = "Window handle to get information for"
        )]
        [ValidateNotNull()]
        [long] $WindowHandle
        #######################################################################
    )

    begin {

        Write-Verbose "Starting Get-Window with ParameterSet: $($PSCmdlet.ParameterSetName)"
    }

    process {

        if ($WindowHandle -gt 0) {

            Write-Verbose "Getting window information for handle: $WindowHandle"
            [GenXdev.Helpers.WindowObj]::GetMainWindow($WindowHandle)
            return
        }

        if ($ProcessId -gt 0) {

            Write-Verbose "Getting window information for process ID: $ProcessId"
            $process = Get-Process -Id $ProcessId -ErrorAction SilentlyContinue

            if ($process.MainWindowHandle -ne 0) {
                [GenXdev.Helpers.WindowObj]::GetMainWindow($process)
            }
            return
        }

        Write-Verbose "Getting window information for process: $ProcessName"
        # get all processes matching the name pattern that have a main window
        Get-Process "*$ProcessName*" -ErrorAction SilentlyContinue |
            Where-Object -Property MainWindowHandle -NE 0 |
            ForEach-Object -Process {
                [GenXdev.Helpers.WindowObj]::GetMainWindow($PSItem)
            }
    }

    end {
    }
}
################################################################################
