################################################################################
<#
.SYNOPSIS
Gets the path of a known Windows folder using its name.

.DESCRIPTION
Uses the Windows Shell32 API to retrieve the path of a specified known folder.
This is more reliable than using environment variables as it works across
different Windows versions and language settings.

.PARAMETER KnownFolder
The name of the known folder to retrieve the path for.

.EXAMPLE
Get-KnownFolderPath -KnownFolder 'Documents'
# Returns the path to the user's Documents folder

.EXAMPLE
folder Documents
# Returns the same using the alias
#>
function Get-KnownFolderPath {

    [CmdletBinding()]
    [Alias("folder")]
    param (
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = "The Windows known folder name to get the path for"
        )]
        [ValidateSet('3DObjects', 'AddNewPrograms', 'AdminTools', 'AppUpdates',
            'CDBurning', 'ChangeRemovePrograms', 'CommonAdminTools',
            'CommonOEMLinks', 'CommonPrograms', 'CommonStartMenu',
            'CommonStartup', 'CommonTemplates', 'ComputerFolder',
            'ConflictFolder', 'ConnectionsFolder', 'Contacts',
            'ControlPanelFolder', 'Cookies', 'Desktop', 'Documents', 'Downloads',
            'Favorites', 'Fonts', 'Games', 'GameTasks', 'History',
            'InternetCache', 'InternetFolder', 'Links', 'LocalAppData',
            'LocalAppDataLow', 'LocalizedResourcesDir', 'Music', 'NetHood',
            'NetworkFolder', 'OriginalImages', 'PhotoAlbums', 'Pictures',
            'Playlists', 'PrintersFolder', 'PrintHood', 'Profile',
            'ProgramData', 'ProgramFiles', 'ProgramFilesX64', 'ProgramFilesX86',
            'ProgramFilesCommon', 'ProgramFilesCommonX64',
            'ProgramFilesCommonX86', 'Programs', 'Public', 'PublicDesktop',
            'PublicDocuments', 'PublicDownloads', 'PublicGameTasks',
            'PublicMusic', 'PublicPictures', 'PublicVideos', 'QuickLaunch',
            'Recent', 'RecycleBinFolder', 'ResourceDir', 'RoamingAppData',
            'SampleMusic', 'SamplePictures', 'SamplePlaylists', 'SampleVideos',
            'SavedGames', 'SavedSearches', 'SEARCH_CSC', 'SEARCH_MAPI',
            'SearchHome', 'SendTo', 'SidebarDefaultParts', 'SidebarParts',
            'StartMenu', 'Startup', 'SyncManagerFolder', 'SyncResultsFolder',
            'SyncSetupFolder', 'System', 'SystemX86', 'Templates',
            'TreeProperties', 'UserProfiles', 'UsersFiles', 'Videos',
            'Windows')]
        [string]$KnownFolder
        ########################################################################
    )

    begin {

        # check if the type is already defined
        $type = ([System.Management.Automation.PSTypeName]`
            'KnownFolders.SHGetKnownFolderPathPS').Type

        if (-not $type) {
            Write-Verbose "Defining Windows Shell32 API function"

            # define the signature for SHGetKnownFolderPath from shell32.dll
            $signature = @'
[DllImport("shell32.dll")]
public extern static int SHGetKnownFolderPath(
    ref Guid folderId,
    uint flags,
    IntPtr token,
    [MarshalAs(UnmanagedType.LPWStr)] out string pszPath);
'@
            # add the type definition
            $type = Add-Type `
                -MemberDefinition $signature `
                -Namespace 'KnownFolders' `
                -Name 'SHGetKnownFolderPathPS' `
                -PassThru
        }
    }

    process {

        Write-Verbose "Getting path for known folder: $KnownFolder"

        # initialize the output path variable
        $path = @{ value = $null }

        # call the windows api to get the folder path
        $code = $type::SHGetKnownFolderPath(
            [ref]$KnownFolders[$KnownFolder],
            0,
            0,
            [ref]$path)

        # return the path if successful, null otherwise
        if ($code -eq 0) {
            return $path.value
        }

        Write-Verbose "Failed to get path for: $KnownFolder (code: $code)"
        return $null
    }

    end {}
}
################################################################################
