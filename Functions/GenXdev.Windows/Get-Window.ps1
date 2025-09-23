<##############################################################################
Part of PowerShell module : GenXdev.Windows
Original cmdlet filename  : Get-Window.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.286.2025
################################################################################
MIT License

Copyright 2021-2025 GenXdev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
################################################################################>
########################################################################
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
    [Alias('gwin', 'window')]
    param (
        ##################################################################
        [Parameter(
            Position = 0,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'Name of the process to get window information for'
        )]
        [ValidateNotNullOrEmpty()]
        [Alias('Name')]
        [SupportsWildcards()]
        [string] $ProcessName,

        ##################################################################
        [Parameter(
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'ID of the process to get window information for'
        )]
        [ValidateNotNull()]
        [Alias('Id', 'PID')]
        [int] $ProcessId,

        ##################################################################
        [Parameter(
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'Window handle to get information for'
        )]
        [ValidateNotNull()]
        [Alias('Handle', 'hWnd')]
        [long] $WindowHandle
        ##################################################################
    )

    begin {
        Microsoft.PowerShell.Utility\Write-Verbose "Starting Get-Window with ParameterSet: $($PSCmdlet.ParameterSetName)"
    }



    process {
        # Diagnostic: Print all screens' DeviceName and WorkingArea
        try {
            $allScreens = [WpfScreenHelper.Screen]::AllScreens
            foreach ($screen in $allScreens) {
                $wa = $screen.WorkingArea
                $dev = $screen.DeviceName
                Microsoft.PowerShell.Utility\Write-Verbose ("Screen: $dev, WorkingArea: X=$($wa.X) Y=$($wa.Y) W=$($wa.Width) H=$($wa.Height)")
            }
        } catch {}

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
        if (-not ($ProcessName.Contains('*') -or $ProcessName.Contains('?'))) {
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