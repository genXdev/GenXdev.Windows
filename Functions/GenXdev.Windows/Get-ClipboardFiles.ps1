﻿###############################################################################
<#
.SYNOPSIS
Gets files from the Windows clipboard that were set for file operations like copy/paste.

.DESCRIPTION
This function retrieves file paths from the Windows clipboard that were previously
set for file operations. It handles both STA and MTA threading modes automatically,
ensuring compatibility across different PowerShell execution contexts. The function
validates file existence and returns only existing files/directories as objects
similar to Get-ChildItem or Get-Item output.

.EXAMPLE
Get-ClipboardFiles
Gets all files currently in the clipboard and returns them as file system objects.

.EXAMPLE
$clipboardFiles = Get-ClipboardFiles
$clipboardFiles | ForEach-Object { Write-Host $_.FullName }
Gets clipboard files and displays their full paths.

.EXAMPLE
Get-ClipboardFiles | Where-Object { $_.Extension -eq '.txt' }
Gets only text files from the clipboard.

.EXAMPLE
Get-ClipboardFiles | ls
Gets all files from the clipboard and lists them in a detailed format.
#>
function Get-ClipboardFiles {

    [CmdletBinding()]
    [Alias('getclipfiles')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    param ()

    # get current thread apartment state for clipboard compatibility
    $apartmentState = [System.Threading.Thread]::CurrentThread.GetApartmentState()

    # initialize collection for file paths
    $clipboardFilePaths = @()

    # check if running in single-threaded apartment mode
    if ($apartmentState -eq 'STA') {

        # load the system.windows.forms assembly for clipboard operations
        Microsoft.PowerShell.Utility\Add-Type -AssemblyName System.Windows.Forms

        # output verbose information about direct clipboard operation
        Microsoft.PowerShell.Utility\Write-Verbose `
            'Getting clipboard files directly in STA mode'

        try {
            # get file drop list from clipboard in sta mode
            $fileDropList = [System.Windows.Forms.Clipboard]::GetFileDropList()

            if ($null -ne $fileDropList) {
                $clipboardFilePaths = $fileDropList | Microsoft.PowerShell.Core\ForEach-Object { $_ }
            }
        }
        catch {
            # output verbose information if clipboard doesn't contain files
            Microsoft.PowerShell.Utility\Write-Verbose `
                'No file drop list found in clipboard or clipboard access failed'
            return
        }
    }
    else {

        # output verbose information about sta subprocess requirement
        Microsoft.PowerShell.Utility\Write-Verbose (
            'Current thread is MTA mode, launching STA subprocess ' +
            'for clipboard operation')

        # create a temporary file to receive the json data
        $tempFile = GenXdev.FileSystem\Expand-Path ([System.IO.Path]::GetTempFileName()) -DeleteExistingFile -CreateDirectory

        # define the powershell command to execute in sta mode
        $command = (
            'Microsoft.PowerShell.Utility\Add-Type -AssemblyName System.Windows.Forms;'+
            'try {'+
            "`$fileDropList = [System.Windows.Forms.Clipboard]::GetFileDropList();"+
            "if (`$null -ne `$fileDropList) {"+
            "`$paths = `$fileDropList | ForEach-Object { `$_ };"+
            "`$paths | ConvertTo-Json -Compress | Out-File '$tempFile';"+
            "} else { '[]' | Out-File '$tempFile'; }"+
            "} catch { '[]' | Out-File '$tempFile'; }"
        );

        try {

            # output verbose information about subprocess execution
            Microsoft.PowerShell.Utility\Write-Verbose `
                'Executing STA subprocess for clipboard operation'

            # prepare arguments for powershell subprocess
            $pwshArgs = @(
                '-STA',
                '-NoProfile',
                '-Command',
                $command
            )

            # start powershell subprocess in sta mode and wait for completion
            Microsoft.PowerShell.Management\Start-Process `
                -FilePath 'pwsh' `
                -ArgumentList $pwshArgs `
                -NoNewWindow `
                -Wait

            # read the result from temp file
            if (Microsoft.PowerShell.Management\Test-Path $tempFile) {
                $jsonContent = Microsoft.PowerShell.Management\Get-Content $tempFile -Raw
                if ($jsonContent.Trim()) {
                    $clipboardFilePaths = $jsonContent | Microsoft.PowerShell.Utility\ConvertFrom-Json -ErrorAction SilentlyContinue
                    if ($null -eq $clipboardFilePaths) {
                        $clipboardFilePaths = @()
                    }
                }
                Microsoft.PowerShell.Management\Remove-Item $tempFile -Force -ErrorAction SilentlyContinue
            }
        }
        catch {

            # cleanup temp file in case of error
            if (Microsoft.PowerShell.Management\Test-Path $tempFile) {
                Microsoft.PowerShell.Management\Remove-Item $tempFile -Force -ErrorAction SilentlyContinue
            }

            # output error if subprocess execution fails
            Microsoft.PowerShell.Utility\Write-Error `
                "Error invoking pwsh: $_"
            return
        }
    }

    # exit early if no file paths retrieved
    if (($null -eq $clipboardFilePaths) -or ($clipboardFilePaths.Count -eq 0)) {
        return
    }

    $done = @{}
    # validate each file path and collect only existing files/directories
    $validFileObjects = $clipboardFilePaths |
        Microsoft.PowerShell.Core\ForEach-Object {

            # expand the file path to absolute path
            $path = GenXdev.FileSystem\Expand-Path $_

            if ($done.ContainsKey($path)) {
                # skip if this path has already been processed
                return
            }

            # mark this path as processed
            $done[$path] = $true

            # check if file exists and return as file system object
            if ([System.IO.File]::Exists($path)) {

                # return file object similar to Get-Item
                Microsoft.PowerShell.Management\Get-Item -Path $path -ErrorAction SilentlyContinue
                return
            }

            if ([System.IO.Directory]::Exists($path)) {

                # return directory object similar to Get-Item
                Microsoft.PowerShell.Management\Get-Item -Path $path -ErrorAction SilentlyContinue
                return
            }
        }

    # output verbose information about results
    if ($null -ne $validFileObjects) {
        $count = @($validFileObjects).Count
        Microsoft.PowerShell.Utility\Write-Verbose `
            "Retrieved $count valid file/directory objects from clipboard"
    }

    # return the valid file system objects
    return $validFileObjects
}

###############################################################################
