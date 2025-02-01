################################################################################
function CurrentUserHasElivatedRights() {

    $id = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $p = New-Object System.Security.Principal.WindowsPrincipal($id)

    if ($p.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator) -or
        $p.IsInRole([System.Security.Principal.WindowsBuiltInRole]::BackupOperator)) {

        return $true;
    }

    return $false;
}
