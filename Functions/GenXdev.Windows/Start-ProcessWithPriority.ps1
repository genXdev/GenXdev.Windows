###############################################################################

function Start-ProcessWithPriority {

    [CmdletBinding()]
    [Alias("nice")]

    param (

        [parameter(
            Mandatory
        )]
        [string]$FilePath,

        [parameter(
            Mandatory = $false
        )]

        [string[]]$ArgumentList = "",

        [ValidateSet("Idle", "BelowNormal", "Low", "Normal", "AboveNormal", "High", "RealTime")]

        [parameter(
            Mandatory = $false
        )]
        [string] $Priority = "BelowNormal",

        [parameter(
            Mandatory = $false
        )]
        [switch] $NoWait,

        [parameter(
            Mandatory = $false
        )]
        [switch] $PassThru
    )

    $process = Start-Process -FilePath $FilePath -ArgumentList $ArgumentList -PassThru -NoNewWindow
    if ($null -eq $process) { return; }

    $process.PriorityClass = $Priority

    if ($NoWait -eq $true) { return; }

    $process.WaitForExit();

    if ($PassThru -eq $true) { return $process; }
}
