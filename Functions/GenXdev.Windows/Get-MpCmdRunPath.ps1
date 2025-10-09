<##############################################################################
Part of PowerShell module : GenXdev.Windows
Original cmdlet filename  : Get-MpCmdRunPath.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.300.2025
################################################################################
Copyright (c)  René Vaessen / GenXdev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
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