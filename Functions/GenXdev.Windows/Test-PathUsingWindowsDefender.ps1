################################################################################
<#
.SYNOPSIS
Scans files or directories for malware using Windows Defender.

.DESCRIPTION
Performs a targeted scan of specified files or directories using Windows
Defender's command-line interface (MpCmdRun.exe). The function can either scan
in detection-only mode or with automatic threat remediation enabled.

.PARAMETER FilePath
The full or relative path to the file or directory to be scanned. The path will
be expanded to its full form before scanning.

.PARAMETER EnableRemediation
When specified, allows Windows Defender to automatically remove or quarantine any
detected threats. If omitted, the scan will only detect and report threats.

.EXAMPLE
Test-PathUsingWindowsDefender -FilePath "C:\Downloads\file.exe" -Verbose

.EXAMPLE
virusscan "C:\Downloads\file.exe" -EnableRemediation
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
        # locate the windows defender command line utility
        $mpCmdRunPath = Get-MpCmdRunPath

        # ensure the windows defender cli is available
        if ($null -eq $mpCmdRunPath) {
            throw "Windows Defender CLI (MpCmdRun.exe) not found"
        }
    }

    process {

        # convert relative or shortened paths to full filesystem paths
        $expandedPath = GenXdev.FileSystem\Expand-Path $FilePath

        # verify the target exists before attempting to scan
        if (-not [System.IO.File]::Exists($expandedPath)) {
            Write-Error "File or directory not found: $expandedPath"
            return $false
        }

        Write-Verbose "Initiating Windows Defender scan of: $expandedPath"

        # construct the scan command parameters
        $scanParams = @(
            "-Scan",
            "-ScanType", "3",
            "-File", "`"$expandedPath`""
        )

        # add remediation flag based on user preference
        if (-not $EnableRemediation) {
            $scanParams += "-DisableRemediation"
        }

        Write-Verbose "Executing scan with parameters: $($scanParams -join ' ')"

        # execute the windows defender scan and capture output
        $null = & $mpCmdRunPath $scanParams | ForEach-Object {
            Write-Verbose $_
        }

        # return scan result: true = no threats, false = threats found
        return ($LASTEXITCODE -eq 0)
    }

    end {
    }
}
################################################################################