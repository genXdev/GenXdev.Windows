﻿###############################################################################
<#
.SYNOPSIS
Sends simulated keystrokes to a window or process.

.DESCRIPTION
This function sends keyboard input to a target window or process using the
Windows Script Host Shell object. It can target windows by process name,
process ID, or window handle. The function supports special key sequences,
escape characters, and various timing options for reliable key delivery.

.PARAMETER KeysToSend
The keyboard input to send as an array of strings. Supports special key
sequences like {ENTER}, {TAB}, {F1}, etc. Each string in the array is
processed sequentially with optional delays between them.

.PARAMETER SendKeyEscape
When specified, escapes curly braces in the input text so they are sent as
literal characters rather than interpreted as special key sequences.

.PARAMETER ProcessName
The name of the target process to send keys to. Supports wildcard patterns
for flexible process matching.

.PARAMETER ProcessId
The process ID of the target process to send keys to. Provides precise
targeting when multiple processes have similar names.

.PARAMETER WindowHandle
The window handle (HWND) of the target window to send keys to. Offers
direct window targeting when the handle is known.

.PARAMETER SendKeyHoldKeyboardFocus
When specified, keeps keyboard focus on the target window after sending
keys instead of returning focus to the PowerShell window.

.PARAMETER SendKeyUseShiftEnter
When specified, converts newline characters to Shift+Enter key sequences
instead of regular Enter key sequences.

.PARAMETER SendKeyDelayMilliSeconds
The delay in milliseconds between sending different key sequences. Helps
ensure reliable delivery when sending multiple key strings.

.EXAMPLE
Send-Key -KeysToSend "Hello World{ENTER}" -ProcessName "notepad"
Sends text to Notepad followed by Enter key using process name targeting.

.EXAMPLE
Send-Key "Special {F11} key" -SendKeyEscape -ProcessId 1234
Sends literal "{F11}" text rather than F11 key using process ID targeting.

