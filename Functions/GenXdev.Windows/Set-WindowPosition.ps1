################################################################################
<#
.SYNOPSIS
Positions and resizes windows on specified monitors with various layout options.

.DESCRIPTION
Provides precise control over window positioning and sizing, supporting multiple
monitors, border removal, and various preset positions like left/right split,
top/bottom split, and center placement. Windows can be positioned by coordinates
or using predefined layouts.

.PARAMETER ProcessName
The process name of the window to position (defaults to PowerShell window)

.PARAMETER Process
Process or processes whose windows need positioning (defaults to PowerShell window)

.PARAMETER WindowHelper
Window helper object for direct window manipulation

.PARAMETER Monitor
Monitor selection: 0=primary, 1+=specific monitor, -1=current, -2=secondary

.PARAMETER NoBorders
Removes window borders and title bar for a cleaner appearance

.PARAMETER Width
Window width in pixels (-1 for automatic sizing)

.PARAMETER Height
Window height in pixels (-1 for automatic sizing)

.PARAMETER X
Window horizontal position (-1 for automatic)

.PARAMETER Y
Window vertical position (-1 for automatic)

.PARAMETER Left
Places window on left half of screen

.PARAMETER Right
Places window on right half of screen

.PARAMETER Top
Places window on top half of screen

.PARAMETER Bottom
Places window on bottom half of screen

.PARAMETER Centered
Centers window on screen

.PARAMETER Fullscreen
Maximizes window to fill entire screen

.PARAMETER RestoreFocus
Returns focus to PowerShell window after positioning

.PARAMETER PassThru
Returns window helper object for further manipulation

.PARAMETER SideBySide
Will either set the window fullscreen on a different monitor than Powershell, or
side by side with Powershell on the same monitor

.PARAMETER FocusWindow
Focus the window after positioning

.PARAMETER SetForeground
Set the window to foreground after positioning

.PARAMETER Maximize
Maximize the window after positioning

.PARAMETER KeysToSend
Keystrokes to send to the window after positioning

.PARAMETER SendKeyEscape
Escape control characters and modifiers when sending keys

.PARAMETER SendKeyHoldKeyboardFocus
Hold keyboard focus on target window when sending keys

.PARAMETER SendKeyUseShiftEnter
Use Shift+Enter instead of Enter when sending keys

.PARAMETER SendKeyDelayMilliSeconds
Delay between different input strings in milliseconds when sending keys

.PARAMETER SessionOnly
Switch to use alternative settings stored in session for AI preferences

.PARAMETER ClearSession
Switch to clear alternative settings stored in session for AI preferences

.PARAMETER SkipSession
Switch to store settings only in persistent preferences without affecting
session

.EXAMPLE
Set-WindowPosition -Centered -Monitor 0 -NoBorders
Position PowerShell window centered on primary monitor with no borders

