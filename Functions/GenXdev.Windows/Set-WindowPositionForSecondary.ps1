################################################################################

<#
.SYNOPSIS
Positions a window on the secondary monitor with specified layout options.

.DESCRIPTION
Positions a window using Set-WindowPosition but defaults to the configured
secondary monitor. Supports various positioning options like left/right/top/bottom
alignment and border settings.

.PARAMETER Monitor
The monitor to use, 0 = default, 1 = secondary, -1 is discard, -2 = configured
secondary monitor

.PARAMETER Process
The process of the window to position

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

.PARAMETER NoBorders
Open in NoBorders mode

.PARAMETER RestoreFocus
Restore PowerShell window focus

.PARAMETER NewWindow
Don't re-use existing window, create a new one

.PARAMETER PassThru
Returns a [System.Diagnostics.Process] object of the browser process

.EXAMPLE
Set-WindowPositionForSecondary -Process "notepad" -Width 800 -Height 600 -Centered

.EXAMPLE
wps notepad -w 800 -h 600 -c
#>
function Set-WindowPositionForSecondary {

    ###############################################################################
    [CmdletBinding()]
    [Alias("wps")]
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
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 0,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor"
        )]
        [Alias("m", "mon")]
        [int] $Monitor = -2,
        ########################################################################

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

    begin {

        Write-Verbose "Initializing window positioning for secondary monitor"

        if ($Monitor -lt -1) {

            # get the configured default secondary monitor
            [int] $defaultMonitor = 1
            $AllScreens = @([WpfScreenHelper.Screen]::AllScreens)

            # try to parse the global default secondary monitor setting
            if ([int]::TryParse($Global:DefaultSecondaryMonitor, [ref] $defaultMonitor)) {
                Write-Verbose "Using configured secondary monitor: $defaultMonitor"
                $Monitor = $defaultMonitor % $AllScreens.Length
            }
            else {
                Write-Verbose "Using default secondary monitor: 1"
                $Monitor = 1 % $AllScreens.Length
            }

            Write-Verbose "Selected monitor index: $Monitor"
        }

        if (-not $PSBoundParameters.ContainsKey("Monitor")) {

            $null = $PSBoundParameters.Add("Monitor", $Monitor)
        }
        else {

            $Monitor = $PSBoundParameters["Monitor"]
        }
    }

    process {

        # forward all parameters to Set-WindowPosition
        Write-Verbose "Forwarding parameters to Set-WindowPosition"
        Set-WindowPosition @PSBoundParameters
    }
}
################################################################################
