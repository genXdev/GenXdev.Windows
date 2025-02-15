################################################################################
<#
.SYNOPSIS
Positions a window on the secondary monitor with specified layout options.

.DESCRIPTION
This function allows positioning windows on a configured secondary monitor using
Set-WindowPosition with various layout options including alignment, size, and
border settings. It handles monitor selection based on global configuration.

.PARAMETER Process
The process or processes containing the windows to position.

.PARAMETER Monitor
The monitor to use (0=default, 1=secondary, -1=discard, -2=configured secondary).

.PARAMETER Width
The desired width of the window in pixels.

.PARAMETER Height
The desired height of the window in pixels.

.PARAMETER X
The desired X coordinate for window placement.

.PARAMETER Y
The desired Y coordinate for window placement.

.PARAMETER Left
Place the window on the left side of the screen.

.PARAMETER Right
Place the window on the right side of the screen.

.PARAMETER Top
Place the window at the top of the screen.

.PARAMETER Bottom
Place the window at the bottom of the screen.

.PARAMETER Centered
Center the window on the screen.

.PARAMETER Fullscreen
Maximize the window to fill the screen.

.PARAMETER NoBorders
Remove window borders and title bar.

.PARAMETER RestoreFocus
Return focus to the PowerShell window after positioning.

.PARAMETER PassThru
Return the Process object after positioning.

.PARAMETER NewWindow
Create a new window instead of reusing existing ones.

.EXAMPLE
Set-WindowPositionForSecondary -Process "notepad" -Width 800 -Height 600 `
    -Centered -NoBorders

.EXAMPLE
wps notepad -w 800 -h 600 -c -nb
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
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            Position = 0,
            HelpMessage = "The monitor to use, 0=default, -1=discard, -2=configured"
        )]
        [Alias("m", "mon")]
        [int] $Monitor = -2,
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
            HelpMessage = "Returns the process object after positioning"
        )]
        [switch] $PassThru
    )

    begin {

        Write-Verbose "Initializing window positioning for secondary monitor"

        if ($Monitor -lt -1) {

            # get array of all available screens
            $allScreens = @([WpfScreenHelper.Screen]::AllScreens)

            # initialize default secondary monitor index
            [int] $defaultMonitor = 1

            # try to use globally configured secondary monitor if available
            if ([int]::TryParse($Global:DefaultSecondaryMonitor, [ref] $defaultMonitor)) {
                Write-Verbose "Using configured secondary monitor: $defaultMonitor"
                $Monitor = $defaultMonitor % $allScreens.Length
            }
            else {
                Write-Verbose "Using default secondary monitor: 1"
                $Monitor = 1 % $allScreens.Length
            }

            Write-Verbose "Selected monitor index: $Monitor"
        }

        # ensure monitor parameter is included in bound parameters
        if (-not $PSBoundParameters.ContainsKey("Monitor")) {

            $null = $PSBoundParameters.Add("Monitor", $Monitor)
        }
        else {

            $Monitor = $PSBoundParameters["Monitor"]
        }
    }

    process {

        # copy matching parameters to pass to Set-WindowPosition
        $invocationArguments = Copy-IdenticalParamValues `
            -BoundParameters $PSBoundParameters `
            -FunctionName "GenXdev.Windows\Set-WindowPosition" `
            -DefaultValues (Get-Variable -Scope Local -Name * -ErrorAction SilentlyContinue)

        Write-Verbose "Forwarding parameters to Set-WindowPosition"
        Set-WindowPosition @invocationArguments
    }
}
################################################################################
