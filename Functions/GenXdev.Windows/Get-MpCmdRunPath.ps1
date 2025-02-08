################################################################################
<#
.SYNOPSIS
Gets the path to the Windows Defender MpCmdRun.exe executable.

.DESCRIPTION
This function locates and returns the path to MpCmdRun.exe, which is the Windows
Defender command-line utility. It checks the standard installation location and
provides appropriate error handling.

.EXAMPLE
$defenderPath = Get-MpCmdRunPath
#>
function Get-MpCmdRunPath {

    [CmdletBinding()]
    param()

    begin {

        # define the expected path for MpCmdRun.exe
        $mpCmdRunPath = Join-Path -Path $env:ProgramFiles `
                                 -ChildPath "Windows Defender\MpCmdRun.exe"

        Write-Verbose "Looking for MpCmdRun.exe at: $mpCmdRunPath"
    }

    process {

        # verify the existence of MpCmdRun.exe using faster IO.File method
        if ([IO.File]::Exists($mpCmdRunPath)) {

            Write-Verbose "MpCmdRun.exe found successfully"
            return $mpCmdRunPath
        }

        # if the file is not found, throw an error
        $errorMsg = "MpCmdRun.exe not found at: $mpCmdRunPath"
        Write-Error -Message $errorMsg -Category ObjectNotFound
    }

    end {
    }
}
################################################################################
