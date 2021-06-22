<hr/>

![](https://genxdev.net/Powershell.jpg)

<hr/>

## NAME
    GenXdev.Windows

## SYNOPSIS
    Provides a collection of cmdlets and .Net classes that help with some UI-manipulation/automation of windows, and other windows specific features

## TYPE
    PowerShell Module
## INSTALLATION
````Powershell

    Install-Module "GenXdev.Windows" -Force
    Import-Module "GenXdev.Windows"

````

<br/><hr/><hr/><hr/><hr/><br/>

# Cmdlets
### NAME
    Get-KnownFolderPath
### SYNOPSIS
    Gets a known folder's path using SHGetKnownFolderPath.
### SYNTAX
````PowerShell
Get-KnownFolderPath [-KnownFolder] <String> [<CommonParameters>]
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