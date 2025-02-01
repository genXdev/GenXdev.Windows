###############################################################################
<#
.SYNOPSIS
Executes a Windows Defender virusscan on a specified file or directory.

.DESCRIPTION
Executes a Windows Defender virusscan on a specified file or directory using the MpCmdRun.exe command-line utility.
The function returns a boolean success result, when $true it indicates no threats where find in the file.

.PARAMETER FilePath
The path to the file or directory to be scanned.

.PARAMETER EnableRemediation
Instructs Windows Defender to take action when the provided FilePath contains a threat.

.EXAMPLE
Test-PathUsingWindowsDefender -FilePath "C:\Path\to\File.txt" -Verbose
#>

function Test-PathUsingWindowsDefender {

    [Alias("virusscan")]
    [Alias("HasNoVirus")]

    [CmdletBinding()]
    param (
        [parameter(
            Mandatory,
            Position = 0,
            HelpMessage = "The path to the file or directory to be scanned."
        )]
        [string] $FilePath,

        [parameter(
            Mandatory = $false,
            HelpMessage = "Instructs Windows Defender to take action when the provided FilePath contains a threat."
        )]
        [switch] $EnableRemediation
    )

    $FilePath = Expand-Path $FilePath
    $MpCmdRunPath = Get-MpCmdRunPath

    if (-not [IO.File]::Exists($filePath)) {

        throw "The file '$FilePath' was not found";
    }

    if ($null -eq $MpCmdRunPath) {

        throw "Windows defender CLI not found";
    }

    $scriptBlock = $EnableRemediation ? {

        & "$MpCmdrunPath" -Scan -ScanType 3 -File "$FilePath" |
        ForEach-Object {

            Write-Verbose $PSItem
        }
    } : {

        & "$MpCmdrunPath" -Scan -ScanType 3 -File "$FilePath" -DisableRemediation |
        ForEach-Object {

            Write-Verbose $PSItem
        }
    }

    Invoke-Command -ScriptBlock $scriptBlock

    return ($LASTEXITCODE -eq 0)
}
