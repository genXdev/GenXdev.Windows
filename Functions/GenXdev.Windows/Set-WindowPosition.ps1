################################################################################
<#
.SYNOPSIS
Positions and resizes windows on specified monitors with various layout options.

.DESCRIPTION
Provides precise control over window positioning and sizing, supporting multiple
monitors, border removal, and various preset positions like left/right split,
top/bottom split, and center placement. Windows can be positioned by coordinates
or using predefined layouts.

.PARAMETER Process
Process or processes whose windows need positioning (defaults to PowerShell window)

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

.EXAMPLE
# Position PowerShell window centered on primary monitor with no borders
Set-WindowPosition -Centered -Monitor 0 -NoBorders

.EXAMPLE
# Split notepad and calc side by side on second monitor using aliases
Get-Process notepad,calc | wp -m 1 -l,-r
#>
function Set-WindowPosition {

    [CmdletBinding(DefaultParameterSetName = 'ProcessName', SupportsShouldProcess = $true)]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidGlobalVars", "")]
    [Alias("wp")]
    param(
        ###############################################################################
        [parameter(
            ParameterSetName = 'ProcessName',
            Mandatory = $false,
            Position = 0,
            HelpMessage = "The process of the window to position",
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            ValueFromRemainingArguments = $false
        )]
        [SupportsWildcards()]
        [Alias("Name")]
        [ValidateNotNullOrEmpty()]
        [string[]] $ProcessName,
        ###############################################################################
        [parameter(
            ParameterSetName = 'Process',
            Mandatory = $false,
            HelpMessage = "The process of the window to position",
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            ValueFromRemainingArguments = $false
        )]
        [ValidateNotNull()]
        [System.Diagnostics.Process[]] $Process,
        ###############################################################################
        [parameter(
            ParameterSetName = 'WindowHelper',
            Mandatory = $false,
            HelpMessage = "The process of the window to position",
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            ValueFromRemainingArguments = $false
        )]
        [ValidateNotNull()]
        [GenXdev.Helpers.WindowObj[]] $WindowHelper,
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard"
        )]
        [int] $Monitor = -1,
        ###############################################################################

        [Alias("nb")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Removes the borders of the window"
        )]
        [switch] $NoBorders,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "The initial width of the window"
        )]
        [int] $Width = -1,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "The initial height of the window"
        )]
        [int] $Height = -1,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "The initial X position of the window"
        )]
        [int] $X = -1,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "The initial Y position of the window"
        )]
        [int] $Y = -1,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "Place window on the left side of the screen"
        )]
        [switch] $Left,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "Place window on the right side of the screen"
        )]
        [switch] $Right,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "Place window on the top side of the screen"
        )]
        [switch] $Top,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "Place window on the bottom side of the screen"
        )]
        [switch] $Bottom,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "Place window in the center of the screen"
        )]
        [switch] $Centered,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "Maximize the window"
        )]
        [switch] $Fullscreen,
        ###############################################################################
        [Alias("bg")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Restore PowerShell window focus"
        )]
        [switch] $RestoreFocus,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Returns the window helper for each process"
        )]
        [switch] $PassThru,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Will either set the window fullscreen on a different monitor than Powershell, or " +
            "side by side with Powershell on the same monitor"
        )]
        [switch] $SideBySide
        ###############################################################################
    )

    begin {
        # store reference to powershell window for focus restoration
        $powerShellWindow = GenXdev.Windows\Get-PowershellMainWindow

        switch ($PSCmdlet.ParameterSetName) {
            'ProcessName' {

                if ($null -eq $ProcessName) {

                    $Process = GenXdev.Windows\Get-PowershellMainWindowProcess
                    break;
                }

                $Process = Microsoft.PowerShell.Management\Get-Process -Name $ProcessName
                break;
            }

            'Process' {

                break;
            }

            'WindowHelper' {

                $Process = Microsoft.PowerShell.Management\Get-Process | Microsoft.PowerShell.Core\Where-Object -Property MainWindowHandle -EQ $WindowHelper.Handle
                break;
            }
        }

        # if no process specified, use current powershell window
        if (($null -eq $Process) -or ($Process.Length -lt 1)) {

            $Process = @((GenXdev.Windows\Get-PowershellMainWindowProcess))
        }
    }

    Process {

        # get primary screen and all available screens
        $screen = [WpfScreenHelper.Screen]::PrimaryScreen
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
                            $helper = Microsoft.PowerShell.Utility\New-Object -ComObject WScript.Shell
                            $null = $helper.sendKeys("%{TAB}")
                            Microsoft.PowerShell.Utility\Write-Verbose "Used Alt-Tab to restore focus"

                            [System.Threading.Thread]::Sleep(500)
                        }
                        catch {
                            # silently continue if focus restoration fails
                        }
                    }
                }
            }
        }

        # helper function to position and size a window
        function position($process, $window, $X, $Y, $Width, $Height) {

            # have a handle to the mainwindow of the browser?
            if ($null -ne $window) {

                Microsoft.PowerShell.Utility\Write-Verbose "Restoring and positioning window"

                $null = $window.Show()
                $null = $window.Restore()
                $null = $window.Move($X, $Y, $Width, $Height)
                $null = $window.Move($X, $Y, $Width, $Height)

                if ($Fullscreen) {

                    $null = $window.Maximize()
                }

                # needs to be set NoBorders manually?
                if ($NoBorders -eq $true) {

                    Microsoft.PowerShell.Utility\Write-Verbose "Setting NoBorders"

                    $null = $window.RemoveBorder();
                }
            }

        }

        ###############################################################################

        # process each window that needs positioning
        foreach ($currentProcess in $Process) {

            # get window handle - use powershell window or process main window
            $window = $WindowHelper ? $WindowHelper : $PowerShellWindow

            if ((-not $window) -and ($currentProcess.MainWindowHandle -ne $PowerShellWindow.Handle)) {

                $window = [GenXdev.Helpers.WindowObj]::GetMainWindow($currentProcess)[0]
            }

            # determine which monitor to use based on parameters
            if ($Monitor -eq 0) {
                Microsoft.PowerShell.Utility\Write-Verbose "Choosing primary monitor, because default monitor requested using -Monitor 0"
            }
            else {
                if ($Monitor -eq -2 -and $Global:DefaultSecondaryMonitor -is [int] -and $Global:DefaultSecondaryMonitor -ge 0) {

                    Microsoft.PowerShell.Utility\Write-Verbose "Picking monitor #$((($Global:DefaultSecondaryMonitor-1) % $AllScreens.Length)) as secondary (requested with -monitor -2) set by `$Global:DefaultSecondaryMonitor"
                    $Screen = $AllScreens[($Global:DefaultSecondaryMonitor - 1) % $AllScreens.Length];
                }
                elseif ($Monitor -eq -2 -and (-not ($Global:DefaultSecondaryMonitor -is [int] -and $Global:DefaultSecondaryMonitor -ge 0)) -and ((GenXdev.Windows\Get-MonitorCount) -gt 1)) {

                    Microsoft.PowerShell.Utility\Write-Verbose "Picking monitor #1 as default secondary (requested with -monitor -2), because `$Global:DefaultSecondaryMonitor not set"
                    $Screen = $AllScreens[1];
                }
                elseif ($Monitor -ge 1) {

                    Microsoft.PowerShell.Utility\Write-Verbose "Picking monitor #$(($Monitor - 1) % $AllScreens.Length) as requested by the -Monitor parameter"
                    $Screen = $AllScreens[($Monitor - 1) % $AllScreens.Length]
                }
                elseif ($Monitor -eq 0) {

                    Microsoft.PowerShell.Utility\Write-Verbose "Picking monitor #1"
                    $Screen = [WpfScreenHelper.Screen]::FromPoint(@{X = $window.Position().X; Y = $window.Position().Y });
                }
            }

            if ($SideBySide -and ($powerShellWindow.Handle -ne $window.Handle)) {

                if ($PowershellScreen -eq $Screen) {

                    if ($PowershellScreen.WorkingArea.Width -gt $PowershellScreen.WorkingArea.Height) {

                        GenXdev.Windows\Set-WindowPosition -Left -Monitor $Monitor
                        $FullScreen = $false
                        $right = $true;
                    }
                    else {

                        GenXdev.Windows\Set-WindowPosition -Bottom -Monitor $Monitor
                        $FullScreen = $false
                        $Top = $true
                    }
                }
                else {

                    $Fullscreen = $true;
                }
            }

            # calculate final window coordinates and dimensions
            if (($X -le 0) -or ($X -isnot [int])) {

                $X = $Screen.WorkingArea.X;
            }
            else {

                if ($Monitor -ge 0) {

                    $X = $Screen.WorkingArea.X + $X;
                }
            }
            Microsoft.PowerShell.Utility\Write-Verbose "X determined to be $X"

            # '-Y' parameter not supplied?
            if (($Y -le 0) -or ($Y -isnot [int])) {

                $Y = $Screen.WorkingArea.Y;
            }
            else {

                if ($Monitor -ge 0) {

                    $Y = $Screen.WorkingArea.Y + $Y;
                }
            }
            Microsoft.PowerShell.Utility\Write-Verbose "Y determined to be $Y"

            if ($Fullscreen -eq $true) {

                $Width = $Screen.WorkingArea.Width;
                $Height = $Screen.WorkingArea.Height;
            }

            Microsoft.PowerShell.Utility\Write-Verbose "Have positioning parameters set"

            $WidthProvided = ($Width -ge 0) -and ($Width -is [int]);
            $heightProvided = ($Height -ge 0) -and ($Height -is [int]);

            # '-Width' parameter not supplied?
            if ($WidthProvided -eq $false) {

                $Width = $Screen.WorkingArea.Width;

                Microsoft.PowerShell.Utility\Write-Verbose "Width not provided resetted to $Width"
            }

            # '-Height' parameter not supplied?
            if ($heightProvided -eq $false) {

                $Height = $Screen.WorkingArea.Height;

                Microsoft.PowerShell.Utility\Write-Verbose "Height not provided resetted to $Height"
            }

            # apply layout positioning (Left/Right/Top/Bottom/Centered)
            if ($Left -eq $true) {

                $X = $Screen.WorkingArea.X;

                if ($WidthProvided -eq $false) {

                    $Width = [Math]::Min($Screen.WorkingArea.Width / 2, $Width);
                }

                Microsoft.PowerShell.Utility\Write-Verbose "Left chosen, X = $X, Width = $Width"
            }
            else {
                if ($Right -eq $true) {

                    if ($WidthProvided -eq $false) {

                        $Width = [Math]::Min($Screen.WorkingArea.Width / 2, $Width);
                    }

                    $X = $Screen.WorkingArea.X + $Screen.WorkingArea.Width - $Width;

                    Microsoft.PowerShell.Utility\Write-Verbose "Right chosen, X = $X, Width = $Width"
                }
            }

            if ($Top -eq $true) {

                $Y = $Screen.WorkingArea.Y;

                if ($HeightProvided -eq $false) {

                    $Height = [Math]::Min($Screen.WorkingArea.Height / 2, $Height);
                }

                Microsoft.PowerShell.Utility\Write-Verbose "Top chosen, Y = $Y, Height = $Height"
            }
            else {
                if ($Bottom -eq $true) {

                    if ($HeightProvided -eq $false) {

                        $Height = [Math]::Min($Screen.WorkingArea.Height / 2, $Height);
                    }
                    $Y = $Screen.WorkingArea.Y + $Screen.WorkingArea.Height - $Height;

                    Microsoft.PowerShell.Utility\Write-Verbose "Bottom chosen, Y = $Y, Height = $Height"
                }
            }

            if ($Centered -eq $true) {

                if ($HeightProvided -eq $false) {

                    $Height = [Math]::Round([Math]::Min($Screen.WorkingArea.Height * 0.8, $Height), 0);
                }

                if ($WidthProvided -eq $false) {

                    $Width = [Math]::Round([Math]::Min($Screen.WorkingArea.Width * 0.8, $Width), 0);
                }

                $X = $Screen.WorkingArea.X + [Math]::Round(($screen.WorkingArea.Width - $Width) / 2, 0);
                $Y = $Screen.WorkingArea.Y + [Math]::Round(($screen.WorkingArea.Height - $Height) / 2, 0);

                Microsoft.PowerShell.Utility\Write-Verbose "Centered chosen, X = $X, Width = $Width, Y = $Y, Height = $Height"
            }

            if ($PSCmdlet.ShouldProcess(
                    "Window of process '$($currentProcess.ProcessName)'",
                    "Set position/size to: X=$X Y=$Y W=$Width H=$Height")) {

                # perform the actual window positioning
                $null = position $currentProcess $window $X $Y $Width $Height

                # return window helper if PassThru specified
                if ($PassThru -eq $true) {
                    $window
                }
            }
        }
    }

    End {
    }
}
################################################################################