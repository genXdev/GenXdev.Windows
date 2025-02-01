function Get-KnownFolderPath {

    [CmdletBinding()]
    [Alias("folder")]

    param (
        [Parameter(Mandatory)]
        [ValidateSet('3DObjects', 'AddNewPrograms', 'AdminTools', 'AppUpdates', 'CDBurning', 'ChangeRemovePrograms', 'CommonAdminTools', 'CommonOEMLinks', 'CommonPrograms', 'CommonStartMenu', 'CommonStartup', 'CommonTemplates', 'ComputerFolder', 'ConflictFolder', 'ConnectionsFolder', 'Contacts', 'ControlPanelFolder', 'Cookies', 'Desktop', 'Documents', 'Downloads', 'Favorites', 'Fonts', 'Games', 'GameTasks', 'History', 'InternetCache', 'InternetFolder', 'Links', 'LocalAppData', 'LocalAppDataLow', 'LocalizedResourcesDir', 'Music', 'NetHood', 'NetworkFolder', 'OriginalImages', 'PhotoAlbums', 'Pictures', 'Playlists', 'PrintersFolder', 'PrintHood', 'Profile', 'ProgramData', 'ProgramFiles', 'ProgramFilesX64', 'ProgramFilesX86', 'ProgramFilesCommon', 'ProgramFilesCommonX64', 'ProgramFilesCommonX86', 'Programs', 'Public', 'PublicDesktop', 'PublicDocuments', 'PublicDownloads', 'PublicGameTasks', 'PublicMusic', 'PublicPictures', 'PublicVideos', 'QuickLaunch', 'Recent', 'RecycleBinFolder', 'ResourceDir', 'RoamingAppData', 'SampleMusic', 'SamplePictures', 'SamplePlaylists', 'SampleVideos', 'SavedGames', 'SavedSearches', 'SEARCH_CSC', 'SEARCH_MAPI', 'SearchHome', 'SendTo', 'SidebarDefaultParts', 'SidebarParts', 'StartMenu', 'Startup', 'SyncManagerFolder', 'SyncResultsFolder', 'SyncSetupFolder', 'System', 'SystemX86', 'Templates', 'TreeProperties', 'UserProfiles', 'UsersFiles', 'Videos', 'Windows')]
        [string]$KnownFolder
    )
    # Define SHGetKnownFolderPathif it hasn't been defined already
    $Type = ([System.Management.Automation.PSTypeName]'KnownFolders.SHGetKnownFolderPathPS').Type
    if (-not $Type) {
        # http://www.pinvoke.net/default.aspx/shell32/SHGetKnownFolderPath.html
        $Signature = @'
[DllImport("shell32.dll")]
public extern static int SHGetKnownFolderPath(ref Guid folderId, uint flags, IntPtr token,[MarshalAs(UnmanagedType.LPWStr)] out string pszPath);
'@
        $Type = Add-Type -MemberDefinition $Signature -Namespace 'KnownFolders' -Name 'SHGetKnownFolderPathPS' -PassThru
    }
    $Path = @{value = $null; }
    $code = $Type::SHGetKnownFolderPath([ref]$KnownFolders[$KnownFolder], 0, 0, [ref]$Path)
    if ($code -eq 0) {

        return $Path;
    }
    return $null
}