.EXAMPLE
Get-Process notepad,calc | wp -m 1 -l,-r
Split notepad and calc side by side on second monitor using aliases
#>
################################################################################
function Set-WindowPosition {

    [CmdletBinding(DefaultParameterSetName = 'Default', SupportsShouldProcess = $true)]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalVars', '')]
    [Alias('wp')]
    param(
        ########################################################################
        [parameter(
            ParameterSetName = 'ProcessName',
            Mandatory = $false,
            Position = 0,
            HelpMessage = 'The process of the window to position',
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            ValueFromRemainingArguments = $false
        )]
        [SupportsWildcards()]
        [Alias('Name')]
        [string] $ProcessName,
        ########################################################################
        [parameter(
            ParameterSetName = 'Process',
            Mandatory = $false,
            HelpMessage = 'The process of the window to position',
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            ValueFromRemainingArguments = $false
        )]
        [ValidateNotNull()]
        [System.Diagnostics.Process] $Process,
        ########################################################################
        [parameter(
            ParameterSetName = 'WindowHelper',
            Mandatory = $false,
            HelpMessage = 'The process of the window to position',
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            ValueFromRemainingArguments = $false
        )]
        [ValidateNotNull()]
        [GenXdev.Helpers.WindowObj[]] $WindowHelper,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'The monitor to use, 0 = default, -1 is discard'
        )]
        [Alias('m', 'mon')]
        [int] $Monitor = -1,
        ########################################################################
        [Alias('nb')]
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Removes the borders of the window'
        )]
        [switch] $NoBorders,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'The initial width of the window'
        )]
        [int] $Width = -999999,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'The initial height of the window'
        )]
        [int] $Height = -999999,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'The initial X position of the window'
        )]
        [int] $X = -999999,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'The initial Y position of the window'
        )]
        [int] $Y = -999999,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Place window on the left side of the screen'
        )]
        [switch] $Left,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Place window on the right side of the screen'
        )]
        [switch] $Right,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Place window on the top side of the screen'
        )]
        [switch] $Top,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Place window on the bottom side of the screen'
        )]
        [switch] $Bottom,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Place window in the center of the screen'
        )]
        [switch] $Centered,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Maximize the window'
        )]
        [Alias('fs')]
        [switch] $Fullscreen,
        ########################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = 'Restore PowerShell window focus'
        )]
        [Alias('rf', 'bg')]
        [switch]$RestoreFocus,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Returns the window helper for each process'
        )]
        [Alias('pt')]
        [switch]$PassThru,

        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = ('Will either set the window fullscreen on a different ' +
                'monitor than Powershell, or side by side with Powershell on the ' +
                'same monitor')
        )]
        [Alias('sbs')]
        [switch]$SideBySide,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Focus the window after opening'
        )]
        [Alias('fw','focus')]
        [switch] $FocusWindow,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Set the window to foreground after opening'
        )]
        [Alias('fg')]
        [switch] $SetForeground,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Maximize the window after positioning'
        )]
        [switch] $Maximize,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Keystrokes to send to the Window, ' +
                'see documentation for cmdlet GenXdev.Windows\Send-Key')
        )]
        [string[]] $KeysToSend,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Escape control characters and modifiers when sending keys'
        )]
        [Alias('Escape')]
        [switch] $SendKeyEscape,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Hold keyboard focus on target window when sending keys'
        )]
        [Alias('HoldKeyboardFocus')]
        [switch] $SendKeyHoldKeyboardFocus,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Use Shift+Enter instead of Enter when sending keys'
        )]
        [Alias('UseShiftEnter')]
        [switch] $SendKeyUseShiftEnter,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Delay between different input strings in ' +
                'milliseconds when sending keys')
        )]
        [Alias('DelayMilliSeconds')]
        [int] $SendKeyDelayMilliSeconds,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Use alternative settings stored in session for AI ' +
                'preferences')
        )]
        [switch] $SessionOnly,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Clear alternative settings stored in session for AI ' +
                'preferences')
        )]
        [switch] $ClearSession,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Store settings only in persistent preferences without ' +
                'affecting session')
        )]
        [Alias('FromPreferences')]
        [switch] $SkipSession
        ########################################################################
    )

    begin {

        # store reference to bound parameters for later use
        $myPSBoundParameters = $PSBoundParameters

        # store reference to powershell window for focus restoration
        $powerShellWindow = GenXdev.Windows\Get-PowershellMainWindow

        # determine which process to work with based on parameter set
        switch ($PSCmdlet.ParameterSetName) {
            'ProcessName' {
                Microsoft.PowerShell.Utility\Write-Verbose 'ParameterSetName: ProcessName'
                # get processes by name
                $foundProcess = Microsoft.PowerShell.Management\Get-Process `
                    -Name $ProcessName `
                    -ErrorAction SilentlyContinue |
                    Microsoft.PowerShell.Core\Where-Object `
                        -Property 'MainWindowHandle' `
                        -NE 0 |
                    Microsoft.PowerShell.Utility\Sort-Object `
                        -Property 'StartTime' `
                        -Descending |
                    Microsoft.PowerShell.Utility\Select-Object `
                        -First 1
                if ($null -eq $foundProcess) {
                    Microsoft.PowerShell.Utility\Write-Verbose "No process found with name '$ProcessName' (ProcessName set)"
                    Microsoft.PowerShell.Utility\Write-Error ('No process found with ' + "name '$ProcessName'")
                }
                else {
                    Microsoft.PowerShell.Utility\Write-Verbose "Process found: $($foundProcess.ProcessName) with ID $($foundProcess.Id) (ProcessName set)"
                    $Process = $foundProcess
                    Microsoft.PowerShell.Utility\Write-Verbose ('Found process: ' + "$($Process.ProcessName) with ID $($Process.Id)")
                }
                break;
            }
            'Process' {
                Microsoft.PowerShell.Utility\Write-Verbose 'ParameterSetName: Process'
                # get process by id first
                $foundProcess = Microsoft.PowerShell.Management\Get-Process `
                    -Id ($Process.Id) `
                    -ErrorAction SilentlyContinue |
                    Microsoft.PowerShell.Core\Where-Object `
                        -Property 'MainWindowHandle' `
                        -NE 0
                if ($null -eq $foundProcess) {
                    Microsoft.PowerShell.Utility\Write-Verbose "No process found by Id $($Process.Id), trying by Name $($Process.Name) (Process set)"
                    # fallback to process by name
                    $foundProcess = Microsoft.PowerShell.Management\Get-Process `
                        -Name ($Process.Name) `
                        -ErrorAction SilentlyContinue |
                        Microsoft.PowerShell.Core\Where-Object `
                            -Property 'MainWindowHandle' `
                            -NE 0
                    if ($null -eq $foundProcess) {
                        Microsoft.PowerShell.Utility\Write-Verbose "No process found with name '$($Process.Name)' (Process set)"
                        Microsoft.PowerShell.Utility\Write-Error ('No process found with ' + "name '$($Process.Name)'")
                        $Process = $null
                    } else {
                        Microsoft.PowerShell.Utility\Write-Verbose "Process found by Name: $($foundProcess.ProcessName) with ID $($foundProcess.Id) (Process set)"
                    }
                }
                else {
                    Microsoft.PowerShell.Utility\Write-Verbose "Process found by Id: $($foundProcess.ProcessName) with ID $($foundProcess.Id) (Process set)"
                    $Process = $foundProcess
                    Microsoft.PowerShell.Utility\Write-Verbose ('Found process: ' + "$($Process.ProcessName) with ID $($Process.Id)")
                }
                break;
            }
            'WindowHelper' {
                Microsoft.PowerShell.Utility\Write-Verbose 'ParameterSetName: WindowHelper'
                # get processes from window helper handles
                $foundProcess = Microsoft.PowerShell.Management\Get-Process `
                    -ErrorAction SilentlyContinue |
                    Microsoft.PowerShell.Core\Where-Object `
                        -Property MainWindowHandle `
                        -EQ $WindowHelper.Handle
                if ($null -eq $foundProcess) {
                    Microsoft.PowerShell.Utility\Write-Verbose "No process found with window handle '$($WindowHelper.Handle)' (WindowHelper set)"
                    Microsoft.PowerShell.Utility\Write-Error ('No process found with ' + "window handle '$($WindowHelper.Handle)'")
                }
                else {
                    Microsoft.PowerShell.Utility\Write-Verbose "Process found by WindowHelper: $($foundProcess.ProcessName) with ID $($foundProcess.Id) (WindowHelper set)"
                    $Process = $foundProcess
                    Microsoft.PowerShell.Utility\Write-Verbose ('Found process: ' + "$($Process.ProcessName) with ID $($Process.Id)")
                }
                break;
            }
            default {
                Microsoft.PowerShell.Utility\Write-Verbose 'ParameterSetName: default (using PowerShell main window process)'
                # default to powershell main window process
                $Process = (GenXdev.Windows\Get-PowershellMainWindowProcess)
                break;
            }
        }
    }

    process {

        # get primary screen and all available screens
        $screen = $null

        $allScreens = @([WpfScreenHelper.Screen]::AllScreens |
                Microsoft.PowerShell.Core\ForEach-Object { $PSItem })

        # helper function to restore powershell window focus if requested
        function refocusTab() {

            # only proceed if restore focus was requested
            if ($RestoreFocus -eq $true) {

                # get current foreground window
                $currentActiveWindow = [GenXdev.Helpers.WindowObj]::GetFocusedWindow()

                # check if focus needs to be restored
                if (($null -ne $powerShellWindow) -and
                    ($powerShellWindow.Handle -ne $currentActiveWindow.Handle)) {

                    # attempt to restore focus
                    $null = $powerShellWindow.SetForeground()

                    # wait for window manager
                    [System.Threading.Thread]::Sleep(250)

                    # verify focus restoration
                    $currentActiveWindow = [GenXdev.Helpers.WindowObj]::GetFocusedWindow()

                    if ($powerShellWindow.Handle -ne $currentActiveWindow.Handle) {

                        try {

                            # fallback to alt-tab if direct focus failed
                            $helper = Microsoft.PowerShell.Utility\New-Object `
                                -ComObject WScript.Shell

                            $null = $helper.sendKeys('%{TAB}')

                            Microsoft.PowerShell.Utility\Write-Verbose ('Used Alt-Tab to restore ' +
                                'focus')

                            [System.Threading.Thread]::Sleep(500)
                        }
                        catch {

                            # silently continue if focus restoration fails
                        }
                    }
                }
            }
        }

        ########################################################################

        # process each window that needs positioning
        if ($null -ne $Process) {
            Microsoft.PowerShell.Utility\Write-Verbose "Processing window for process: $($Process.ProcessName) (Id: $($Process.Id))"
            # determine if any positioning parameters are provided
            $havePositioning = ($X -gt -999999) -or ($Y -gt -999999) `
                -or ($Width -gt 0) -or ($Height -gt 0) `
                -or $Left -or $Right -or $Top -or $Bottom `
                -or $Centered -or $Fullscreen -or $SideBySide
            # get window handle - use powershell window or process main window
            $window = $WindowHelper ? $WindowHelper : (GenXdev.Windows\Get-Window -ProcessId ($Process.Id))
            if ($Monitor -eq 0) {
                Microsoft.PowerShell.Utility\Write-Verbose ('Choosing primary monitor, because default monitor requested using -Monitor 0')
                $Screen = [WpfScreenHelper.Screen]::PrimaryScreen;
                if (-not $havePositioning) {
                    $Centered = $true;
                    $havePositioning = $true;
                }
            }
            elseif (((GenXdev.Windows\Get-MonitorCount) -gt 1) -and $Monitor -eq -2 -and $Global:DefaultSecondaryMonitor -is [int] -and $Global:DefaultSecondaryMonitor -ge 0) {
                $userMonitorNum = $Global:DefaultSecondaryMonitor
                $screenIndex = ($Global:DefaultSecondaryMonitor) % $AllScreens.Length
                Microsoft.PowerShell.Utility\Write-Verbose ('Picking monitor ' + "#$userMonitorNum as secondary (requested with -monitor -2) set by `$Global:DefaultSecondaryMonitor")
                $Screen = $AllScreens[$screenIndex];
                $Monitor = $Global:DefaultSecondaryMonitor;
                if (-not $havePositioning) {
                    $Centered = $true;
                    $havePositioning = $true;
                }
            }
            elseif ($Monitor -eq -2 -and ((GenXdev.Windows\Get-MonitorCount) -gt 1)) {
                Microsoft.PowerShell.Utility\Write-Verbose ('Picking monitor #1 as default secondary (requested with -monitor -2), because `$Global:DefaultSecondaryMonitor not set')
                $Screen = $AllScreens[1 % $AllScreens.Length];
                if (-not $havePositioning) {
                    $Centered = $true;
                    $havePositioning = $true;
                }
            }
            elseif ($Monitor -eq -2) {
                Microsoft.PowerShell.Utility\Write-Verbose 'Monitor -2 requested but no secondary monitor found, defaulting to primary.'
                $Monitor = 0
                if (-not $havePositioning) {
                    $Centered = $true;
                    $havePositioning = $true;
                }
                $Screen = [WpfScreenHelper.Screen]::PrimaryScreen;
            }
            elseif ($Monitor -ge 1) {
                Microsoft.PowerShell.Utility\Write-Verbose ('Picking monitor ' + "#$((($Monitor - 1) % $AllScreens.Length)) as requested by the -Monitor parameter")
                $Screen = $AllScreens[($Monitor - 1) % $AllScreens.Length]
                if (-not $havePositioning) {
                    $Centered = $true;
                    $havePositioning = $true;
                }
            }
            else {
                Microsoft.PowerShell.Utility\Write-Verbose 'Picking monitor #1 (FromPoint)'
                $Screen = [WpfScreenHelper.Screen]::FromPoint(@{X = $window.Position().X; Y = $window.Position().Y });
            }

            # handle side-by-side positioning
            if ($SideBySide -and ($powerShellWindow.Handle -ne $window.Handle)) {
                Microsoft.PowerShell.Utility\Write-Verbose 'SideBySide requested and window is not PowerShell main window.'
                # check if same screen as powershell
                if ($PowershellScreen -eq $Screen) {
                    Microsoft.PowerShell.Utility\Write-Verbose 'Window and PowerShell are on the same screen.'
                    # split horizontally or vertically based on screen orientation
                    if ($PowershellScreen.WorkingArea.Width -gt $PowershellScreen.WorkingArea.Height) {
                        Microsoft.PowerShell.Utility\Write-Verbose 'Screen is wider than tall, splitting horizontally (Left).'
                        GenXdev.Windows\Set-WindowPosition -Left -Monitor $Monitor
                        $FullScreen = $false
                        $right = $true;
                        $havePositioning = $true;
                    }
                    else {
                        Microsoft.PowerShell.Utility\Write-Verbose 'Screen is taller than wide, splitting vertically (Bottom).'
                        GenXdev.Windows\Set-WindowPosition -Bottom -Monitor $Monitor
                        $FullScreen = $false
                        $Top = $true
                        $havePositioning = $true;
                    }
                }
                else {
                    Microsoft.PowerShell.Utility\Write-Verbose 'Window and PowerShell are on different screens. Using fullscreen for window.'
                    $havePositioning = $true;
                    # use fullscreen on different monitor
                    $Fullscreen = $true;
                }
            }
            if ($null -eq $screen) {
                Microsoft.PowerShell.Utility\Write-Verbose "No screen object set, using window's current monitor."
                $screen = $allScreens[$window.GetCurrentMonitor() % $allScreens.Length]
            }
            # calculate final window coordinates and dimensions
            if (($X -le -999999) -or ($X -isnot [int])) {
                Microsoft.PowerShell.Utility\Write-Verbose 'X not provided or invalid, using screen.WorkingArea.X'
                $X = $Screen.WorkingArea.X;
            }
            else {
                # adjust x position for monitor offset
                if ($Monitor -ge 0) {
                    Microsoft.PowerShell.Utility\Write-Verbose 'Adjusting X for monitor offset.'
                    $X = $Screen.WorkingArea.X + $X;
                }
            }
            Microsoft.PowerShell.Utility\Write-Verbose "X determined to be $X"
            # calculate y position
            if (($Y -le -999999) -or ($Y -isnot [int])) {
                Microsoft.PowerShell.Utility\Write-Verbose 'Y not provided or invalid, using screen.WorkingArea.Y'
                $Y = $Screen.WorkingArea.Y;
            }
            else {
                # adjust y position for monitor offset
                if ($Monitor -ge 0) {
                    Microsoft.PowerShell.Utility\Write-Verbose 'Adjusting Y for monitor offset.'
                    $Y = $Screen.WorkingArea.Y + $Y;
                }
            }
            Microsoft.PowerShell.Utility\Write-Verbose "Y determined to be $Y"
            # set fullscreen dimensions if requested
            if ($Fullscreen -eq $true) {
                Microsoft.PowerShell.Utility\Write-Verbose 'Fullscreen requested, setting Width/Height to screen.WorkingArea.'
                $Width = $Screen.WorkingArea.Width;
                $Height = $Screen.WorkingArea.Height;
            }
            Microsoft.PowerShell.Utility\Write-Verbose 'Have positioning parameters set'
            # check if width and height were explicitly provided
            $widthProvided = ($Width -gt 0) -and ($Width -is [int]);
            $heightProvided = ($Height -gt 0) -and ($Height -is [int]);
            # use screen width if width not provided
            if ($widthProvided -eq $false) {
                Microsoft.PowerShell.Utility\Write-Verbose 'Width not provided, using screen.WorkingArea.Width'
                $Width = $Screen.WorkingArea.Width;
                Microsoft.PowerShell.Utility\Write-Verbose ('Width not provided ' + "resetted to $Width")
            }
            # use screen height if height not provided
            if ($heightProvided -eq $false) {
                Microsoft.PowerShell.Utility\Write-Verbose 'Height not provided, using screen.WorkingArea.Height'
                $Height = $Screen.WorkingArea.Height;
                Microsoft.PowerShell.Utility\Write-Verbose ('Height not provided ' + "resetted to $Height")
            }
            # apply layout positioning (left/right/top/bottom/centered)
            if ($Left -eq $true) {
                Microsoft.PowerShell.Utility\Write-Verbose 'Left positioning requested.'
                $X = $Screen.WorkingArea.X;
                # use half width if not explicitly provided
                if ($widthProvided -eq $false) {
                    Microsoft.PowerShell.Utility\Write-Verbose 'Width not provided for Left, using half screen width.'
                    $Width = [Math]::Min($Screen.WorkingArea.Width / 2, $Width);
                }
                Microsoft.PowerShell.Utility\Write-Verbose ("Left chosen, X = $X, Width = $Width")
            }
            else {
                # position on right side
                if ($Right -eq $true) {
                    Microsoft.PowerShell.Utility\Write-Verbose 'Right positioning requested.'
                    # use half width if not explicitly provided
                    if ($widthProvided -eq $false) {
                        Microsoft.PowerShell.Utility\Write-Verbose 'Width not provided for Right, using half screen width.'
                        $Width = [Math]::Min($Screen.WorkingArea.Width / 2, $Width);
                    }
                    $X = $Screen.WorkingArea.X + $Screen.WorkingArea.Width - $Width;
                    Microsoft.PowerShell.Utility\Write-Verbose ("Right chosen, X = $X, Width = $Width")
                }
            }
            # position on top
            if ($Top -eq $true) {
                Microsoft.PowerShell.Utility\Write-Verbose 'Top positioning requested.'
                $Y = $Screen.WorkingArea.Y;
                # use half height if not explicitly provided
                if ($heightProvided -eq $false) {
                    Microsoft.PowerShell.Utility\Write-Verbose 'Height not provided for Top, using half screen height.'
                    $Height = [Math]::Min($Screen.WorkingArea.Height / 2, $Height);
                }
                Microsoft.PowerShell.Utility\Write-Verbose ("Top chosen, Y = $Y, Height = $Height")
            }
            else {
                # position on bottom
                if ($Bottom -eq $true) {
                    Microsoft.PowerShell.Utility\Write-Verbose 'Bottom positioning requested.'
                    # use half height if not explicitly provided
                    if ($heightProvided -eq $false) {
                        Microsoft.PowerShell.Utility\Write-Verbose 'Height not provided for Bottom, using half screen height.'
                        $Height = [Math]::Min($Screen.WorkingArea.Height / 2, $Height);
                    }
                    $Y = $Screen.WorkingArea.Y + $Screen.WorkingArea.Height - $Height;
                    Microsoft.PowerShell.Utility\Write-Verbose ("Bottom chosen, Y = $Y, Height = $Height")
                }
            }
            # center window on screen
            if ($Centered -eq $true) {
                Microsoft.PowerShell.Utility\Write-Verbose 'Centered positioning requested.'
                # use 80% of screen dimensions if not explicitly provided
                if ($heightProvided -eq $false) {
                    Microsoft.PowerShell.Utility\Write-Verbose 'Height not provided for Centered, using 80% of screen height.'
                    $Height = [Math]::Round([Math]::Min($Screen.WorkingArea.Height * 0.8, $Height), 0);
                }
                if ($widthProvided -eq $false) {
                    Microsoft.PowerShell.Utility\Write-Verbose 'Width not provided for Centered, using 80% of screen width.'
                    $Width = [Math]::Round([Math]::Min($Screen.WorkingArea.Width * 0.8, $Width), 0);
                }
                # calculate center position
                $X = $Screen.WorkingArea.X + [Math]::Round(($screen.WorkingArea.Width - $Width) / 2, 0);
                $Y = $Screen.WorkingArea.Y + [Math]::Round(($screen.WorkingArea.Height - $Height) / 2, 0);
                Microsoft.PowerShell.Utility\Write-Verbose ("Centered chosen, X = $X, Width = $Width, Y = $Y, Height = $Height")
            }
            # confirm with user if whatif support is enabled
            if ($PSCmdlet.ShouldProcess(
                    "Window of process '$($Process.ProcessName)'",
                    "Set position/size to: X=$X Y=$Y W=$Width H=$Height")) {
                Microsoft.PowerShell.Utility\Write-Verbose 'ShouldProcess returned true, proceeding to set window position/size.'
                # have a handle to the mainwindow of the browser?
                if ($null -ne $window) {
                    Microsoft.PowerShell.Utility\Write-Verbose ('Restoring and positioning window')
                    # restore window and position it
                    $null = $window.Show()
                    $null = $window.Restore()
                    if ($havePositioning) {
                        Microsoft.PowerShell.Utility\Write-Verbose ("[Set-WindowPosition] About to move window. Handle: $($window.Handle) Target: X=$X, Y=$Y, Width=$Width, Height=$Height")
                        $null = $window.Move($X, $Y, $Width, $Height)
                        $null = $window.Move($X, $Y, $Width, $Height)
                    }
                    # maximize window if fullscreen requested
                    if ($Fullscreen) {
                        Microsoft.PowerShell.Utility\Write-Verbose 'Fullscreen requested, sending F11 keystroke.'
                        $KeysToSend = ($KeysToSend ? $KeysToSend : @()) + @('{F11}')
                    }
                    # needs to be set noborders manually?
                    if ($NoBorders -eq $true) {
                        Microsoft.PowerShell.Utility\Write-Verbose 'Setting NoBorders'
                        $null = $window.RemoveBorder();
                    }
                    if ($Maximize -or (-not $havePositioning)) {
                        Microsoft.PowerShell.Utility\Write-Verbose 'Maximize requested or no positioning, maximizing window.'
                        $null = $window.Maximize()
                    }
                    # handle focus and foreground at the end before maximize
                    if ($FocusWindow -eq $true) {
                        Microsoft.PowerShell.Utility\Write-Verbose 'Focusing window'
                        $null = $window.Focus()
                    }
                    # set window to foreground if requested
                    if ($SetForeground -eq $true) {
                        Microsoft.PowerShell.Utility\Write-Verbose ('Setting window to foreground')
                        $null = $window.SetForeground()
                    }
                    # send keys if specified, after a delay to ensure window is ready
                    if ($null -ne $KeysToSend -and ($KeysToSend.Count -gt 0)) {
                        Microsoft.PowerShell.Utility\Write-Verbose ('Sending keystrokes to window after 500ms delay')
                        Microsoft.PowerShell.Utility\Start-Sleep -Milliseconds 500
                        # copy identical parameters between functions
                        $params = GenXdev.Helpers\Copy-IdenticalParamValues `
                            -FunctionName 'GenXdev.Windows\Send-Key' `
                            -BoundParameters $myPSBoundParameters `
                            -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                                -Scope Local -ErrorAction SilentlyContinue)
                        # set the window handle for the send-key function
                        $params.WindowHandle = $window.Handle
                        $null = $params.Remove('Process')
                        $null = $params.Remove('ProcessName')
                        # send keys to the window
                        Microsoft.PowerShell.Utility\Write-Verbose "Calling Send-Key with parameters: $($params | Microsoft.PowerShell.Utility\Out-String)"
                        $null = GenXdev.Windows\Send-Key @params
                    }
                } else {
                    Microsoft.PowerShell.Utility\Write-Verbose 'No window object available to position.'
                }
                # return window helper if passthru specified
                if ($PassThru -eq $true) {
                    Microsoft.PowerShell.Utility\Write-Verbose 'PassThru specified, returning window object.'
                    $window
                }
            } else {
                Microsoft.PowerShell.Utility\Write-Verbose 'ShouldProcess returned false, skipping window positioning.'
            }
        } else {
            Microsoft.PowerShell.Utility\Write-Verbose 'No process object available, skipping window positioning.'
        }
    }

    end {
    }
}
################################################################################