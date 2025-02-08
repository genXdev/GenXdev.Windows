################################################################################
<#
.SYNOPSIS
Gets a list of unique usernames for currently active processes.

.DESCRIPTION
Retrieves all processes with their associated usernames and returns a unique list
of users who have active processes running on the system.

.EXAMPLE
Get-ActiveUsers

.EXAMPLE
gusers
#>
function Get-ActiveUsers {

    [CmdletBinding()]
    [Alias("gusers")]
    param()

    begin {
        Write-Verbose "Retrieving all processes with username information..."
    }

    process {
        # get all processes with their usernames
        $processes = Get-Process * -IncludeUserName

        # extract unique usernames from the processes
        $users = $processes |
            ForEach-Object UserName |
            Select-Object -Unique

        # output the unique usernames
        $users
    }

    end {
        Write-Verbose "Found $($users.Count) unique active users."
    }
}
################################################################################
