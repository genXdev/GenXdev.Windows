###############################################################################
<#
.SYNOPSIS
Retrieves a list of unique usernames from currently active system processes.

.DESCRIPTION
Queries all running processes on the system, extracts the associated username for
each process, and returns a deduplicated list of users who have active processes.
This is useful for system administration and security monitoring.

.EXAMPLE
Get-ActiveUser
Returns a list of all unique usernames with active processes.

.EXAMPLE
gusers
Uses the alias to get the same results.
###############################################################################>
function Get-ActiveUser {

    [CmdletBinding()]
    [Alias("gusers")]
    param()

    begin {

        # store original error preferences for restoration
        $originalEAP = $ErrorActionPreference
        $originalErrorView = $ErrorView

        # set strict error handling
        $ErrorActionPreference = 'Stop'
        $ErrorView = 'DetailedView'

        # inform about the start of process enumeration
        Microsoft.PowerShell.Utility\Write-Verbose "Starting to enumerate all system processes..."
    }


process {

        try {

            # get all processes with associated usernames (requires admin privileges)
            $processes = Microsoft.PowerShell.Management\Get-Process * `
                -IncludeUserName `
                -ErrorAction Stop

            # extract and deduplicate usernames from process list
            $users = $processes |
                Microsoft.PowerShell.Core\ForEach-Object UserName |
                Microsoft.PowerShell.Utility\Select-Object -Unique

            # return the filtered list
            $users
        }
        catch [System.UnauthorizedAccessException] {

            Microsoft.PowerShell.Utility\Write-Error `
                -Message "Access denied while retrieving processes. Run with elevated privileges." `
                -Exception $_.Exception `
                -Category PermissionDenied `
                -ErrorId 'ActiveUserAccessDenied'
            throw
        }
        catch [System.ArgumentException] {

            Microsoft.PowerShell.Utility\Write-Error `
                -Message "Invalid argument provided when retrieving processes." `
                -Exception $_.Exception `
                -Category InvalidArgument `
                -ErrorId 'ActiveUserInvalidArgument'
            throw
        }
        catch {

            Microsoft.PowerShell.Utility\Write-Error `
                -Message "Unexpected error while retrieving active users: $_" `
                -Exception $_.Exception `
                -Category OperationStopped `
                -ErrorId 'ActiveUserUnexpectedError'
            throw
        }
    }

    end {

        # restore original error handling settings
        $ErrorActionPreference = $originalEAP
        $ErrorView = $originalErrorView

        # output completion status if users were found
        if ($null -ne $users) {

            Microsoft.PowerShell.Utility\Write-Verbose `
                "Process completed. Found $($users.Count) unique active users."
        }
        else {

            Microsoft.PowerShell.Utility\Write-Verbose `
                "Process completed. No active users found or an error occurred."
        }
    }
}
        ###############################################################################