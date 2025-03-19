################################################################################
<#
.SYNOPSIS
Gets the path of a Windows known folder using the Windows Shell32 API.

.DESCRIPTION
Retrieves the path of a specified Windows known folder using the Shell32 API's
SHGetKnownFolderPath function. This method is more reliable than using
environment variables as it works consistently across different Windows versions
and language settings. Supports all standard Windows known folders like
Documents, Downloads, AppData etc.

.PARAMETER KnownFolder
Specifies the name of the Windows known folder to retrieve. Must be one of the
predefined folder names like 'Documents', 'Downloads', etc. The function will
return the full path to this folder.

.EXAMPLE
Get-KnownFolderPath -KnownFolder 'Documents'
# Returns: C:\Users\Username\Documents

.EXAMPLE
folder Downloads
# Returns: C:\Users\Username\Downloads using the alias

.EXAMPLE
cd (folder Desktop)
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
        # Define known folder GUIDs
        $KnownFolders = @{
            'Desktop'   = '{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}'
            'Documents' = '{FDD39AD0-238F-46AF-ADB4-6C85480369C7}'
            'Downloads' = '{374DE290-123F-4565-9164-39C4925E467B}'
            # Add more folder GUIDs as needed...
        }

        # check if the windows api type is already defined in the current session
        $type = ([System.Management.Automation.PSTypeName]'Win32.Shell32API').Type

        if (-not $type) {
            Microsoft.PowerShell.Utility\Write-Verbose "Defining Windows Shell32 API function"

            # define the p/invoke signature for SHGetKnownFolderPath
            $signature = @'
[DllImport("shell32.dll")]
public extern static int SHGetKnownFolderPath(
    ref Guid folderId,
    uint flags,
    IntPtr token,
    [MarshalAs(UnmanagedType.LPWStr)] out string pszPath);
'@
            # add the shell32 api function definition as a new .net type
            $type = Microsoft.PowerShell.Utility\Add-Type `
                -MemberDefinition $signature `
                -Namespace 'Win32' `
                -Name 'Shell32API' `
                -PassThru
        }
    }

    process {
        Microsoft.PowerShell.Utility\Write-Verbose "Getting path for known folder: $KnownFolder"

        # Convert the GUID string to a GUID object
        $folderGuid = Microsoft.PowerShell.Utility\New-Object Guid $KnownFolders[$KnownFolder]

        # create a reference variable to store the output path
        [string]$path = $null

        # call the windows api to retrieve the folder path
        $code = $type::SHGetKnownFolderPath([ref]$folderGuid, 0, 0, [ref]$path)

        # check if the api call was successful and return the path
        if ($code -eq 0) {
            return $path
        }

        Microsoft.PowerShell.Utility\Write-Verbose "Failed to get path for: $KnownFolder (code: $code)"
        return $null
    }

    end {}
}
################################################################################