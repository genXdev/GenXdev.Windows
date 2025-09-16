<##############################################################################
Part of PowerShell module : GenXdev.Windows
Original cmdlet filename  : Get-OpenedFileHandleProcesses.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.264.2025
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
###############################################################################
<#
.SYNOPSIS
Retrieves processes that have open file handles to specified files.

.DESCRIPTION
Uses the Sysinternals handle.exe tool to identify processes that currently have
open handles to one or more specified files. This is useful for determining
which processes are preventing file operations like deletion or modification.

The function requires handle.exe from the Sysinternals suite to be installed
and available in the system path. It parses the output from handle.exe to
identify processes with open handles to the specified files and returns
detailed information about those processes.

.PARAMETER FilePath
The path to the file(s) to check for open handles. Supports pipeline input.
Multiple file paths can be provided to check multiple files at once.

.EXAMPLE
Get-OpenedFileHandleProcesses -FilePath "C:\temp\example.txt"
Identifies all processes that have open handles to the specified file

.EXAMPLE
"file1.txt", "file2.txt" | Get-OpenedFileHandleProcesses
Checks multiple files via pipeline input for processes with open handles
#>
function Get-OpenedFileHandleProcesses {


    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    param(
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The path to the file(s) to check for open handles'
        )]
        [ValidateNotNullOrEmpty()]
        [string[]]$FilePath
        ########################################################################
    )

    begin {

        # log start of process detection for user visibility
        Microsoft.PowerShell.Utility\Write-Verbose 'Starting file handle process detection...'

        # ensure handle.exe from sysinternals is available before proceeding
        GenXdev.Windows\EnsurePSTools -PSExeName 'handle.exe'

        # log the path to handle.exe to help with troubleshooting
        Microsoft.PowerShell.Utility\Write-Verbose "Using handle.exe at: $HandleExePath"
    }

    process {

        # process each file path provided by the user
        foreach ($file in $FilePath) {

            # log which file we are currently checking
            Microsoft.PowerShell.Utility\Write-Verbose "Checking file handles for: $file"

            try {
                # execute handle.exe to get file handle information
                # -accepteula: automatically accept the eula
                # -a: show all information about file handles
                # -u: show paths in unicode format
                $handleOutput = & handle.exe -accepteula -a -u $file 2>$null

                # check if handle.exe executed successfully
                if ($LASTEXITCODE -ne 0) {
                    Microsoft.PowerShell.Utility\Write-Warning (
                        "Handle.exe returned exit code $LASTEXITCODE " +
                        "for file: $file"
                    )
                    continue
                }

                # parse output to find processes with file handles
                # first filter for lines containing "pid:" which indicate a process handle
                $processes = $handleOutput |
                    Microsoft.PowerShell.Core\Where-Object {
                        $_ -match 'pid:'
                    } |
                    Microsoft.PowerShell.Core\ForEach-Object {
                        # match the pattern for pid and ensure it's the correct file
                        if ($_ -match "pid:\s*(\d+)\s+type:\s*File\s+.*$([regex]::Escape($file))") {
                            # extract the process id from the regex match
                            $processId = $Matches[1]
                            Microsoft.PowerShell.Utility\Write-Verbose (
                                "Found process with PID $processId accessing file: $file"
                            )

                            try {
                                # get detailed information about the process
                                $process = Microsoft.PowerShell.Management\Get-Process -Id $processId -ErrorAction Stop

                                # create and return a custom object with process details
                                [PSCustomObject]@{
                                    ProcessName = $process.ProcessName
                                    PID         = [int]$processId
                                    FilePath    = $file
                                    ProcessPath = $process.Path
                                }
                            }
                            catch {
                                # handle case where process info can't be retrieved
                                Microsoft.PowerShell.Utility\Write-Warning (
                                    "Could not retrieve process details for PID $processId"
                                )

                                # return object with available information
                                [PSCustomObject]@{
                                    ProcessName = 'Unknown'
                                    PID         = [int]$processId
                                    FilePath    = $file
                                    ProcessPath = $null
                                }
                            }
                        }
                    }

                # return the results or log that none were found
                if ($processes) {
                    Microsoft.PowerShell.Utility\Write-Verbose (
                        "Found $($processes.Count) process(es) with handles to: $file"
                    )
                    $processes
                }
                else {
                    Microsoft.PowerShell.Utility\Write-Verbose "No processes found with handles to: $file"
                }
            }
            catch {
                # handle any errors that occur during processing
                Microsoft.PowerShell.Utility\Write-Error (
                    "Error checking file handles for '$file': $($_.Exception.Message)"
                )
            }
        }
    }

    end {
        # log completion of the function
        Microsoft.PowerShell.Utility\Write-Verbose 'Completed file handle process detection'
    }
}