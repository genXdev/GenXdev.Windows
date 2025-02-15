################################################################################
<#
.SYNOPSIS
Sends simulated keystrokes to a window or process.

.DESCRIPTION
Sends keystrokes to either the active window or a specified process window as if
typed by a user. Supports special keys and keyboard modifiers through control
sequences like {F11}, {ENTER}, etc. Can target specific processes and maintain
keyboard focus.

.PARAMETER Keys
The text or key sequences to send. Supports control sequences like {F11} and
keyboard modifiers (+, ^, %). Can be piped or provided as array.

.PARAMETER Escape
When specified, escapes special characters so they are sent as literal text
instead of being interpreted as control sequences.

.PARAMETER Process
Target process that should receive the keystrokes. If not specified, sends to
the currently active window.

.PARAMETER HoldKeyboardFocus
Prevents returning keyboard focus to PowerShell after sending keys.

.PARAMETER ShiftEnter
Sends Shift+Enter instead of regular Enter for line breaks.

.PARAMETER DelayMilliSeconds
Adds delay between sending different key sequences. Useful for slower apps.

.EXAMPLE
Send-Keys -Keys "Hello World{ENTER}" -Process (Get-Process notepad)
Sends text to Notepad followed by Enter key

.EXAMPLE
Send-Keys "Special {F11} key" -Escape
Sends literal "{F11}" rather than F11 key
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
            HelpMessage = "Escape control characters and modifiers"
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
            # initialize window handling variables
            $windowProcess = $Process
            $helper = New-Object -ComObject WScript.Shell

            if ($null -ne $Process) {
                Write-Verbose "Targeting process: $($Process.ProcessName)"

                # wait briefly if window handle not immediately available
                if ($windowProcess.MainWindowHandle -eq 0) {
                    Write-Verbose "Waiting for window handle..."
                    Start-Sleep -Seconds 2
                }

                # search up process tree for valid window handle
                while (($null -ne $windowProcess) -and
                    ($windowProcess.MainWindowHandle -eq 0)) {
                    $windowProcess = $windowProcess.Parent
                }

                # try finding sibling process with window if no handle found
                if ($null -eq $windowProcess) {
                    $processName = [IO.Path]::GetFileNameWithoutExtension(
                        $Process.Path)
                    Write-Verbose "Looking for sibling process: $processName"

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
                    Write-Verbose "Activating window: $($windowProcess.MainWindowTitle)"
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
                Write-Verbose "Processing key sequence: $key"

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

                    # convert newlines to appropriate key sequences
                    if ($ShiftEnter) {
                        $escapedQuery = $escapedQuery -replace '`n', '+{ENTER}'
                    }
                    else {
                        $escapedQuery = $escapedQuery -replace '`n', '{ENTER}'
                    }

                    Write-Verbose "Sending keys: $escapedQuery"
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

                    # restore PowerShell window focus if not holding focus
                    if (-not $HoldKeyboardFocus) {
                        try {
                            Write-Verbose "Restoring PowerShell window focus"
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
