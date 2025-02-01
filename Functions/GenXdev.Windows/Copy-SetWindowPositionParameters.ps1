###############################################################################

<#
.SYNOPSIS
    Proxy function dynamic parameter block for the Set-WindowPosition cmdlet
.DESCRIPTION
    The dynamic parameter block of a proxy function. This block can be used to copy a proxy function target's parameters .
#>
function Copy-SetWindowPositionParameters {

    [System.Diagnostics.DebuggerStepThrough()]

    param(
        [parameter(Mandatory = $false, Position = 0)]
        [string[]] $ParametersToSkip = @()
    )

    return (Copy-CommandParameters -CommandName "Set-WindowPosition" -ParametersToSkip $ParametersToSkip)
}
