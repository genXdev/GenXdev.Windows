################################################################################
<#
.SYNOPSIS
Sends simulated keystrokes to a window or process.

.DESCRIPTION
Sends keystrokes to either the active window or a specified process window as if
typed by a user. Supports special keys and keyboard modifiers through control
sequences like {F11}, {ENTER}, etc. Can target specific processes and maintain
keyboard focus.

.PARAMETER KeysToSend
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
Send-Key -KeysToSend "Hello World{ENTER}" -Process (Get-Process notepad)
Sends text to Notepad followed by Enter key

.EXAMPLE
Send-Key "Special {F11} key" -Escape
Sends literal "{F11}" rather than F11 key
#>
function Send-Key {

    [CmdletBinding(DefaultParameterSetName = "ByProcessName")]
    [Alias("sendkeys", "invokekeys")]
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
        [string[]] $KeysToSend,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Escape control characters and modifiers"
        )]
        [switch] $Escape,

        ########################################################################
        [Parameter(
            ParameterSetName = "ByProcessName",
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "Name of the process to get window information for"
        )]
        [ValidateNotNullOrEmpty()]
        [SupportsWildcards()]
        [string] $ProcessName,

        ########################################################################
        [Parameter(
            ParameterSetName = "ByProcessId",
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "ID of the process to get window information for"
        )]
        [ValidateNotNull()]
        [Alias("Id", "PID")]
        [int] $ProcessId,

        ########################################################################
        [Parameter(
            ParameterSetName = "ByWindowHandle",
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "Window handle to get information for"
        )]
        [ValidateNotNull()]
        [Alias("Handle", "hWnd")]
        [long] $WindowHandle,

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
        # initialize window handling variables
        $helper = New-Object -ComObject WScript.Shell

        # bring window to foreground
        $window = $null;
        if ($null -eq $window) {
            try {
                $invocationArguments = GenXdev.Helpers\Copy-IdenticalParamValues `
                    -FunctionName "Get-Window" `
                    -BoundParameters $PSBoundParameters `
                    -DefaultValues (Get-Variable -Scope Local -Name * -ErrorAction SilentlyContinue)

                if ((-not [string]::IsNullOrWhiteSpace($ProcessName)) -or ($ProcessId -ne 0) -or ($WindowHandle -ne 0)) {

                    $window = Get-Window @invocationArguments -ErrorAction SilentlyContinue | Select-Object -First 1
                }
            }
            catch {
                Write-Warning $_.Exception.Message
            }
        }
        if ($null -ne $window) {

            $window.Show();
            $window.SetForeground()
            $null = Set-ForegroundWindow -WindowHandle $window.Handle
            Start-Sleep -Milliseconds 500
        }
    }

    process {

        try {
            foreach ($key in $KeysToSend) {
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
                    $null = $helper.sendKeys($escapedQuery, $true)

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
            if ($null -ne $window) {
                try {

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