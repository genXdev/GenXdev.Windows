################################################################################
<#
.SYNOPSIS
    Sends keys to a window as if typed by user

.DESCRIPTION
    Sends keys to the active window or to the window of a specified process
    as if typed by the user.

    The text strings can contain control characters like {F11} or {ENTER}
    they will press the corresponding keys, unless -Escape is specified.

    Line feeds will automatically be converted to {ENTER} control codes.
    and Tabs to {TAB}.

.PARAMETER Keys
    The text to send

.PARAMETER Escape
    Escape control characters like {F11} or {ENTER} or modifiers like +(meaning shift), ^(meaning control), %(meaning alt)

.PARAMETER Process
    The process to send the keys to

.PARAMETER HoldKeyboardFocus
    Hold the keyboard focus to the target process main window when complete

.EXAMPLE
    Send-Keys -Keys "Hello World" -Escape

.EXAMPLE
    Send-Keys -Keys "Hello World" -Process (Get-Process code | Select -First 1)
#>
function Send-Keys {

    [CmdletBinding()]
    param (
        [Parameter(
            Position = 0,
            Mandatory,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            ValueFromRemainingArguments,
            HelpMessage = "The text to send"
        )]
        [Alias("q", "Value", "Name", "Text", "Query", "Queries")]
        [string[]] $Keys,

        [Parameter(
            Mandatory = $false,
            HelpMessage = "Escape control characters like {F11} or {ENTER} or modifiers like +(meaning shift), ^(meaning control), %(meaning alt)"
        )]
        [switch] $Escape,

        [Parameter(
            Mandatory = $false,
            HelpMessage = "The process to send the keys to"
        )]
        [System.Diagnostics.Process] $Process,

        [Parameter(
            Mandatory = $false,
            HelpMessage = "Hold the keyboard focus to the target process main window when complete"
        )]
        [switch] $HoldKeyboardFocus,

        [Parameter(
            Mandatory = $false,
            HelpMessage = "Convert line feeds into Shift-Enter instead of just Enter"
        )]
        [switch] $ShiftEnter,

        [Parameter(
            Mandatory = $false,
            HelpMessage = "Optional extra delay between sending keys"
        )]
        [int] $DelayMilliSeconds = 0
    )

    begin {

        $windowProcess = $Process;
        $helper = New-Object -ComObject WScript.Shell;

        if ($null -ne $Process) {

            if ($windowProcess.MainWindowHandle -eq 0) {

                Start-Sleep 2 | Out-Null
            }

            while (($null -ne $windowProcess) -and ($windowProcess.MainWindowHandle -eq 0)) {

                $windowProcess = $windowProcess.Parent
            }

            if ($null -eq $windowProcess) {

                $windowProcess = (
                    Get-Process "$([IO.Path]::GetFileNameWithoutExtension($process.Path))" |
                    Where-Object {
                        ($PSItem.Id -ne $Process.Id) -and ($PSItem.MainWindowHandle -ne 0)
                    } |
                    Sort-Object -Property StartTime -Descending |
                    Select-Object -First 1
                );

                if ($null -eq $windowProcess) {

                    throw "could not find a window process to send the keys to"
                    return;
                }
            }

            try {
                $w = [GenXdev.Helpers.WindowObj]::new($windowProcess, $windowProcess.MainWindowTitle);
                $w.Show() | Out-Null;
                $w.SetForeground() | Out-Null
            }
            catch {

            }

            Set-ForegroundWindow -WindowHandle ($windowProcess.MainWindowHandle) | Out-Null

            [System.Threading.Thread]::Sleep(500);
        }
    }

    process {

        try {
            foreach ($key in $Keys) {

                $escapedQuery = $key -join " "

                if ($Escape -eq $true) {

                    $escapedQuery = $escapedQuery -replace '(\{)', '{{}'
                    $escapedQuery = $escapedQuery -replace '(\})', '{}}'
                }

                $escapedQuery = $escapedQuery -replace '`r', '`n'
                $escapedQuery = $escapedQuery -replace '`n`n', '`n'

                if ($ShiftEnter -eq $true) {

                    $escapedQuery = $escapedQuery -replace '`n', '+{ENTER}'
                }
                else {

                    $escapedQuery = $escapedQuery -replace '`n', '{ENTER}'
                }

                Write-Verbose "Sending keys: $escapedQuery"

                $helper.sendKeys($escapedQuery) | Out-Null

                if ($DelayMilliSeconds -gt 0) {

                    Start-Sleep -Milliseconds $DelayMilliSeconds
                }
            }
        }
        finally {
            if ($null -ne $windowProcess) {

                [System.Threading.Thread]::Sleep(1500);

                if (-not $HoldKeyboardFocus) {

                    try {
                        $psw = Get-PowershellMainWindow
                        $psw.SetForeground() | Out-Null
                        Set-ForegroundWindow -WindowHandle ($psw.Handle)
                    }
                    catch {}
                }
            }
        }
    }
}
