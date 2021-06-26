<hr/>

<img src="powershell.jpg" alt="drawing" width="50%"/>

<hr/>

### NAME
    GenXdev.Windows

### SYNOPSIS
    A Windows PowerShell module that provides ui Windows manipulation helpers

[![GenXdev.Windows](https://img.shields.io/powershellgallery/v/GenXdev.Windows.svg?style=flat-square&label=GenXdev.Windows)](https://www.powershellgallery.com/packages/GenXdev.Windows/) [![License](https://img.shields.io/github/license/renevaessen/GenXdev.Windows?style=flat-square)](./LICENSE)

### FEATURES

    * ✅ Allow resizing/repositioning/closing of Windows
    * ✅ Read/write access to Windows special folder locations

### DEPENDENCIES
[![GenXdev.Helpers](https://img.shields.io/powershellgallery/v/GenXdev.Helpers.svg?style=flat-square&label=GenXdev.Helpers)](https://www.powershellgallery.com/packages/GenXdev.Helpers/)
### INSTALLATION
````PowerShell
Install-Module "GenXdev.Windows" -Force
Import-Module "GenXdev.Windows"
````
### UPDATE
````PowerShell
Update-Module
````

<br/><hr/><hr/><hr/><hr/><br/>

# Cmdlets
### NAME
    Get-KnownFolderPath
### SYNOPSIS
    Gets a known folder's path using SHGetKnownFolderPath.
### SYNTAX
````PowerShell
Get-KnownFolderPath [-KnownFolder] <String> {3DObjects | AddNewPrograms |
                    AdminTools | AppUpdates | CDBurning | ChangeRemovePrograms |
                    CommonAdminTools | CommonOEMLinks | CommonPrograms | CommonStartMenu |
                    CommonStartup | CommonTemplates | ComputerFolder | ConflictFolder |
                    ConnectionsFolder | Contacts | ControlPanelFolder | Cookies | Desktop |
                    Documents | Downloads | Favorites | Fonts | Games | GameTasks | History |
                    InternetCache | InternetFolder | Links | LocalAppData | LocalAppDataLow |
                    LocalizedResourcesDir | Music | NetHood | NetworkFolder | OriginalImages |
                    PhotoAlbums | Pictures | Playlists | PrintersFolder | PrintHood | Profile
                    | ProgramData | ProgramFiles | ProgramFilesX64 | ProgramFilesX86 |
                    ProgramFilesCommon | ProgramFilesCommonX64 | ProgramFilesCommonX86 |
                    Programs | Public | PublicDesktop | PublicDocuments | PublicDownloads |
                    PublicGameTasks | PublicMusic | PublicPictures | PublicVideos |
                    QuickLaunch | Recent | RecycleBinFolder | ResourceDir | RoamingAppData |
                    SampleMusic | SamplePictures | SamplePlaylists | SampleVideos | SavedGames
                    | SavedSearches | SEARCH_CSC | SEARCH_MAPI | SearchHome | SendTo |
                    SidebarDefaultParts | SidebarParts | StartMenu | Startup |
                    SyncManagerFolder | SyncResultsFolder | SyncSetupFolder | System |
                    SystemX86 | Templates | TreeProperties | UserProfiles | UsersFiles |
                    Videos | Windows} [<CommonParameters>]
````
### DESCRIPTION
### PARAMETERS
    -KnownFolder <String>
        The known folder whose path to get.
        Required?                    true
        Position?                    1
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Get-Window
### SYNTAX
````PowerShell
Get-Window [-ProcessName] <string> [<CommonParameters>]
````
### PARAMETERS
    -ProcessName <string>
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Set-KnownFolderPath
### SYNTAX
````PowerShell
Set-KnownFolderPath [-KnownFolder] {3DObjects | AddNewPrograms |
                    AdminTools | AppUpdates | CDBurning | ChangeRemovePrograms |
                    CommonAdminTools | CommonOEMLinks | CommonPrograms | CommonStartMenu |
                    CommonStartup | CommonTemplates | ComputerFolder | ConflictFolder |
                    ConnectionsFolder | Contacts | ControlPanelFolder | Cookies | Desktop |
                    Documents | Downloads | Favorites | Fonts | Games | GameTasks | History |
                    InternetCache | InternetFolder | Links | LocalAppData | LocalAppDataLow |
                    LocalizedResourcesDir | Music | NetHood | NetworkFolder | OriginalImages |
                    PhotoAlbums | Pictures | Playlists | PrintersFolder | PrintHood | Profile
                    | ProgramData | ProgramFiles | ProgramFilesX64 | ProgramFilesX86 |
                    ProgramFilesCommon | ProgramFilesCommonX64 | ProgramFilesCommonX86 |
                    Programs | Public | PublicDesktop | PublicDocuments | PublicDownloads |
                    PublicGameTasks | PublicMusic | PublicPictures | PublicVideos |
                    QuickLaunch | Recent | RecycleBinFolder | ResourceDir | RoamingAppData |
                    SampleMusic | SamplePictures | SamplePlaylists | SampleVideos | SavedGames
                    | SavedSearches | SEARCH_CSC | SEARCH_MAPI | SearchHome | SendTo |
                    SidebarDefaultParts | SidebarParts | StartMenu | Startup |
                    SyncManagerFolder | SyncResultsFolder | SyncSetupFolder | System |
                    SystemX86 | Templates | TreeProperties | UserProfiles | UsersFiles |
                    Videos | Windows} [-Path] <string> [<CommonParameters>]
````
### PARAMETERS
    -KnownFolder <string>
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Path <string>
        Required?                    true
        Position?                    1
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).