################################################################################
<#
.SYNOPSIS
Checks if the current user has elevated rights.

.DESCRIPTION
Determines whether the current Windows user has administrative or backup operator
privileges by checking their security principal roles.

.EXAMPLE
$hasRights = CurrentUserHasElevatedRights

.OUTPUTS
System.Boolean
True if the current user has administrative or backup operator rights, false otherwise.
#>
function CurrentUserHasElevatedRights {

    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param()

    begin {
        Write-Verbose "Checking current user's security privileges..."
    }

    process {
        # get the current windows identity
        $identity = [System.Security.Principal.WindowsIdentity]::GetCurrent()

        # create a new principal object from the identity
        $principal = New-Object System.Security.Principal.WindowsPrincipal($identity)

        # check if user has admin or backup operator rights
        if ($principal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator) -or
            $principal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::BackupOperator)) {

            Write-Verbose "User has elevated rights"
            return $true
        }

        Write-Verbose "User does not have elevated rights"
        return $false
    }

    end {
    }
}
################################################################################
