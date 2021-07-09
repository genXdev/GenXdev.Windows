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
[![WinOS - Windows-10](https://img.shields.io/badge/WinOS-Windows--10--10.0.19041--SP0-brightgreen)](https://www.microsoft.com/en-us/windows/get-windows-10) [![GenXdev.Helpers](https://img.shields.io/powershellgallery/v/GenXdev.Helpers.svg?style=flat-square&label=GenXdev.Helpers)](https://www.powershellgallery.com/packages/GenXdev.Helpers/)
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
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Copy-SetWindowPositionParameters
### SYNOPSIS
    Proxy function dynamic parameter block for the Set-WindowPosition cmdlet
### SYNTAX
````PowerShell
Copy-SetWindowPositionParameters [[-ParametersToSkip] <String[]>] [<CommonParameters>]
````
### DESCRIPTION
    The dynamic parameter block of a proxy function. This block can be used to copy a proxy
    function target's parameters, regardless of changes from version to version.
### PARAMETERS
    -ParametersToSkip <String[]>
        Required?                    false
        Position?                    1
        Default value                @()
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Get-DesktopScalingFactor
### SYNTAX
````PowerShell
Get-DesktopScalingFactor [[-monitor] <int>] [<CommonParameters>]
````
### PARAMETERS
    -monitor <int>
        Required?                    false
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Get-PowershellMainWindow
### SYNTAX
````PowerShell
Get-PowershellMainWindow
````
### PARAMETERS
    None
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Get-PowershellMainWindowProcess
### SYNTAX
````PowerShell
Get-PowershellMainWindowProcess
````
### PARAMETERS
    None
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Set-KnownFolderPath
### SYNTAX
````PowerShell
Set-KnownFolderPath [-KnownFolder] {3DObjects | AddNewPrograms | AdminTools |
AppUpdates | CDBurning | ChangeRemovePrograms | CommonAdminTools | CommonOEMLinks |
CommonPrograms | CommonStartMenu | CommonStartup | CommonTemplates | ComputerFolder |
ConflictFolder | ConnectionsFolder | Contacts | ControlPanelFolder | Cookies | Desktop
| Documents | Downloads | Favorites | Fonts | Games | GameTasks | History |
InternetCache | InternetFolder | Links | LocalAppData | LocalAppDataLow |
LocalizedResourcesDir | Music | NetHood | NetworkFolder | OriginalImages | PhotoAlbums
| Pictures | Playlists | PrintersFolder | PrintHood | Profile | ProgramData |
ProgramFiles | ProgramFilesX64 | ProgramFilesX86 | ProgramFilesCommon |
ProgramFilesCommonX64 | ProgramFilesCommonX86 | Programs | Public | PublicDesktop |
PublicDocuments | PublicDownloads | PublicGameTasks | PublicMusic | PublicPictures |
PublicVideos | QuickLaunch | Recent | RecycleBinFolder | ResourceDir | RoamingAppData |
SampleMusic | SamplePictures | SamplePlaylists | SampleVideos | SavedGames |
SavedSearches | SEARCH_CSC | SEARCH_MAPI | SearchHome | SendTo | SidebarDefaultParts |
SidebarParts | StartMenu | Startup | SyncManagerFolder | SyncResultsFolder |
SyncSetupFolder | System | SystemX86 | Templates | TreeProperties | UserProfiles |
UsersFiles | Videos | Windows} [-Path] <string> [<CommonParameters>]
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Set-TaskbarAlignment
### SYNTAX
````PowerShell
Set-TaskbarAlignment [-Justify] {Center | Left} [<CommonParameters>]
````
### PARAMETERS
    -Justify <Object>
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
````PowerShell
Set-WindowPosition                   --> wp
````

### SYNOPSIS
    Positions a window
### SYNTAX
````PowerShell
Set-WindowPosition [[-Process] <Process[]>] [-Monitor <Int32>] [-NoBorders] [-Width
<Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom]
[-Centered] [-RestoreFocus] [-PassThrough] [<CommonParameters>]
````
### DESCRIPTION
    Positions a window in a configurable manner, using commandline switches
### PARAMETERS
    -Process <Process[]>
        The process of the window to position
        Required?                    false
        Position?                    1
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false
    -Monitor <Int32>
        The monitor to use, 0 = default, 1 = secondary, -1 is discard
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -NoBorders [<SwitchParameter>]
        Open in NoBorders mode --> -fs
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -Width <Int32>
        The initial width of the window
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -Height <Int32>
        The initial height of the window
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -X <Int32>
        The initial X position of the window
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -Y <Int32>
        The initial Y position of the window
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -Left [<SwitchParameter>]
        Place window on the left side of the screen
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -Right [<SwitchParameter>]
        Place window on the right side of the screen
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -Top [<SwitchParameter>]
        Place window on the top side of the screen
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -Bottom [<SwitchParameter>]
        Place window on the bottom side of the screen
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -Centered [<SwitchParameter>]
        Place window in the center of the screen
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus --> -bg
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -PassThrough [<SwitchParameter>]
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
````PowerShell
Set-WindowPositionForSecondary       --> wps
````

### SYNTAX
````PowerShell
Set-WindowPositionForSecondary [[-Monitor] <int>] [-NoBorders] [-Width <int>] [-Height
<int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered]
[-RestoreFocus] [-PassThrough] [<CommonParameters>]
````
### PARAMETERS
    -Bottom
        Place window on the bottom side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Centered
        Place window in the center of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Height <int>
        The initial height of the window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor
        Required?                    false
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
        Accept wildcard characters?  false
    -NoBorders
        Removes the borders of the window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      nb, f
        Dynamic?                     true
        Accept wildcard characters?  false
    -PassThrough
        Returns the [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -RestoreFocus
        Restore PowerShell window focus
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      bg
        Dynamic?                     true
        Accept wildcard characters?  false
    -Right
        Place window on the right side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Width <int>
        The initial width of the window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -X <int>
        The initial X position of the window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Y <int>
        The initial Y position of the window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).