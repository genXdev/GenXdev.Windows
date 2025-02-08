################################################################################
<#
.SYNOPSIS
Executes a Windows Defender virusscan on a specified file or directory.

.DESCRIPTION
Executes a Windows Defender virusscan on a specified file or directory using the
MpCmdRun.exe command-line utility. Returns true if no threats were found.

.PARAMETER FilePath
The path to the file or directory to be scanned.

.PARAMETER EnableRemediation
When specified, instructs Windows Defender to take action on found threats.

.EXAMPLE
Test-PathUsingWindowsDefender -FilePath "C:\Path\To\File.txt" -Verbose

.EXAMPLE
virusscan "C:\Path\To\File.txt"
#>
function Test-PathUsingWindowsDefender {

    [OutputType([bool])]
    [Alias("virusscan")]
    [Alias("HasNoVirus")]
    [CmdletBinding()]
    param (
        ########################################################################
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The path to the file or directory to be scanned"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $FilePath,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Instructs Windows Defender to take action on threats"
        )]
        [switch] $EnableRemediation
        ########################################################################
    )

    begin {

        # get the full path to the windows defender command line utility
        $mpCmdRunPath = Get-MpCmdRunPath

        # validate windows defender cli exists
        if ($null -eq $mpCmdRunPath) {
            throw "Windows Defender CLI (MpCmdRun.exe) not found"
        }
    }

    process {

        # expand the file path to full path
        $expandedPath = Expand-Path $FilePath

        # validate file exists
        if (-not [System.IO.File]::Exists($expandedPath)) {
            Write-Error "File or directory not found: $expandedPath"
            return $false
        }

        Write-Verbose "Scanning file: $expandedPath"

        # prepare scan command based on remediation flag
        $scanParams = @(
            "-Scan",
            "-ScanType", "3",
            "-File", "`"$expandedPath`""
        )

        if (-not $EnableRemediation) {
            $scanParams += "-DisableRemediation"
        }

        # execute the scan and capture output
        $null = & $mpCmdRunPath $scanParams | ForEach-Object {
            Write-Verbose $_
        }

        # return true if scan completed successfully (no threats found)
        return ($LASTEXITCODE -eq 0)
    }

    end {
    }
}
################################################################################
