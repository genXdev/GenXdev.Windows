################################################################################
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
# Returns path like: "${env:ProgramFiles}\Windows Defender\MpCmdRun.exe"
#>
function Get-MpCmdRunPath {

    [CmdletBinding()]
    param()

    begin {
        # construct the expected path for the Windows Defender command-line tool
        $mpCmdRunPath = Microsoft.PowerShell.Management\Join-Path -Path $env:ProgramFiles `
            -ChildPath "Windows Defender\MpCmdRun.exe"

        # log the path we're checking
        Microsoft.PowerShell.Utility\Write-Verbose "Attempting to locate MpCmdRun.exe at: $mpCmdRunPath"
    }

    process {

        # verify file existence using optimized IO.File method instead of Test-Path
        if ([IO.File]::Exists($mpCmdRunPath)) {

            Microsoft.PowerShell.Utility\Write-Verbose "Successfully located MpCmdRun.exe"
            return $mpCmdRunPath
        }

        # if executable not found, throw descriptive error
        $errorMsg = "Windows Defender executable not found at: $mpCmdRunPath"
        Microsoft.PowerShell.Utility\Write-Error -Message $errorMsg -Category ObjectNotFound
    }

    end {
    }
}
################################################################################