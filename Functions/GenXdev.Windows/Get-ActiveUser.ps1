################################################################################
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
#>
function Get-ActiveUser {

    [CmdletBinding()]
    [Alias("gusers")]
    param()

    begin {

        # inform about the start of process enumeration
        Write-Verbose "Starting to enumerate all system processes..."
    }

    process {

        # get all processes with associated usernames (requires admin privileges)
        $processes = Get-Process * -IncludeUserName

        # extract and deduplicate usernames from process list
        $users = $processes |
        ForEach-Object UserName |
        Select-Object -Unique

        # return the filtered list
        $users
    }

    end {

        # output completion status
        Write-Verbose "Process completed. Found $($users.Count) unique active users."
    }
}
################################################################################