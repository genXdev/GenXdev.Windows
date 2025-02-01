###############################################################################

<#
.SYNOPSIS
Positions a window

.DESCRIPTION
Positions a window in a configurable manner, using commandline switches

.PARAMETER Process
The process of the window to position

.PARAMETER Monitor
The monitor to use, 0 = default, 1 = secondary, -1 is discard

.PARAMETER NoBorders
Open in NoBorders mode --> -nb

.PARAMETER Width
The initial width of the window

.PARAMETER Height
The initial height of the window

.PARAMETER X
The initial X position of the window

.PARAMETER Y
The initial Y position of the window

.PARAMETER Left
Place window on the left side of the screen

.PARAMETER Right
Place window on the right side of the screen

.PARAMETER Top
Place window on the top side of the screen

.PARAMETER Bottom
Place window on the bottom side of the screen

.PARAMETER Centered
Place window in the center of the screen

.PARAMETER RestoreFocus
Restore PowerShell window focus --> -bg

.PARAMETER NewWindow
Don't re-use existing window, instead, create a new one -> nw

.PARAMETER PassThru
Returns a [System.Diagnostics.Process] object of the browserprocess

#>
function Set-WindowPosition {

    [CmdletBinding()]
    [Alias("wp")]

    param(
        ###############################################################################

        [parameter(
            Mandatory = $false,
            Position = 0,
            HelpMessage = "The process of the window to position",
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            ValueFromRemainingArguments = $false
        )]
        [System.Diagnostics.Process[]] $Process,
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
            HelpMessage = "Returns the [System.Diagnostics.Process] object of the browserprocess"
        )]
        [switch] $PassThru

    )

    Begin {

        # reference powershell main window
        $PowerShellWindow = Get-PowershellMainWindow

        # what if no process is specified?
        if (($null -eq $Process) -or ($Process.Length -lt 1)) {

            $Process = @((Get-PowershellMainWindowProcess))
        }
    }

    Process {

        $Screen = [WpfScreenHelper.Screen]::PrimaryScreen;
        $AllScreens = @([WpfScreenHelper.Screen]::AllScreens | ForEach-Object { $PSItem });
        function refocusTab() {

            # '-RestoreFocus' parameter supplied'?
            if ($RestoreFocus -eq $true) {

                # Get handle to current foreground window
                $CurrentActiveWindow = [GenXdev.Helpers.WindowObj]::GetFocusedWindow();

                # Is it different then the one at the start of this command?
                if (($null -ne $PowerShellWindow) -and ($PowerShellWindow.Handle -ne $CurrentActiveWindow.Handle)) {

                    # restore it
                    $PowershellWindow.SetForeground();

                    # wait
                    [System.Threading.Thread]::Sleep(250);

                    # did it not work?
                    $CurrentActiveWindow = [GenXdev.Helpers.WindowObj]::GetFocusedWindow();
                    if ($PowershellWindow.Handle -ne $CurrentActiveWindow.Handle) {

                        try {
                            # Sending Alt-Tab
                            $helper = New-Object -ComObject WScript.Shell;
                            $helper.sendKeys("%{TAB}");
                            Write-Verbose "Sending Alt-Tab"

                            # wait
                            [System.Threading.Thread]::Sleep(500);
                        }
                        catch {

                        }
                    }
                }
            }
        }

        function position($process, $window, $X, $Y, $Width, $Height) {

            # have a handle to the mainwindow of the browser?
            if ($window.Length -eq 1) {

                Write-Verbose "Restoring and positioning window"

                $window.Move($X, $Y, $Width, $Height) | Out-Null;
                $window.Move($X, $Y, $Width, $Height) | Out-Null;

                # needs to be set NoBorders manually?
                if ($NoBorders -eq $true) {

                    Write-Verbose "Setting NoBorders"

                    $window[0].RemoveBorder();
                }
            }

        }

        ###############################################################################

        # start processing the Urls that we need to open
        foreach ($currentProcess in $Process) {

            # get window handle
            $window = [GenXdev.Helpers.WindowObj]::GetMainWindow($currentProcess);
            if ($window.Count -eq 0) { continue }

            # reference the requested monitor
            if ($Monitor -eq 0) {

                Write-Verbose "Choosing primary monitor, because default monitor requested using -Monitor 0"
            }
            else {
                if ($Monitor -eq -2 -and $Global:DefaultSecondaryMonitor -is [int] -and $Global:DefaultSecondaryMonitor -ge 0) {

                    Write-Verbose "Picking monitor #$((($Global:DefaultSecondaryMonitor-1) % $AllScreens.Length)) as secondary (requested with -monitor -2) set by `$Global:DefaultSecondaryMonitor"
                    $Screen = $AllScreens[($Global:DefaultSecondaryMonitor - 1) % $AllScreens.Length];
                }
                elseif ($Monitor -eq -2 -and (-not ($Global:DefaultSecondaryMonitor -is [int] -and $Global:DefaultSecondaryMonitor -ge 0)) -and ((Get-MonitorCount) -gt 1)) {

                    Write-Verbose "Picking monitor #1 as default secondary (requested with -monitor -2), because `$Global:DefaultSecondaryMonitor not set"
                    $Screen = $AllScreens[1];
                }
                elseif ($Monitor -ge 1) {

                    Write-Verbose "Picking monitor #$(($Monitor - 1) % $AllScreens.Length) as requested by the -Monitor parameter"
                    $Screen = $AllScreens[($Monitor - 1) % $AllScreens.Length]
                }
                elseif ($Monitor -eq 0) {

                    Write-Verbose "Picking monitor #1 (same as PowerShell), because no monitor specified"
                    $Screen = [WpfScreenHelper.Screen]::FromPoint(@{X = $window[0].Position().X; Y = $window[0].Position().Y });
                }
            }

            # init window position
            # '-X' parameter not supplied?
            if (($X -le 0) -or ($X -isnot [int])) {

                $X = $Screen.WorkingArea.X;
            }
            else {

                if ($Monitor -ge 0) {

                    $X = $Screen.WorkingArea.X + $X;
                }
            }
            Write-Verbose "X determined to be $X"

            # '-Y' parameter not supplied?
            if (($Y -le 0) -or ($Y -isnot [int])) {

                $Y = $Screen.WorkingArea.Y;
            }
            else {

                if ($Monitor -ge 0) {

                    $Y = $Screen.WorkingArea.Y + $Y;
                }
            }
            Write-Verbose "Y determined to be $Y"

            if ($Fullscreen -eq $true) {

                $Width = $Screen.WorkingArea.Width;
                $Height = $Screen.WorkingArea.Height;
            }

            Write-Verbose "Have positioning parameters set"

            $WidthProvided = ($Width -ge 0) -and ($Width -is [int]);
            $heightProvided = ($Height -ge 0) -and ($Height -is [int]);

            # '-Width' parameter not supplied?
            if ($WidthProvided -eq $false) {

                $Width = $Screen.WorkingArea.Width;

                Write-Verbose "Width not provided resetted to $Width"
            }

            # '-Height' parameter not supplied?
            if ($heightProvided -eq $false) {

                $Height = $Screen.WorkingArea.Height;

                Write-Verbose "Height not provided resetted to $Height"
            }

            # setup exact window position and size
            if ($Left -eq $true) {

                $X = $Screen.WorkingArea.X;

                if ($WidthProvided -eq $false) {

                    $Width = [Math]::Min($Screen.WorkingArea.Width / 2, $Width);
                }

                Write-Verbose "Left chosen, X = $X, Width = $Width"
            }
            else {
                if ($Right -eq $true) {

                    if ($WidthProvided -eq $false) {

                        $Width = [Math]::Min($Screen.WorkingArea.Width / 2, $Width);
                    }

                    $X = $Screen.WorkingArea.X + $Screen.WorkingArea.Width - $Width;

                    Write-Verbose "Right chosen, X = $X, Width = $Width"
                }
            }

            if ($Top -eq $true) {

                $Y = $Screen.WorkingArea.Y;

                if ($HeightProvided -eq $false) {

                    $Height = [Math]::Min($Screen.WorkingArea.Height / 2, $Height);
                }

                Write-Verbose "Top chosen, Y = $Y, Height = $Height"
            }
            else {
                if ($Bottom -eq $true) {

                    if ($HeightProvided -eq $false) {

                        $Height = [Math]::Min($Screen.WorkingArea.Height / 2, $Height);
                    }
                    $Y = $Screen.WorkingArea.Y + $Screen.WorkingArea.Height - $Height;

                    Write-Verbose "Bottom chosen, Y = $Y, Height = $Height"
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

                Write-Verbose "Centered chosen, X = $X, Width = $Width, Y = $Y, Height = $Height"
            }
        }

        position $currentProcess $window $X $Y $Width $Height

        if ($PassThru -eq $true) {

            $currentProcess
        }
    }
}