.EXAMPLE
sendkeys "Line 1{ENTER}Line 2" -WindowHandle 123456 -SendKeyDelayMilliSeconds 50
Sends multi-line text with custom delay using window handle targeting.
#>
function Send-Key {

    [CmdletBinding(DefaultParameterSetName = 'ByProcessName')]
    [Alias('sendkeys', 'invokekeys')]
    param (
        ###############################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            ValueFromRemainingArguments = $false,
            HelpMessage = 'The keyboard input to send as an array of strings'
        )]
        [string[]] $KeysToSend,

        ###############################################################################
        [Parameter(
            ParameterSetName = 'ByProcessName',
            Mandatory = $false,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'Name of the process to send keys to (supports wildcards)'
        )]
        [ValidateNotNullOrEmpty()]
        [SupportsWildcards()]
        [string] $ProcessName,

        ###############################################################################
        [Parameter(
            ParameterSetName = 'ByProcessId',
            Mandatory = $false,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'ID of the process to send keys to'
        )]
        [ValidateNotNull()]
        [Alias('Id', 'PID')]
        [int] $ProcessId,

        ###############################################################################
        [Parameter(
            ParameterSetName = 'ByWindowHandle',
            Mandatory = $false,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'Window handle to send keys to'
        )]
        [ValidateNotNull()]
        [Alias('Handle', 'hWnd')]
        [long] $WindowHandle,

        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Escape control characters and modifiers in input text'
        )]
        [Alias('Escape')]
        [switch] $SendKeyEscape,

        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Hold keyboard focus on target window after sending keys'
        )]
        [Alias('HoldKeyboardFocus')]
        [switch] $SendKeyHoldKeyboardFocus,

        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Use Shift+Enter instead of Enter for newlines'
        )]
        [Alias('UseShiftEnter')]
        [switch] $SendKeyUseShiftEnter,

        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Delay between different input strings in milliseconds'
        )]
        [ValidateRange(0, [int]::MaxValue)]
        [Alias('DelayMilliSeconds')]
        [int] $SendKeyDelayMilliSeconds = 10
    )

    begin {

        # initialize the windows script host shell object for sending keystrokes
        $helper = Microsoft.PowerShell.Utility\New-Object -ComObject WScript.Shell

        # initialize window variable for target window operations
        $window = $null;

        # attempt to locate the target window if targeting parameters are provided
        if ($null -eq $window) {
            try {
                # copy relevant parameters for get-window cmdlet invocation
                $invocationArguments = GenXdev.Helpers\Copy-IdenticalParamValues `
                    -FunctionName 'GenXdev.Windows\Get-Window' `
                    -BoundParameters $PSBoundParameters `
                    -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                        -Scope Local `
                        -ErrorAction SilentlyContinue)

                # check if any window targeting parameters were provided
                if ((-not [string]::IsNullOrWhiteSpace($ProcessName)) -or `
                    ($ProcessId -ne 0) -or `
                    ($WindowHandle -ne 0)) {

                    # retrieve the first matching window for the specified criteria
                    $window = GenXdev.Windows\Get-Window @invocationArguments `
                        -ErrorAction SilentlyContinue |
                        Microsoft.PowerShell.Utility\Select-Object -First 1
                }
            }
            catch {
                Microsoft.PowerShell.Utility\Write-Warning $_.Exception.Message
            }
        }

        # bring the target window to foreground if one was found
        if ($null -ne $window) {

            # make the window visible if it was minimized
            $null = $window.Show();

            # bring the window to the foreground
            $null = $window.SetForeground()

            # ensure window has foreground focus using win32 api
            $null = GenXdev.Windows\Set-ForegroundWindow -WindowHandle $window.Handle

            # allow time for window activation to complete
            Microsoft.PowerShell.Utility\Start-Sleep -Milliseconds 500
        }
    }


    process {

        try {
            # iterate through each key sequence string to send
            foreach ($key in $KeysToSend) {
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "Processing key sequence: $key"

                try {
                    # join array elements into a single string for processing
                    $escapedQuery = $key -join ' '

                    # escape curly braces if escape mode is enabled
                    if ($SendKeyEscape) {
                        $escapedQuery = $escapedQuery -replace '(\{)', '{{}'

                        $escapedQuery = $escapedQuery -replace '(\})', '{}}'
                    }

                    # normalize line endings to consistent newline format
                    $escapedQuery = $escapedQuery -replace '`r', '`n'

                    $escapedQuery = $escapedQuery -replace '`n`n', '`n'

                    # convert newlines to appropriate key sequences based on mode
                    if ($SendKeyUseShiftEnter) {
                        $escapedQuery = $escapedQuery -replace '`n', '+{ENTER}'
                    }
                    else {
                        $escapedQuery = $escapedQuery -replace '`n', '{ENTER}'
                    }

                    Microsoft.PowerShell.Utility\Write-Verbose `
                        "Sending keys: $escapedQuery"

                    if ($key -eq '^v') {
                        Microsoft.PowerShell.Utility\Start-Sleep 2
                    }

                    # send the processed key sequence to the target window
                    $null = $helper.sendKeys($escapedQuery, $true)

                    # apply delay between key sequences if specified
                    if ($SendKeyDelayMilliSeconds -gt 0) {
                        Microsoft.PowerShell.Utility\Start-Sleep `
                            -Milliseconds $SendKeyDelayMilliSeconds
                    }
                    if ($key -eq '^v') {
                        Microsoft.PowerShell.Utility\Start-Sleep 2
                    }
                }
                catch {
                    Microsoft.PowerShell.Utility\Write-Warning $_.Exception.Message
                }
            }
        }
        finally {
            # handle window focus restoration after key sending is complete
            if ($null -ne $window) {
                try {

                    # restore powershell window focus unless holding focus was requested
                    if (-not $SendKeyHoldKeyboardFocus) {
                        try {
                            Microsoft.PowerShell.Utility\Write-Verbose `
                                'Restoring PowerShell window focus'

                            # locate the main powershell window
                            $psWindow = GenXdev.Windows\Get-PowershellMainWindow

                            # restore focus to powershell window if found
                            if ($psWindow) {
                                $null = $psWindow.SetForeground()

                                $null = GenXdev.Windows\Set-ForegroundWindow `
                                    -WindowHandle $psWindow.Handle
                            }
                        }
                        catch {
                            Microsoft.PowerShell.Utility\Write-Warning `
                                $_.Exception.Message
                        }
                    }
                }
                catch {
                    Microsoft.PowerShell.Utility\Write-Warning $_.Exception.Message
                }
            }
        }
    }

    end {
    }
}
###############################################################################