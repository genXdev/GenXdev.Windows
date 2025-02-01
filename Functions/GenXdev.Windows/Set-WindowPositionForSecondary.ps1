###############################################################################

<#
.SYNOPSIS
Positions a window and positions it by default on the secondairy monitor

.DESCRIPTION
Positions a window like Set-WindowPosition -> wp but defaults to the configured secondairy monitor

.PARAMETER Process
The process of the window to position

.PARAMETER Monitor
The monitor to use, 0 = default, 1 = secondary, -1 is discard
.PARAMETER NoBorders
Open in NoBorders mode --> -fs

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

.EXAMPLE

#>
function Set-WindowPositionForSecondary {

    [CmdletBinding()]
    [Alias("wps")]

    param(
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = -2
    )

    DynamicParam {

        Copy-SetWindowPositionParameters -ParametersToSkip "Process", "Monitor"
    }

    begin {

        if ($Monitor -lt -1) {

            [int] $defaultMonitor = 1;

            $AllScreens = @([WpfScreenHelper.Screen]::AllScreens | ForEach-Object { $PSItem });

            if ([int]::TryParse($Global:DefaultSecondaryMonitor, [ref] $defaultMonitor)) {

                $Monitor = $defaultMonitor % $AllScreens.Length;
            }
            else {

                $Monitor = 1 % $AllScreens.Length;
            }
        }
    }

    process {

        Set-WindowPosition @PSBoundParameters
    }
}
