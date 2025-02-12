################################################################################
<#
.SYNOPSIS
Sends simulated keystrokes to a window.

.DESCRIPTION
Sends keystrokes to either the active window or a specified process window as if
typed by a user. Supports special keys and modifiers through control sequences.

.PARAMETER Keys
The text or key sequences to send. Control sequences like {F11} or {ENTER} are
supported.

.PARAMETER Escape
When specified, escapes control sequences so they are sent as literal text.

.PARAMETER Process
Target process to receive the keystrokes. If not specified, sends to active
window.

.PARAMETER HoldKeyboardFocus
Maintains keyboard focus on the target window after sending keys.

.PARAMETER ShiftEnter
Converts line feeds to Shift+Enter instead of plain Enter.

.PARAMETER DelayMilliSeconds
Optional delay between sending keys in milliseconds.

.EXAMPLE
Send-Keys "say 'Hello World'{ENTER}Typing some text"

.EXAMPLE
Send-Keys -q "Special {F11} key" -Escape
#>
function Send-Keys {

    [CmdletBinding()]
    param (
        ########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            ValueFromRemainingArguments = $false,
            HelpMessage = "The text to send"
        )]
        [Alias("q", "Value", "Name", "Text", "Query", "Queries")]
        [ValidateNotNullOrEmpty()]
        [string[]] $Keys,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Escape control characters like {F11} or {ENTER} or modifiers like +(meaning shift), ^(meaning control), %(meaning alt)"
        )]
        [switch] $Escape,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The process to send the keys to"
        )]
        [System.Diagnostics.Process] $Process,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Hold keyboard focus on target window"
        )]
        [switch] $HoldKeyboardFocus,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Use Shift+Enter instead of Enter"
        )]
        [switch] $ShiftEnter,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Delay between different input strings in milliseconds"
        )]
        [ValidateRange(0, [int]::MaxValue)]
        [int] $DelayMilliSeconds = 0
    )

    begin {

        try {
            # initialize window process and create shell automation object
            $windowProcess = $Process
            $helper = New-Object -ComObject WScript.Shell

            if ($null -ne $Process) {

                # wait for main window handle if not immediately available
                if ($windowProcess.MainWindowHandle -eq 0) {
                    Start-Sleep -Seconds 2
                }

                # traverse up process tree looking for window handle
                while (($null -ne $windowProcess) -and
                   ($windowProcess.MainWindowHandle -eq 0)) {
                    $windowProcess = $windowProcess.Parent
                }

                # fallback to finding sibling process with window
                if ($null -eq $windowProcess) {
                    $processName = [IO.Path]::GetFileNameWithoutExtension(
                        $Process.Path)

                    $windowProcess = Get-Process $processName |
                    Where-Object {
                        ($_.Id -ne $Process.Id) -and
                        ($_.MainWindowHandle -ne 0)
                    } |
                    Sort-Object -Property StartTime -Descending |
                    Select-Object -First 1

                    if ($null -eq $windowProcess) {
                        throw "Could not find window process to send keys to"
                    }
                }

                # bring window to foreground
                try {
                    $window = [GenXdev.Helpers.WindowObj]::new(
                        $windowProcess,
                        $windowProcess.MainWindowTitle)
                    $null = $window.Show()
                    $null = $window.SetForeground()
                }
                catch { }

                $null = Set-ForegroundWindow -WindowHandle $windowProcess.MainWindowHandle
                Start-Sleep -Milliseconds 500
            }
        }
        catch {
            Write-Warning $_.Exception.Message
        }
    }

    process {

        try {
            foreach ($key in $Keys) {

                try {
                    # prepare key sequence for sending
                    $escapedQuery = $key -join " "

                    if ($Escape) {
                        $escapedQuery = $escapedQuery -replace '(\{)', '{{}'
                        $escapedQuery = $escapedQuery -replace '(\})', '{}}'
                    }

                    # normalize line endings
                    $escapedQuery = $escapedQuery -replace '`r', '`n'
                    $escapedQuery = $escapedQuery -replace '`n`n', '`n'

                    # convert newlines to key sequences
                    if ($ShiftEnter) {
                        $escapedQuery = $escapedQuery -replace '`n', '+{ENTER}'
                    }
                    else {
                        $escapedQuery = $escapedQuery -replace '`n', '{ENTER}'
                    }

                    Write-Verbose "Sending keys: $escapedQuery"

                    # send the keys
                    $null = $helper.sendKeys($escapedQuery)

                    if ($DelayMilliSeconds -gt 0) {
                        Start-Sleep -Milliseconds $DelayMilliSeconds
                    }
                }
                catch {
                    Write-Warning $_.Exception.Message
                }
            }
        }
        finally {
            if ($null -ne $windowProcess) {
                try {
                    Start-Sleep -Milliseconds 1500

                    # restore focus to PowerShell window if not holding focus
                    if (-not $HoldKeyboardFocus) {
                        try {
                            $psWindow = Get-PowershellMainWindow
                            $null = $psWindow.SetForeground()
                            $null = Set-ForegroundWindow -WindowHandle $psWindow.Handle
                        }
                        catch {
                            Write-Warning $_.Exception.Message
                        }
                    }
                }
                catch {
                    Write-Warning $_.Exception.Message
                }
            }
        }
    }
}
################################################################################
