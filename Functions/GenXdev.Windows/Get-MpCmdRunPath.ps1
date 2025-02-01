###############################################################################

function Get-MpCmdRunPath {

    # Construct the path to MpCmdRun.exe
    $mpCmdRunPath = "$($Env:ProgramFiles)\Windows Defender\MpCmdRun.exe"

    # Check if the file exists
    if (Test-Path -Path $mpCmdRunPath) {

        return $mpCmdRunPath

    }
    else {

        Write-Error "MpCmdRun.exe not found at the expected location: $mpCmdRunPath"
    }
}
