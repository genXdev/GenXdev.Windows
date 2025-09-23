<##############################################################################
Part of PowerShell module : GenXdev.Windows
Original cmdlet filename  : Test-PathUsingWindowsDefender.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.284.2025
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
Scans files or directories for malware using Windows Defender.

.DESCRIPTION
Performs a targeted scan of specified files or directories using Windows
Defender's command-line interface (MpCmdRun.exe). The function can either scan
in detection-only mode or with automatic threat remediation enabled. Returns
true if no threats are detected, false if threats are found or scan fails.

.PARAMETER FilePath
The full or relative path to the file or directory to be scanned. The path will
be expanded to its full form before scanning. Accepts pipeline input and
supports both individual files and directories.

.PARAMETER EnableRemediation
When specified, allows Windows Defender to automatically remove or quarantine
any detected threats. If omitted, the scan will only detect and report threats
without taking any remediation action.

.EXAMPLE
Test-PathUsingWindowsDefender -FilePath "C:\Downloads\file.exe" -Verbose

.EXAMPLE
virusscan "C:\Downloads\file.exe" -EnableRemediation

.EXAMPLE
"C:\Downloads\file.exe" | HasNoVirus
#>
function Test-PathUsingWindowsDefender {

    [OutputType([bool])]
    [Alias('virusscan')]
    [Alias('HasNoVirus')]
    [CmdletBinding()]
    param (
        ########################################################################
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The path to the file or directory to be scanned'
        )]
        [ValidateNotNullOrEmpty()]
        [string] $FilePath,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = ('Instructs Windows Defender to take action on ' +
                'threats')
        )]
        [switch] $EnableRemediation
        ########################################################################
    )

    begin {

        # locate the windows defender command line utility
        $mpCmdRunPath = GenXdev.Windows\Get-MpCmdRunPath

        # ensure the windows defender cli is available
        if ($null -eq $mpCmdRunPath) {
            throw 'Windows Defender CLI (MpCmdRun.exe) not found'
        }
    }

    process {

        # convert relative or shortened paths to full filesystem paths
        $expandedPath = GenXdev.FileSystem\Expand-Path $FilePath

        # verify the target exists before attempting to scan
        if (-not [System.IO.File]::Exists($expandedPath)) {
            Microsoft.PowerShell.Utility\Write-Error ('File or directory not ' +
                "found: $expandedPath")

            return $false
        }

        # log the initiation of the scan operation
        Microsoft.PowerShell.Utility\Write-Verbose ('Initiating Windows ' +
            'Defender scan of: ' +
            "$expandedPath")

        # construct the scan command parameters array
        $scanParams = @(
            '-Scan',
            '-ScanType', '3',
            '-File', "`"$expandedPath`""
        )

        # add remediation flag based on user preference
        if (-not $EnableRemediation) {
            $scanParams += '-DisableRemediation'
        }

        # log the complete command being executed
        Microsoft.PowerShell.Utility\Write-Verbose ('Executing scan with ' +
            'parameters: ' +
            "$($scanParams -join ' ')")

        # execute the windows defender scan and capture output for verbose
        # logging
        $null = & $mpCmdRunPath $scanParams |
            Microsoft.PowerShell.Core\ForEach-Object {
                Microsoft.PowerShell.Utility\Write-Verbose $_
            }        # return scan result based on exit code: true = no threats, false =
        # threats found
        return ($LASTEXITCODE -eq 0)
    }

    end {
    }
}