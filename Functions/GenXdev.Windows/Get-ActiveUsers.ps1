################################################################################
<#
.SYNOPSIS
Retrieves a list of unique usernames from currently active system processes.

.DESCRIPTION
Queries all running processes on the system, extracts the associated username for
each process, and returns a deduplicated list of users who have active processes.
This is useful for system administration and security monitoring.

.EXAMPLE
Get-ActiveUsers
Returns a list of all unique usernames with active processes.

.EXAMPLE
gusers
Uses the alias to get the same results.
#>
function Get-ActiveUsers {

    [CmdletBinding()]
    [Alias("gusers")]
    param()

    begin {

        # inform about the start of process enumeration
        Write-Verbose "Starting to enumerate all system processes..."
    }

    process {

        # get all processes with their associated usernames
        # this requires administrative privileges
        $processes = Get-Process * -IncludeUserName

        # extract unique usernames from the process list and remove duplicates
        $users = $processes |
        ForEach-Object UserName |
        Select-Object -Unique

        # return the filtered list of usernames
        $users
    }

    end {

        # output completion status with user count
        Write-Verbose "Process completed. Found $($users.Count) unique active users."
    }
}
################################################################################
