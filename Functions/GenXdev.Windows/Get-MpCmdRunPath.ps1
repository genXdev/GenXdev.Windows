<##############################################################################
Part of PowerShell module : GenXdev.Windows
Original cmdlet filename  : Get-MpCmdRunPath.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.274.2025
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
Gets the path to the Windows Defender MpCmdRun.exe executable.

.DESCRIPTION
Locates and returns the full path to the Windows Defender command-line utility
(MpCmdRun.exe). The function checks the standard installation location in
Program Files and provides appropriate error handling if the file is not found.

.OUTPUTS
System.String
Returns the full path to MpCmdRun.exe if found.

.EXAMPLE
$defenderPath = Get-MpCmdRunPath
Returns path like: "${env:ProgramFiles}\Windows Defender\MpCmdRun.exe"
#>
function Get-MpCmdRunPath {

    [CmdletBinding()]
    param()

    begin {
        # construct the expected path for the Windows Defender command-line tool
        $mpCmdRunPath = Microsoft.PowerShell.Management\Join-Path -Path $env:ProgramFiles `
            -ChildPath 'Windows Defender\MpCmdRun.exe'

        # log the path we're checking
        Microsoft.PowerShell.Utility\Write-Verbose "Attempting to locate MpCmdRun.exe at: $mpCmdRunPath"
    }


    process {

        # verify file existence using optimized IO.File method instead of Test-Path
        if ([IO.File]::Exists($mpCmdRunPath)) {

            Microsoft.PowerShell.Utility\Write-Verbose 'Successfully located MpCmdRun.exe'
            return $mpCmdRunPath
        }

        # if executable not found, throw descriptive error
        $errorMsg = "Windows Defender executable not found at: $mpCmdRunPath"
        Microsoft.PowerShell.Utility\Write-Error -Message $errorMsg -Category ObjectNotFound
    }

    end {
    }
}