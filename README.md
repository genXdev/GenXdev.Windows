<hr/>

<img src="powershell.jpg" alt="GenXdev" width="50%"/>

<hr/>

### NAME
    GenXdev.Windows

### SYNOPSIS
    A Windows PowerShell module that provides UI Windows manipulation helpers

[![GenXdev.Windows](https://img.shields.io/powershellgallery/v/GenXdev.Windows.svg?style=flat-square&label=GenXdev.Windows)](https://www.powershellgallery.com/packages/GenXdev.Windows/) [![License](https://img.shields.io/github/license/genXdev/GenXdev.Windows?style=flat-square)](./LICENSE)

## APACHE 2.0 License

````text
Copyright (c) 2025 René Vaessen / GenXdev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

````

### FEATURES

    * Allow resizing/repositioning/closing of Windows
    * Get-Window will return a windows helper that allows you to manipulate the window
    * Read/write access to Windows special folder locations

### DEPENDENCIES
[![WinOS - Windows-10 or later](https://img.shields.io/badge/WinOS-Windows--10--10.0.19041--SP0-brightgreen)](https://www.microsoft.com/en-us/windows/get-windows-10) [![GenXdev.Data](https://img.shields.io/powershellgallery/v/GenXdev.Data.svg?style=flat-square&label=GenXdev.Data)](https://www.powershellgallery.com/packages/GenXdev.Data/) [![GenXdev.Helpers](https://img.shields.io/powershellgallery/v/GenXdev.Helpers.svg?style=flat-square&label=GenXdev.Helpers)](https://www.powershellgallery.com/packages/GenXdev.Helpers/) [![GenXdev.FileSystem](https://img.shields.io/powershellgallery/v/GenXdev.FileSystem.svg?style=flat-square&label=GenXdev.FileSystem)](https://www.powershellgallery.com/packages/GenXdev.FileSystem/)
### INSTALLATION
```PowerShell
Install-Module "GenXdev.Windows"
Import-Module "GenXdev.Windows"
```
### UPDATE
```PowerShell
Update-Module
```

<br/><hr/><br/>

# Cmdlet Index
### GenXdev.Windows
| Command | Aliases | Description |
| :--- | :--- | :--- |
| [CurrentUserHasElevatedRights](#currentuserhaselevatedrights) | &nbsp; | &nbsp; |
| [EnsureDockerDesktop](#ensuredockerdesktop) | &nbsp; | &nbsp; |
| [EnsurePSTools](#ensurepstools) | &nbsp; | &nbsp; |
| [Get-ActiveUser](#get-activeuser) | gusers | Retrieves a list of unique usernames from currently active system processes. |
| [Get-ChildProcesses](#get-childprocesses) | &nbsp; | Retrieves all processes that are descendants of the current PowerShell process. |
| [Get-ClipboardFiles](#get-clipboardfiles) | getclipfiles | Gets files from the Windows clipboard that were set for file operations like copy/paste. |
| [Get-CurrentFocusedProcess](#get-currentfocusedprocess) | &nbsp; | Retrieves the process object of the window that currently has keyboard focus. |
| [Get-DesktopScalingFactor](#get-desktopscalingfactor) | &nbsp; | Retrieves the Windows display scaling factor (DPI setting) for a specified monitor. |
| [Get-ForegroundWindow](#get-foregroundwindow) | &nbsp; | Gets the handle of the currently active foreground window. |
| [Get-KnownFolderPath](#get-knownfolderpath) | folder | Gets the path of a Windows known folder using the Windows Shell32 API. |
| [Get-MonitorCount](#get-monitorcount) | &nbsp; | Gets the total number of display monitors connected to the system. |
| [Get-MpCmdRunPath](#get-mpcmdrunpath) | &nbsp; | Gets the path to the Windows Defender MpCmdRun.exe executable. |
| [Get-OpenedFileHandleProcesses](#get-openedfilehandleprocesses) | &nbsp; | Retrieves processes that have open file handles to specified files. |
| [Get-PowershellMainWindow](#get-powershellmainwindow) | &nbsp; | Returns a window helper object for the PowerShell terminal's main window. |
| [Get-PowershellMainWindowProcess](#get-powershellmainwindowprocess) | &nbsp; | Returns the process object for the window hosting the PowerShell terminal. |
| [Get-Window](#get-window) | &nbsp; | Gets window information for specified processes or window handles. |
| [Get-WindowPosition](#get-windowposition) | gwp | &nbsp; |
| [Initialize-ScheduledTaskScripts](#initialize-scheduledtaskscripts) | &nbsp; | Creates scheduled tasks that run PowerShell scripts at specified intervals. |
| [Invoke-WindowsUpdate](#invoke-windowsupdate) | updatewindows | &nbsp; |
| [Pop-Window](#pop-window) | popw | &nbsp; |
| [Push-Window](#push-window) | pushw | &nbsp; |
| [Save-DesktopScreenShot](#save-desktopscreenshot) | &nbsp; | Captures a screenshot of the specified monitor and saves it to the specified path. |
| [Send-Key](#send-key) | invokekeys, sendkeys | &nbsp; |
| [Set-ClipboardFiles](#set-clipboardfiles) | setclipfiles | Sets files to the Windows clipboard for file operations like copy/paste. |
| [Set-ForegroundWindow](#set-foregroundwindow) | &nbsp; | Brings the specified window to the foreground and makes it the active window. |
| [Set-KnownFolderPath](#set-knownfolderpath) | &nbsp; | Modifies the physical path of a Windows known folder. |
| [Set-TaskbarAlignment](#set-taskbaralignment) | &nbsp; | Configures Windows 11+ taskbar alignment between center and left positions. |
| [Set-WindowPosition](#set-windowposition) | wp | &nbsp; |
| [Set-WindowPositionForSecondary](#set-windowpositionforsecondary) | wps | Positions a window on the secondary monitor with specified layout options. |
| [Set-WindowsWallpaper](#set-windowswallpaper) | &nbsp; | Sets a random wallpaper from a specified directory. |
| [Start-ProcessWithPriority](#start-processwithpriority) | nice | Starts a process with a specified priority level. |
| [Test-PathUsingWindowsDefender](#test-pathusingwindowsdefender) | HasNoVirus, virusscan | Scans files or directories for malware using Windows Defender. |

### GenXdev.Windows.WireGuard
| Command | Aliases | Description |
| :--- | :--- | :--- |
| [Add-WireGuardPeer](#add-wireguardpeer) | &nbsp; | Adds a new WireGuard VPN peer (client) configuration to the server. |
| [EnsureWireGuard](#ensurewireguard) | &nbsp; | &nbsp; |
| [Get-WireGuardPeerQRCode](#get-wireguardpeerqrcode) | &nbsp; | Generates a QR code for a WireGuard VPN peer configuration. |
| [Get-WireGuardPeers](#get-wireguardpeers) | &nbsp; | &nbsp; |
| [Get-WireGuardStatus](#get-wireguardstatus) | &nbsp; | &nbsp; |
| [Remove-WireGuardPeer](#remove-wireguardpeer) | &nbsp; | &nbsp; |
| [Reset-WireGuardConfiguration](#reset-wireguardconfiguration) | &nbsp; | &nbsp; |

<br/><hr/><br/>


# Cmdlets

&nbsp;<hr/>
###	GenXdev.Windows<hr/> 

##	CurrentUserHasElevatedRights 
```PowerShell 

   CurrentUserHasElevatedRights  
``` 

### SYNTAX 
```PowerShell 
CurrentUserHasElevatedRights [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	EnsureDockerDesktop 
```PowerShell 

   EnsureDockerDesktop  
``` 

### SYNTAX 
```PowerShell 
EnsureDockerDesktop [[-Monitor] <int>] [[-Width] <int>] [[-Height] <int>] [[-X] <int>] [[-Y] <int>] [[-KeysToSend] <string[]>] [[-SendKeyDelayMilliSeconds] <int>] [-ShowWindow] [-NoBorders] [-Force] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-SideBySide] [-FocusWindow] [-SetForeground] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SessionOnly] [-ClearSession] [-SkipSession] [-NoDockerInitialization] [-WhatIf] [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FocusWindow  
        Focus the window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Force  
        Forces a docker desktop restart  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Fullscreen  
        Maximize the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Height <int>  
        The initial height of the window  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        Keystrokes to send to the Window, see documentation for cmdlet GenXdev.Windows\Send-Key  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Monitor <int>  
        The monitor to use, 0 = default, -1 is discard  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBorders  
        Removes the borders of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoDockerInitialization  
        Skip Docker initialization and return immediately  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RestoreFocus  
        Restore PowerShell window focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetForeground  
        Set the window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ShowWindow  
        Show Docker Desktop window during initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SideBySide  
        Will either set the window fullscreen on a different monitor than Powershell, or side by side with Powershell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Top  
        Place window on the top side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Width <int>  
        The initial width of the window  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -X <int>  
        The initial X position of the window  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Y <int>  
        The initial Y position of the window  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	EnsurePSTools 
```PowerShell 

   EnsurePSTools  
``` 

### SYNTAX 
```PowerShell 
EnsurePSTools [[-PSExeName] <string>] [-Force] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Force  
        Force reinstallation of Sysinternals tools  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PSExeName <string>  
        The executable name to verify installation  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-KnownFolderPath 
```PowerShell 

   Get-KnownFolderPath                  --> folder  
``` 

### SYNTAX 
```PowerShell 
Get-KnownFolderPath [-KnownFolder] {3DObjects |
    AddNewPrograms | AdminTools | AppUpdates | CDBurning |
    ChangeRemovePrograms | CommonAdminTools | CommonOEMLinks
    | CommonPrograms | CommonStartMenu | CommonStartup |
    CommonTemplates | ComputerFolder | ConflictFolder |
    ConnectionsFolder | Contacts | ControlPanelFolder |
    Cookies | Desktop | Documents | Downloads | Favorites |
    Fonts | Games | GameTasks | History | InternetCache |
    InternetFolder | Links | LocalAppData | LocalAppDataLow
    | LocalizedResourcesDir | Music | NetHood |
    NetworkFolder | OriginalImages | PhotoAlbums | Pictures
    | Playlists | PrintersFolder | PrintHood | Profile |
    ProgramData | ProgramFiles | ProgramFilesX64 |
    ProgramFilesX86 | ProgramFilesCommon |
    ProgramFilesCommonX64 | ProgramFilesCommonX86 | Programs
    | Public | PublicDesktop | PublicDocuments |
    PublicDownloads | PublicGameTasks | PublicMusic |
    PublicPictures | PublicVideos | QuickLaunch | Recent |
    RecycleBinFolder | ResourceDir | RoamingAppData |
    SampleMusic | SamplePictures | SamplePlaylists |
    SampleVideos | SavedGames | SavedSearches | SEARCH_CSC |
    SEARCH_MAPI | SearchHome | SendTo | SidebarDefaultParts
    | SidebarParts | StartMenu | Startup | SyncManagerFolder
    | SyncResultsFolder | SyncSetupFolder | System |
    SystemX86 | Templates | TreeProperties | UserProfiles |
    UsersFiles | Videos | Windows} [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -KnownFolder <string>  
        The Windows known folder name to get the path for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-WindowPosition 
```PowerShell 

   Get-WindowPosition                   --> gwp  
``` 

### SYNTAX 
```PowerShell 
Get-WindowPosition [<CommonParameters>]
Get-WindowPosition [[-ProcessName] <string>]
    [<CommonParameters>]
Get-WindowPosition [-Process <Process>] [<CommonParameters>]
Get-WindowPosition [-WindowHelper <WindowObj[]>]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Process <Process>  
        The process of the window to get position for  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           Process  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ProcessName <string>  
        The process name of the window to get position for  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           ProcessName  
        Aliases                      Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -WindowHelper <WindowObj[]>  
        Get-Window helper object for direct window manipulation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           WindowHelper  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Initialize-ScheduledTaskScripts 
```PowerShell 

   Initialize-ScheduledTaskScripts  
``` 

### SYNTAX 
```PowerShell 
Initialize-ScheduledTaskScripts [[-FilePath] <string>]
    [[-Prefix] <string>] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilePath <string>  
        The directory path where task scripts will be created  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prefix <string>  
        Prefix for the scheduled task names  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Invoke-WindowsUpdate 
```PowerShell 

   Invoke-WindowsUpdate                 --> updatewindows  
``` 

### SYNTAX 
```PowerShell 
Invoke-WindowsUpdate [[-Criteria] <string>] [-Install]
    [-AutoReboot] [-IncludeDrivers] [-GroupByCategory]
    [-NoBanner] [-NoRebootCheck] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -AutoReboot  
        Automatically reboot if updates require a restart  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Criteria <string>  
        Custom Windows Update search criteria  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -GroupByCategory  
        Group and color output by update category  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -IncludeDrivers  
        Include drivers in update search  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Install  
        Automatically install available Windows updates  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBanner  
        Disable banner/status output  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoRebootCheck  
        Skip reboot requirement check/reporting  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Pop-Window 
```PowerShell 

   Pop-Window                           --> popw  
``` 

### SYNTAX 
```PowerShell 
Pop-Window [-Maximize] [-Minimize] [-Restore] [-Hide]
    [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <byte>]
    [-Focus] [-FadeIn] [-Left] [-Right] [-Top] [-Bottom]
    [-Centered] [-ShowWindow] [-Monitor <int>]
    [<CommonParameters>]
Pop-Window -Width <int> -Height <int> [-Maximize]
    [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders]
    [-AlwaysOnTop] [-Opacity <byte>] [-Focus] [-FadeIn]
    [-Left] [-Right] [-Top] [-Bottom] [-Centered]
    [-ShowWindow] [-Monitor <int>] [<CommonParameters>]
Pop-Window -X <int> -Y <int> [-Maximize] [-Minimize]
    [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop]
    [-Opacity <byte>] [-Focus] [-FadeIn] [-Left] [-Right]
    [-Top] [-Bottom] [-Centered] [-ShowWindow] [-Monitor
    <int>] [<CommonParameters>]
Pop-Window [-NoModify] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -AlwaysOnTop  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Bottom  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Centered  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FadeIn  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Height <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Hide  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Left  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Maximize  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Minimize  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Monitor <int>  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBorders  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoModify  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           NoModify  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Opacity <byte>  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Restore  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Right  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ShowWindow  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      sw  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Top  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Width <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -X <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Position  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Y <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Position  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Push-Window 
```PowerShell 

   Push-Window                          --> pushw  
``` 

### SYNTAX 
```PowerShell 
Push-Window [-Maximize] [-Minimize] [-Restore] [-Hide]
    [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <byte>]
    [-Focus] [-FadeOut] [-PassThru] [-Left] [-Right] [-Top]
    [-Bottom] [-Centered] [-ShowWindow] [-Monitor <int>]
    [<CommonParameters>]
Push-Window -Width <int> -Height <int> [-Maximize]
    [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders]
    [-AlwaysOnTop] [-Opacity <byte>] [-Focus] [-FadeOut]
    [-PassThru] [-Left] [-Right] [-Top] [-Bottom]
    [-Centered] [-ShowWindow] [-Monitor <int>]
    [<CommonParameters>]
Push-Window -X <int> -Y <int> [-Maximize] [-Minimize]
    [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop]
    [-Opacity <byte>] [-Focus] [-FadeOut] [-PassThru]
    [-Left] [-Right] [-Top] [-Bottom] [-Centered]
    [-ShowWindow] [-Monitor <int>] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -AlwaysOnTop  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Bottom  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Centered  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FadeOut  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Height <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Hide  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Left  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Maximize  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Minimize  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Monitor <int>  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBorders  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Opacity <byte>  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PassThru  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Restore  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Right  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ShowWindow  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      sw  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Top  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Width <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -X <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Position  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Y <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Position  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Send-Key 
```PowerShell 

   Send-Key                             --> invokekeys, sendkeys  
``` 

### SYNTAX 
```PowerShell 
Send-Key [-KeysToSend] <string[]> [-ProcessName <string>]
    [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds
    <int>] [<CommonParameters>]
Send-Key [-KeysToSend] <string[]> [-ProcessId <int>]
    [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds
    <int>] [<CommonParameters>]
Send-Key [-KeysToSend] <string[]> [-WindowHandle <long>]
    [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds
    <int>] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -KeysToSend <string[]>  
        The keyboard input to send as an array of strings  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ProcessId <int>  
        ID of the process to send keys to  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           ByProcessId  
        Aliases                      Id, PID  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ProcessName <string>  
        Name of the process to send keys to (supports wildcards)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           ByProcessName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyEscape  
        Escape control characters and modifiers in input text  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window after sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter for newlines  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WindowHandle <long>  
        Window handle to send keys to  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           ByWindowHandle  
        Aliases                      Handle, hWnd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Set-ClipboardFiles 
```PowerShell 

   Set-ClipboardFiles                   --> setclipfiles  
``` 

### SYNOPSIS 
    Sets files to the Windows clipboard for file operations like copy/paste.  

### SYNTAX 
```PowerShell 
Set-ClipboardFiles [-InputObject] <String[]> [-WhatIf]
    [-Confirm] [<CommonParameters>] 
``` 

### DESCRIPTION 
    This function copies one or more file paths to the Windows clipboard,  
    enabling file operations like paste in Windows Explorer. It handles both  
    STA and MTA threading modes automatically, ensuring compatibility across  
    different PowerShell execution contexts. The function validates file  
    existence before adding paths to the clipboard.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -InputObject <String[]>  
        Array of file paths to add to the clipboard. Accepts pipeline input and  
        supports various aliases for compatibility with different object properties.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Set-KnownFolderPath 
```PowerShell 

   Set-KnownFolderPath  
``` 

### SYNOPSIS 
    Modifies the physical path of a Windows known folder.  

### SYNTAX 
```PowerShell 
Set-KnownFolderPath [-KnownFolder] <String> [-Path] <String>
    [-WhatIf] [-Confirm] [<CommonParameters>] 
``` 

### DESCRIPTION 
    Uses the Windows Shell32 API to relocate system folders like Documents,  
    Downloads, Desktop, or other known Windows folders to a new location. The  
    function validates the target path exists, looks up the folder's unique GUID  
    from the comprehensive known folders registry, and uses the SHSetKnownFolderPath  
    API to perform the relocation. Common use cases include moving user folders to  
    a different drive for space management or organization. Exercise caution when  
    moving system-critical folders as this may affect system stability.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -KnownFolder <String>  
        The name of the known folder to relocate. Supports all Windows known folders  
        including user folders (Documents, Downloads, Desktop, Pictures, Videos,  
        Music), system folders (Windows, System, ProgramFiles), and special folders  
        (Recent, Favorites, SendTo, etc.). Use with caution as moving certain system  
        folders may cause instability.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -Path <String>  
        The new physical file system path where the known folder should be located.  
        The path must exist before attempting the move operation. The function will  
        throw an error if the path is invalid or inaccessible.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Set-WindowPosition 
```PowerShell 

   Set-WindowPosition                   --> wp  
``` 

### SYNTAX 
```PowerShell 
Set-WindowPosition [-Monitor <int>] [-NoBorders] [-Width
    <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left]
    [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen]
    [-RestoreFocus] [-PassThru] [-SideBySide] [-FocusWindow]
    [-SetForeground] [-Minimize] [-Maximize] [-SetRestored]
    [-KeysToSend <string[]>] [-SendKeyEscape]
    [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter]
    [-SendKeyDelayMilliSeconds <int>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-OnlyOutputCoords]
    [-WhatIf] [-Confirm] [<CommonParameters>]
Set-WindowPosition [[-ProcessName] <string>] [-Monitor
    <int>] [-NoBorders] [-Width <int>] [-Height <int>] [-X
    <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom]
    [-Centered] [-Fullscreen] [-RestoreFocus] [-PassThru]
    [-SideBySide] [-FocusWindow] [-SetForeground]
    [-Minimize] [-Maximize] [-SetRestored] [-KeysToSend
    <string[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds
    <int>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [-OnlyOutputCoords] [-WhatIf] [-Confirm]
    [<CommonParameters>]
Set-WindowPosition [-Process <Process>] [-Monitor <int>]
    [-NoBorders] [-Width <int>] [-Height <int>] [-X <int>]
    [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered]
    [-Fullscreen] [-RestoreFocus] [-PassThru] [-SideBySide]
    [-FocusWindow] [-SetForeground] [-Minimize] [-Maximize]
    [-SetRestored] [-KeysToSend <string[]>] [-SendKeyEscape]
    [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter]
    [-SendKeyDelayMilliSeconds <int>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-OnlyOutputCoords]
    [-WhatIf] [-Confirm] [<CommonParameters>]
Set-WindowPosition [-WindowHelper <WindowObj[]>] [-Monitor
    <int>] [-NoBorders] [-Width <int>] [-Height <int>] [-X
    <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom]
    [-Centered] [-Fullscreen] [-RestoreFocus] [-PassThru]
    [-SideBySide] [-FocusWindow] [-SetForeground]
    [-Minimize] [-Maximize] [-SetRestored] [-KeysToSend
    <string[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds
    <int>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [-OnlyOutputCoords] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FocusWindow  
        Focus the window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Fullscreen  
        Maximize the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Height <int>  
        Window height in pixels  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        Keystrokes to send to the Window, see documentation for cmdlet GenXdev.Windows\Send-Key  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Maximize  
        Maximize the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Minimize  
        Minimizes the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Monitor <int>  
        Monitor selection: 0=primary, 1+=specific monitor, -1=current, -2=secondary  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBorders  
        Removes the borders of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OnlyOutputCoords  
        Only output the calculated coordinates and size without actually positioning the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PassThru  
        Returns the window helper for each process  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Process <Process>  
        The process of the window to position  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           Process  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ProcessName <string>  
        The process name of the window to position  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           ProcessName  
        Aliases                      Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -RestoreFocus  
        Restore PowerShell window focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetForeground  
        Set the window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetRestored  
        Restore the window to normal state after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SideBySide  
        Will either set the window fullscreen on a different monitor than Powershell, or side by side with Powershell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Top  
        Place window on the top side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Width <int>  
        Window width in pixels  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WindowHelper <WindowObj[]>  
        Get-Window helper object for direct window manipulation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           WindowHelper  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -X <int>  
        Window horizontal position in pixels  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Y <int>  
        Window vertical position in pixels  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Set-WindowPositionForSecondary 
```PowerShell 

   Set-WindowPositionForSecondary       --> wps  
``` 

### SYNTAX 
```PowerShell 
Set-WindowPositionForSecondary [[-Process] <Process[]>]
    [-Monitor <int>] [-Width <int>] [-Height <int>] [-X
    <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom]
    [-Centered] [-FullScreen] [-NoBorders] [-RestoreFocus]
    [-FocusWindow] [-SetForeground] [-Maximize]
    [-SetRestored] [-KeysToSend <string[]>] [-SendKeyEscape]
    [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter]
    [-SendKeyDelayMilliSeconds <int>] [-PassThru]
    [-SideBySide] [-SessionOnly] [-ClearSession]
    [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FocusWindow  
        Focus the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FullScreen  
        Sends F11 to the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Height <int>  
        The initial height of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        Keystrokes to send to the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Maximize  
        Maximize the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Monitor <int>  
        The monitor to use, 0=default, -1=discard, -2=configured  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBorders  
        Removes the borders of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PassThru  
        Returns the process object after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Process <Process[]>  
        The process of the window to position  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RestoreFocus  
        Restore PowerShell window focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetForeground  
        Set the window to foreground after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetRestored  
        Restore the window to normal state after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SideBySide  
        Place window side by side with PowerShell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Top  
        Place window on the top side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Width <int>  
        The initial width of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -X <int>  
        The initial X position of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Y <int>  
        The initial Y position of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Windows.WireGuard<hr/> 

##	Add-WireGuardPeer 
```PowerShell 

   Add-WireGuardPeer  
``` 

### SYNTAX 
```PowerShell 
Add-WireGuardPeer [-PeerName] <string> [[-AllowedIPs]
    <string>] [[-DNS] <string>] [[-OutputPath] <string>]
    [[-ContainerName] <string>] [[-VolumeName] <string>]
    [[-ServicePort] <int>] [[-HealthCheckTimeout] <int>]
    [[-HealthCheckInterval] <int>] [[-ImageName] <string>]
    [[-PUID] <string>] [[-PGID] <string>] [[-TimeZone]
    <string>] [-SaveConfig] [-ShowWindow] [-NoBorders]
    [-Width <int>] [-Height <int>] [-Left <int>] [-Right
    <int>] [-Bottom <int>] [-Centered] [-Fullscreen]
    [-RestoreFocus] [-SideBySide] [-FocusWindow]
    [-SetForeground] [-SendKeyEscape]
    [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter]
    [-SendKeyDelayMilliSeconds <int>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-ShowQRCode]
    [-NoDockerInitialize] [-Force] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -AllowedIPs <string>  
        The IP ranges that will be routed through the VPN  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Bottom <int>  
        Set the window bottom position when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Centered  
        Center the window when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear session when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -DNS <string>  
        DNS servers to use for this peer  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FocusWindow  
        Focus the window after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Force  
        Force rebuild of Docker container and remove existing data  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ForceRebuild  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Fullscreen  
        Start the service in fullscreen mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    8  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Height <int>  
        Set the window height when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    9  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Left <int>  
        Set the window left position when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBorders  
        Remove window borders when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoDockerInitialize  
        Skip Docker initialization (used when already called by parent function)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OutputPath <string>  
        The path where the peer configuration file should be saved  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      outfile, OutputFile  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    11  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    10  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PeerName <string>  
        A unique name for the peer  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RestoreFocus  
        Restore focus to the window after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Right <int>  
        Set the window right position when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SaveConfig  
        Save the peer configuration to a file  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyDelayMilliSeconds <int>  
        Delay in milliseconds when sending keys after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyEscape  
        Send Escape key to the window after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus when sending keys after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyUseShiftEnter  
        Use Shift+Enter when sending keys after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use session only for the WireGuard service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetForeground  
        Set the window to foreground after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ShowQRCode  
        Generate QR code for easy mobile setup  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ShowWindow  
        Show the WireGuard window when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SideBySide  
        Show the window side by side when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Skip session when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    12  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Width <int>  
        Set the window width when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	EnsureWireGuard 
```PowerShell 

   EnsureWireGuard  
``` 

### SYNTAX 
```PowerShell 
EnsureWireGuard [[-ContainerName] <string>] [[-VolumeName] <string>] [[-ServicePort] <int>] [[-HealthCheckTimeout] <int>] [[-HealthCheckInterval] <int>] [[-ImageName] <string>] [[-PUID] <string>] [[-PGID] <string>] [[-TimeZone] <string>] [-ShowWindow] [-NoBorders] [-Width <int>] [-Height <int>] [-Left] [-Right] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-SideBySide] [-FocusWindow] [-SetForeground] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <int>] [-SessionOnly] [-ClearSession] [-SkipSession] [-Force] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FocusWindow  
        Focus the window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Force  
        Force rebuild of Docker container and remove existing data  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ForceRebuild  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Fullscreen  
        Maximize the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Height <int>  
        The initial height of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBorders  
        Removes the borders of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RestoreFocus  
        Restore PowerShell window focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetForeground  
        Set the window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ShowWindow  
        Show Docker Desktop window during initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SideBySide  
        Will either set the window fullscreen on a different monitor than Powershell, or side by side with Powershell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    8  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Width <int>  
        The initial width of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-WireGuardPeers 
```PowerShell 

   Get-WireGuardPeers  
``` 

### SYNTAX 
```PowerShell 
Get-WireGuardPeers [[-ContainerName] <string>]
    [[-VolumeName] <string>] [[-ServicePort] <int>]
    [[-HealthCheckTimeout] <int>] [[-HealthCheckInterval]
    <int>] [[-ImageName] <string>] [[-PUID] <string>]
    [[-PGID] <string>] [[-TimeZone] <string>] [[-Width]
    <int>] [[-Height] <int>] [[-Left] <int>] [[-Right]
    <int>] [[-Bottom] <int>] [[-SendKeyDelayMilliSeconds]
    <int>] [-NoDockerInitialize] [-Force] [-ShowWindow]
    [-NoBorders] [-Centered] [-Fullscreen] [-RestoreFocus]
    [-SideBySide] [-FocusWindow] [-SetForeground]
    [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-SessionOnly] [-ClearSession]
    [-SkipSession] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Bottom <int>  
        Set the bottom position of the Docker window  
        Required?                    false  
        Position?                    13  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Centered  
        Center the Docker window on the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear session for Docker window before running  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FocusWindow  
        Focus the Docker window after launching  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Force  
        Force rebuild of Docker container and remove existing data  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ForceRebuild  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Fullscreen  
        Run the Docker window in fullscreen mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Height <int>  
        Set the height of the Docker window  
        Required?                    false  
        Position?                    10  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Left <int>  
        Set the left position of the Docker window  
        Required?                    false  
        Position?                    11  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBorders  
        Remove window borders for the Docker window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoDockerInitialize  
        Skip Docker initialization (used when already called by parent function)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RestoreFocus  
        Restore focus to the previous window after running Docker  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Right <int>  
        Set the right position of the Docker window  
        Required?                    false  
        Position?                    12  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyDelayMilliSeconds <int>  
        Delay in milliseconds between sending keys to Docker window  
        Required?                    false  
        Position?                    14  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyEscape  
        Send Escape key to the Docker window after launch  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus in the Docker window after launch  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyUseShiftEnter  
        Use Shift+Enter when sending keys to Docker window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use session only for Docker window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetForeground  
        Set the Docker window as foreground window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ShowWindow  
        Show the Docker window when running WireGuard  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SideBySide  
        Show Docker window side by side with other windows  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Skip session for Docker window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    8  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Width <int>  
        Set the width of the Docker window  
        Required?                    false  
        Position?                    9  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-WireGuardStatus 
```PowerShell 

   Get-WireGuardStatus  
``` 

### SYNTAX 
```PowerShell 
Get-WireGuardStatus [[-ContainerName] <string>]
    [[-VolumeName] <string>] [[-ServicePort] <int>]
    [[-HealthCheckTimeout] <int>] [[-HealthCheckInterval]
    <int>] [[-ImageName] <string>] [[-PUID] <string>]
    [[-PGID] <string>] [[-TimeZone] <string>] [[-Width]
    <int>] [[-Height] <int>] [[-Left] <int>] [[-Right]
    <int>] [[-Bottom] <int>] [[-SendKeyDelayMilliSeconds]
    <int>] [-NoDockerInitialize] [-Force] [-ShowWindow]
    [-NoBorders] [-Centered] [-Fullscreen] [-RestoreFocus]
    [-SideBySide] [-FocusWindow] [-SetForeground]
    [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-SessionOnly] [-ClearSession]
    [-SkipSession] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Bottom <int>  
        Window bottom position (pass-through)  
        Required?                    false  
        Position?                    13  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Centered  
        Center the window (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear session data (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FocusWindow  
        Focus the window after opening (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Force  
        Force rebuild of Docker container and remove existing data  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ForceRebuild  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Fullscreen  
        Open window in fullscreen mode (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Height <int>  
        Window height in characters or pixels (pass-through)  
        Required?                    false  
        Position?                    10  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Left <int>  
        Window left position (pass-through)  
        Required?                    false  
        Position?                    11  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBorders  
        Remove window borders (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoDockerInitialize  
        Skip Docker initialization (used when already called by parent function)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RestoreFocus  
        Restore focus to window after operation (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Right <int>  
        Window right position (pass-through)  
        Required?                    false  
        Position?                    12  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyDelayMilliSeconds <int>  
        Delay in milliseconds between sending keys (pass-through)  
        Required?                    false  
        Position?                    14  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyEscape  
        Send Escape key to window (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus when sending keys (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyUseShiftEnter  
        Use Shift+Enter when sending keys (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Session only mode (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetForeground  
        Set window to foreground (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ShowWindow  
        Show the window when running the container (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SideBySide  
        Show side-by-side window (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Skip session initialization (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    8  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Width <int>  
        Window width in characters or pixels (pass-through)  
        Required?                    false  
        Position?                    9  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Remove-WireGuardPeer 
```PowerShell 

   Remove-WireGuardPeer  
``` 

### SYNTAX 
```PowerShell 
Remove-WireGuardPeer [-PeerName] <string> [-ContainerName
    <string>] [-VolumeName <string>] [-ServicePort <int>]
    [-HealthCheckTimeout <int>] [-HealthCheckInterval <int>]
    [-ImageName <string>] [-PUID <string>] [-PGID <string>]
    [-TimeZone <string>] [-Force] [-NoDockerInitialize]
    [-ShowWindow] [-NoBorders] [-Width <int>] [-Height
    <int>] [-Left] [-Right] [-Bottom] [-Centered]
    [-Fullscreen] [-RestoreFocus] [-SideBySide]
    [-FocusWindow] [-SetForeground] [-SendKeyEscape]
    [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter]
    [-SendKeyDelayMilliSeconds <int>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FocusWindow  
        Focus the window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Force  
        Force removal without confirmation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ForceRebuild  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Fullscreen  
        Maximize the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Height <int>  
        The initial height of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBorders  
        Removes the borders of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoDockerInitialize  
        Skip Docker initialization when called by parent function  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PeerName <string>  
        The name of the peer to remove  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RestoreFocus  
        Restore PowerShell window focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetForeground  
        Set the window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ShowWindow  
        Show Docker Desktop window during initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SideBySide  
        Will either set the window fullscreen on a different monitor than Powershell, or side by side with Powershell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Width <int>  
        The initial width of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Reset-WireGuardConfiguration 
```PowerShell 

   Reset-WireGuardConfiguration  
``` 

### SYNTAX 
```PowerShell 
Reset-WireGuardConfiguration [[-ContainerName] <string>]
    [[-VolumeName] <string>] [[-ServicePort] <int>]
    [[-HealthCheckTimeout] <int>] [[-HealthCheckInterval]
    <int>] [[-ImageName] <string>] [[-PUID] <string>]
    [[-PGID] <string>] [[-TimeZone] <string>]
    [-NoDockerInitialize] [-Force] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Force  
        Force reset without confirmation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoDockerInitialize  
        Skip Docker initialization (used when already called by parent function)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    8  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Windows<hr/> 

##	Get-ActiveUser 
```PowerShell 

   Get-ActiveUser                       --> gusers  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-ChildProcesses 
```PowerShell 

   Get-ChildProcesses  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-ClipboardFiles 
```PowerShell 

   Get-ClipboardFiles                   --> getclipfiles  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-CurrentFocusedProcess 
```PowerShell 

   Get-CurrentFocusedProcess  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-DesktopScalingFactor 
```PowerShell 

   Get-DesktopScalingFactor  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-ForegroundWindow 
```PowerShell 

   Get-ForegroundWindow  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-MonitorCount 
```PowerShell 

   Get-MonitorCount  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-MpCmdRunPath 
```PowerShell 

   Get-MpCmdRunPath  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-OpenedFileHandleProcesses 
```PowerShell 

   Get-OpenedFileHandleProcesses  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-PowershellMainWindow 
```PowerShell 

   Get-PowershellMainWindow  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-PowershellMainWindowProcess 
```PowerShell 

   Get-PowershellMainWindowProcess  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-Window 
```PowerShell 

   Get-Window  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Save-DesktopScreenShot 
```PowerShell 

   Save-DesktopScreenShot  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-ForegroundWindow 
```PowerShell 

   Set-ForegroundWindow  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-TaskbarAlignment 
```PowerShell 

   Set-TaskbarAlignment  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-WindowsWallpaper 
```PowerShell 

   Set-WindowsWallpaper  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Start-ProcessWithPriority 
```PowerShell 

   Start-ProcessWithPriority            --> nice  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Test-PathUsingWindowsDefender 
```PowerShell 

   Test-PathUsingWindowsDefender        --> HasNoVirus, virusscan  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Windows.WireGuard<hr/> 

##	Get-WireGuardPeerQRCode 
```PowerShell 

   Get-WireGuardPeerQRCode  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Windows<hr/> 

##	CurrentUserHasElevatedRights 
```PowerShell 

   CurrentUserHasElevatedRights  
``` 

### SYNTAX 
```PowerShell 
CurrentUserHasElevatedRights [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	EnsureDockerDesktop 
```PowerShell 

   EnsureDockerDesktop  
``` 

### SYNTAX 
```PowerShell 
EnsureDockerDesktop [[-Monitor] <int>] [[-Width] <int>] [[-Height] <int>] [[-X] <int>] [[-Y] <int>] [[-KeysToSend] <string[]>] [[-SendKeyDelayMilliSeconds] <int>] [-ShowWindow] [-NoBorders] [-Force] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-SideBySide] [-FocusWindow] [-SetForeground] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SessionOnly] [-ClearSession] [-SkipSession] [-NoDockerInitialization] [-WhatIf] [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FocusWindow  
        Focus the window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Force  
        Forces a docker desktop restart  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Fullscreen  
        Maximize the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Height <int>  
        The initial height of the window  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        Keystrokes to send to the Window, see documentation for cmdlet GenXdev.Windows\Send-Key  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Monitor <int>  
        The monitor to use, 0 = default, -1 is discard  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBorders  
        Removes the borders of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoDockerInitialization  
        Skip Docker initialization and return immediately  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RestoreFocus  
        Restore PowerShell window focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetForeground  
        Set the window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ShowWindow  
        Show Docker Desktop window during initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SideBySide  
        Will either set the window fullscreen on a different monitor than Powershell, or side by side with Powershell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Top  
        Place window on the top side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Width <int>  
        The initial width of the window  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -X <int>  
        The initial X position of the window  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Y <int>  
        The initial Y position of the window  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	EnsurePSTools 
```PowerShell 

   EnsurePSTools  
``` 

### SYNTAX 
```PowerShell 
EnsurePSTools [[-PSExeName] <string>] [-Force] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Force  
        Force reinstallation of Sysinternals tools  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PSExeName <string>  
        The executable name to verify installation  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-KnownFolderPath 
```PowerShell 

   Get-KnownFolderPath                  --> folder  
``` 

### SYNTAX 
```PowerShell 
Get-KnownFolderPath [-KnownFolder] {3DObjects |
    AddNewPrograms | AdminTools | AppUpdates | CDBurning |
    ChangeRemovePrograms | CommonAdminTools | CommonOEMLinks
    | CommonPrograms | CommonStartMenu | CommonStartup |
    CommonTemplates | ComputerFolder | ConflictFolder |
    ConnectionsFolder | Contacts | ControlPanelFolder |
    Cookies | Desktop | Documents | Downloads | Favorites |
    Fonts | Games | GameTasks | History | InternetCache |
    InternetFolder | Links | LocalAppData | LocalAppDataLow
    | LocalizedResourcesDir | Music | NetHood |
    NetworkFolder | OriginalImages | PhotoAlbums | Pictures
    | Playlists | PrintersFolder | PrintHood | Profile |
    ProgramData | ProgramFiles | ProgramFilesX64 |
    ProgramFilesX86 | ProgramFilesCommon |
    ProgramFilesCommonX64 | ProgramFilesCommonX86 | Programs
    | Public | PublicDesktop | PublicDocuments |
    PublicDownloads | PublicGameTasks | PublicMusic |
    PublicPictures | PublicVideos | QuickLaunch | Recent |
    RecycleBinFolder | ResourceDir | RoamingAppData |
    SampleMusic | SamplePictures | SamplePlaylists |
    SampleVideos | SavedGames | SavedSearches | SEARCH_CSC |
    SEARCH_MAPI | SearchHome | SendTo | SidebarDefaultParts
    | SidebarParts | StartMenu | Startup | SyncManagerFolder
    | SyncResultsFolder | SyncSetupFolder | System |
    SystemX86 | Templates | TreeProperties | UserProfiles |
    UsersFiles | Videos | Windows} [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -KnownFolder <string>  
        The Windows known folder name to get the path for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-WindowPosition 
```PowerShell 

   Get-WindowPosition                   --> gwp  
``` 

### SYNTAX 
```PowerShell 
Get-WindowPosition [<CommonParameters>]
Get-WindowPosition [[-ProcessName] <string>]
    [<CommonParameters>]
Get-WindowPosition [-Process <Process>] [<CommonParameters>]
Get-WindowPosition [-WindowHelper <WindowObj[]>]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Process <Process>  
        The process of the window to get position for  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           Process  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ProcessName <string>  
        The process name of the window to get position for  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           ProcessName  
        Aliases                      Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -WindowHelper <WindowObj[]>  
        Get-Window helper object for direct window manipulation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           WindowHelper  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Initialize-ScheduledTaskScripts 
```PowerShell 

   Initialize-ScheduledTaskScripts  
``` 

### SYNTAX 
```PowerShell 
Initialize-ScheduledTaskScripts [[-FilePath] <string>]
    [[-Prefix] <string>] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilePath <string>  
        The directory path where task scripts will be created  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prefix <string>  
        Prefix for the scheduled task names  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Invoke-WindowsUpdate 
```PowerShell 

   Invoke-WindowsUpdate                 --> updatewindows  
``` 

### SYNTAX 
```PowerShell 
Invoke-WindowsUpdate [[-Criteria] <string>] [-Install]
    [-AutoReboot] [-IncludeDrivers] [-GroupByCategory]
    [-NoBanner] [-NoRebootCheck] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -AutoReboot  
        Automatically reboot if updates require a restart  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Criteria <string>  
        Custom Windows Update search criteria  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -GroupByCategory  
        Group and color output by update category  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -IncludeDrivers  
        Include drivers in update search  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Install  
        Automatically install available Windows updates  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBanner  
        Disable banner/status output  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoRebootCheck  
        Skip reboot requirement check/reporting  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Pop-Window 
```PowerShell 

   Pop-Window                           --> popw  
``` 

### SYNTAX 
```PowerShell 
Pop-Window [-Maximize] [-Minimize] [-Restore] [-Hide]
    [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <byte>]
    [-Focus] [-FadeIn] [-Left] [-Right] [-Top] [-Bottom]
    [-Centered] [-ShowWindow] [-Monitor <int>]
    [<CommonParameters>]
Pop-Window -Width <int> -Height <int> [-Maximize]
    [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders]
    [-AlwaysOnTop] [-Opacity <byte>] [-Focus] [-FadeIn]
    [-Left] [-Right] [-Top] [-Bottom] [-Centered]
    [-ShowWindow] [-Monitor <int>] [<CommonParameters>]
Pop-Window -X <int> -Y <int> [-Maximize] [-Minimize]
    [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop]
    [-Opacity <byte>] [-Focus] [-FadeIn] [-Left] [-Right]
    [-Top] [-Bottom] [-Centered] [-ShowWindow] [-Monitor
    <int>] [<CommonParameters>]
Pop-Window [-NoModify] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -AlwaysOnTop  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Bottom  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Centered  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FadeIn  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Height <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Hide  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Left  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Maximize  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Minimize  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Monitor <int>  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBorders  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoModify  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           NoModify  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Opacity <byte>  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Restore  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Right  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ShowWindow  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      sw  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Top  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Width <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -X <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Position  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Y <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Position  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Push-Window 
```PowerShell 

   Push-Window                          --> pushw  
``` 

### SYNTAX 
```PowerShell 
Push-Window [-Maximize] [-Minimize] [-Restore] [-Hide]
    [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <byte>]
    [-Focus] [-FadeOut] [-PassThru] [-Left] [-Right] [-Top]
    [-Bottom] [-Centered] [-ShowWindow] [-Monitor <int>]
    [<CommonParameters>]
Push-Window -Width <int> -Height <int> [-Maximize]
    [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders]
    [-AlwaysOnTop] [-Opacity <byte>] [-Focus] [-FadeOut]
    [-PassThru] [-Left] [-Right] [-Top] [-Bottom]
    [-Centered] [-ShowWindow] [-Monitor <int>]
    [<CommonParameters>]
Push-Window -X <int> -Y <int> [-Maximize] [-Minimize]
    [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop]
    [-Opacity <byte>] [-Focus] [-FadeOut] [-PassThru]
    [-Left] [-Right] [-Top] [-Bottom] [-Centered]
    [-ShowWindow] [-Monitor <int>] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -AlwaysOnTop  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Bottom  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Centered  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FadeOut  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Height <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Hide  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Left  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Maximize  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Minimize  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Monitor <int>  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBorders  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Opacity <byte>  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PassThru  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Restore  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Right  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ShowWindow  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      sw  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Top  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Width <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -X <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Position  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Y <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Position  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Send-Key 
```PowerShell 

   Send-Key                             --> invokekeys, sendkeys  
``` 

### SYNTAX 
```PowerShell 
Send-Key [-KeysToSend] <string[]> [-ProcessName <string>]
    [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds
    <int>] [<CommonParameters>]
Send-Key [-KeysToSend] <string[]> [-ProcessId <int>]
    [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds
    <int>] [<CommonParameters>]
Send-Key [-KeysToSend] <string[]> [-WindowHandle <long>]
    [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds
    <int>] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -KeysToSend <string[]>  
        The keyboard input to send as an array of strings  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ProcessId <int>  
        ID of the process to send keys to  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           ByProcessId  
        Aliases                      Id, PID  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ProcessName <string>  
        Name of the process to send keys to (supports wildcards)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           ByProcessName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyEscape  
        Escape control characters and modifiers in input text  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window after sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter for newlines  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WindowHandle <long>  
        Window handle to send keys to  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           ByWindowHandle  
        Aliases                      Handle, hWnd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Set-ClipboardFiles 
```PowerShell 

   Set-ClipboardFiles                   --> setclipfiles  
``` 

### SYNOPSIS 
    Sets files to the Windows clipboard for file operations like copy/paste.  

### SYNTAX 
```PowerShell 
Set-ClipboardFiles [-InputObject] <String[]> [-WhatIf]
    [-Confirm] [<CommonParameters>] 
``` 

### DESCRIPTION 
    This function copies one or more file paths to the Windows clipboard,  
    enabling file operations like paste in Windows Explorer. It handles both  
    STA and MTA threading modes automatically, ensuring compatibility across  
    different PowerShell execution contexts. The function validates file  
    existence before adding paths to the clipboard.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -InputObject <String[]>  
        Array of file paths to add to the clipboard. Accepts pipeline input and  
        supports various aliases for compatibility with different object properties.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Set-KnownFolderPath 
```PowerShell 

   Set-KnownFolderPath  
``` 

### SYNOPSIS 
    Modifies the physical path of a Windows known folder.  

### SYNTAX 
```PowerShell 
Set-KnownFolderPath [-KnownFolder] <String> [-Path] <String>
    [-WhatIf] [-Confirm] [<CommonParameters>] 
``` 

### DESCRIPTION 
    Uses the Windows Shell32 API to relocate system folders like Documents,  
    Downloads, Desktop, or other known Windows folders to a new location. The  
    function validates the target path exists, looks up the folder's unique GUID  
    from the comprehensive known folders registry, and uses the SHSetKnownFolderPath  
    API to perform the relocation. Common use cases include moving user folders to  
    a different drive for space management or organization. Exercise caution when  
    moving system-critical folders as this may affect system stability.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -KnownFolder <String>  
        The name of the known folder to relocate. Supports all Windows known folders  
        including user folders (Documents, Downloads, Desktop, Pictures, Videos,  
        Music), system folders (Windows, System, ProgramFiles), and special folders  
        (Recent, Favorites, SendTo, etc.). Use with caution as moving certain system  
        folders may cause instability.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -Path <String>  
        The new physical file system path where the known folder should be located.  
        The path must exist before attempting the move operation. The function will  
        throw an error if the path is invalid or inaccessible.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Set-WindowPosition 
```PowerShell 

   Set-WindowPosition                   --> wp  
``` 

### SYNTAX 
```PowerShell 
Set-WindowPosition [-Monitor <int>] [-NoBorders] [-Width
    <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left]
    [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen]
    [-RestoreFocus] [-PassThru] [-SideBySide] [-FocusWindow]
    [-SetForeground] [-Minimize] [-Maximize] [-SetRestored]
    [-KeysToSend <string[]>] [-SendKeyEscape]
    [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter]
    [-SendKeyDelayMilliSeconds <int>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-OnlyOutputCoords]
    [-WhatIf] [-Confirm] [<CommonParameters>]
Set-WindowPosition [[-ProcessName] <string>] [-Monitor
    <int>] [-NoBorders] [-Width <int>] [-Height <int>] [-X
    <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom]
    [-Centered] [-Fullscreen] [-RestoreFocus] [-PassThru]
    [-SideBySide] [-FocusWindow] [-SetForeground]
    [-Minimize] [-Maximize] [-SetRestored] [-KeysToSend
    <string[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds
    <int>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [-OnlyOutputCoords] [-WhatIf] [-Confirm]
    [<CommonParameters>]
Set-WindowPosition [-Process <Process>] [-Monitor <int>]
    [-NoBorders] [-Width <int>] [-Height <int>] [-X <int>]
    [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered]
    [-Fullscreen] [-RestoreFocus] [-PassThru] [-SideBySide]
    [-FocusWindow] [-SetForeground] [-Minimize] [-Maximize]
    [-SetRestored] [-KeysToSend <string[]>] [-SendKeyEscape]
    [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter]
    [-SendKeyDelayMilliSeconds <int>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-OnlyOutputCoords]
    [-WhatIf] [-Confirm] [<CommonParameters>]
Set-WindowPosition [-WindowHelper <WindowObj[]>] [-Monitor
    <int>] [-NoBorders] [-Width <int>] [-Height <int>] [-X
    <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom]
    [-Centered] [-Fullscreen] [-RestoreFocus] [-PassThru]
    [-SideBySide] [-FocusWindow] [-SetForeground]
    [-Minimize] [-Maximize] [-SetRestored] [-KeysToSend
    <string[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds
    <int>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [-OnlyOutputCoords] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FocusWindow  
        Focus the window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Fullscreen  
        Maximize the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Height <int>  
        Window height in pixels  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        Keystrokes to send to the Window, see documentation for cmdlet GenXdev.Windows\Send-Key  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Maximize  
        Maximize the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Minimize  
        Minimizes the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Monitor <int>  
        Monitor selection: 0=primary, 1+=specific monitor, -1=current, -2=secondary  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBorders  
        Removes the borders of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OnlyOutputCoords  
        Only output the calculated coordinates and size without actually positioning the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PassThru  
        Returns the window helper for each process  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Process <Process>  
        The process of the window to position  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           Process  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ProcessName <string>  
        The process name of the window to position  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           ProcessName  
        Aliases                      Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -RestoreFocus  
        Restore PowerShell window focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetForeground  
        Set the window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetRestored  
        Restore the window to normal state after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SideBySide  
        Will either set the window fullscreen on a different monitor than Powershell, or side by side with Powershell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Top  
        Place window on the top side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Width <int>  
        Window width in pixels  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WindowHelper <WindowObj[]>  
        Get-Window helper object for direct window manipulation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           WindowHelper  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -X <int>  
        Window horizontal position in pixels  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Y <int>  
        Window vertical position in pixels  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Set-WindowPositionForSecondary 
```PowerShell 

   Set-WindowPositionForSecondary       --> wps  
``` 

### SYNTAX 
```PowerShell 
Set-WindowPositionForSecondary [[-Process] <Process[]>]
    [-Monitor <int>] [-Width <int>] [-Height <int>] [-X
    <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom]
    [-Centered] [-FullScreen] [-NoBorders] [-RestoreFocus]
    [-FocusWindow] [-SetForeground] [-Maximize]
    [-SetRestored] [-KeysToSend <string[]>] [-SendKeyEscape]
    [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter]
    [-SendKeyDelayMilliSeconds <int>] [-PassThru]
    [-SideBySide] [-SessionOnly] [-ClearSession]
    [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FocusWindow  
        Focus the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FullScreen  
        Sends F11 to the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Height <int>  
        The initial height of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        Keystrokes to send to the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Maximize  
        Maximize the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Monitor <int>  
        The monitor to use, 0=default, -1=discard, -2=configured  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBorders  
        Removes the borders of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PassThru  
        Returns the process object after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Process <Process[]>  
        The process of the window to position  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RestoreFocus  
        Restore PowerShell window focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetForeground  
        Set the window to foreground after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetRestored  
        Restore the window to normal state after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SideBySide  
        Place window side by side with PowerShell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Top  
        Place window on the top side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Width <int>  
        The initial width of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -X <int>  
        The initial X position of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Y <int>  
        The initial Y position of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-ActiveUser 
```PowerShell 

   Get-ActiveUser                       --> gusers  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-ChildProcesses 
```PowerShell 

   Get-ChildProcesses  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-ClipboardFiles 
```PowerShell 

   Get-ClipboardFiles                   --> getclipfiles  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-CurrentFocusedProcess 
```PowerShell 

   Get-CurrentFocusedProcess  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-DesktopScalingFactor 
```PowerShell 

   Get-DesktopScalingFactor  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-ForegroundWindow 
```PowerShell 

   Get-ForegroundWindow  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-MonitorCount 
```PowerShell 

   Get-MonitorCount  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-MpCmdRunPath 
```PowerShell 

   Get-MpCmdRunPath  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-OpenedFileHandleProcesses 
```PowerShell 

   Get-OpenedFileHandleProcesses  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-PowershellMainWindow 
```PowerShell 

   Get-PowershellMainWindow  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-PowershellMainWindowProcess 
```PowerShell 

   Get-PowershellMainWindowProcess  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Get-Window 
```PowerShell 

   Get-Window  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Save-DesktopScreenShot 
```PowerShell 

   Save-DesktopScreenShot  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-ForegroundWindow 
```PowerShell 

   Set-ForegroundWindow  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-TaskbarAlignment 
```PowerShell 

   Set-TaskbarAlignment  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Set-WindowsWallpaper 
```PowerShell 

   Set-WindowsWallpaper  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Start-ProcessWithPriority 
```PowerShell 

   Start-ProcessWithPriority            --> nice  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

##	Test-PathUsingWindowsDefender 
```PowerShell 

   Test-PathUsingWindowsDefender        --> HasNoVirus, virusscan  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Windows.WireGuard<hr/> 

##	Add-WireGuardPeer 
```PowerShell 

   Add-WireGuardPeer  
``` 

### SYNTAX 
```PowerShell 
Add-WireGuardPeer [-PeerName] <string> [[-AllowedIPs]
    <string>] [[-DNS] <string>] [[-OutputPath] <string>]
    [[-ContainerName] <string>] [[-VolumeName] <string>]
    [[-ServicePort] <int>] [[-HealthCheckTimeout] <int>]
    [[-HealthCheckInterval] <int>] [[-ImageName] <string>]
    [[-PUID] <string>] [[-PGID] <string>] [[-TimeZone]
    <string>] [-SaveConfig] [-ShowWindow] [-NoBorders]
    [-Width <int>] [-Height <int>] [-Left <int>] [-Right
    <int>] [-Bottom <int>] [-Centered] [-Fullscreen]
    [-RestoreFocus] [-SideBySide] [-FocusWindow]
    [-SetForeground] [-SendKeyEscape]
    [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter]
    [-SendKeyDelayMilliSeconds <int>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-ShowQRCode]
    [-NoDockerInitialize] [-Force] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -AllowedIPs <string>  
        The IP ranges that will be routed through the VPN  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Bottom <int>  
        Set the window bottom position when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Centered  
        Center the window when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear session when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -DNS <string>  
        DNS servers to use for this peer  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FocusWindow  
        Focus the window after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Force  
        Force rebuild of Docker container and remove existing data  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ForceRebuild  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Fullscreen  
        Start the service in fullscreen mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    8  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Height <int>  
        Set the window height when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    9  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Left <int>  
        Set the window left position when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBorders  
        Remove window borders when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoDockerInitialize  
        Skip Docker initialization (used when already called by parent function)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OutputPath <string>  
        The path where the peer configuration file should be saved  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      outfile, OutputFile  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    11  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    10  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PeerName <string>  
        A unique name for the peer  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RestoreFocus  
        Restore focus to the window after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Right <int>  
        Set the window right position when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SaveConfig  
        Save the peer configuration to a file  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyDelayMilliSeconds <int>  
        Delay in milliseconds when sending keys after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyEscape  
        Send Escape key to the window after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus when sending keys after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyUseShiftEnter  
        Use Shift+Enter when sending keys after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use session only for the WireGuard service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetForeground  
        Set the window to foreground after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ShowQRCode  
        Generate QR code for easy mobile setup  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ShowWindow  
        Show the WireGuard window when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SideBySide  
        Show the window side by side when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Skip session when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    12  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Width <int>  
        Set the window width when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	EnsureWireGuard 
```PowerShell 

   EnsureWireGuard  
``` 

### SYNTAX 
```PowerShell 
EnsureWireGuard [[-ContainerName] <string>] [[-VolumeName] <string>] [[-ServicePort] <int>] [[-HealthCheckTimeout] <int>] [[-HealthCheckInterval] <int>] [[-ImageName] <string>] [[-PUID] <string>] [[-PGID] <string>] [[-TimeZone] <string>] [-ShowWindow] [-NoBorders] [-Width <int>] [-Height <int>] [-Left] [-Right] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-SideBySide] [-FocusWindow] [-SetForeground] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <int>] [-SessionOnly] [-ClearSession] [-SkipSession] [-Force] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FocusWindow  
        Focus the window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Force  
        Force rebuild of Docker container and remove existing data  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ForceRebuild  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Fullscreen  
        Maximize the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Height <int>  
        The initial height of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBorders  
        Removes the borders of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RestoreFocus  
        Restore PowerShell window focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetForeground  
        Set the window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ShowWindow  
        Show Docker Desktop window during initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SideBySide  
        Will either set the window fullscreen on a different monitor than Powershell, or side by side with Powershell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    8  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Width <int>  
        The initial width of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-WireGuardPeers 
```PowerShell 

   Get-WireGuardPeers  
``` 

### SYNTAX 
```PowerShell 
Get-WireGuardPeers [[-ContainerName] <string>]
    [[-VolumeName] <string>] [[-ServicePort] <int>]
    [[-HealthCheckTimeout] <int>] [[-HealthCheckInterval]
    <int>] [[-ImageName] <string>] [[-PUID] <string>]
    [[-PGID] <string>] [[-TimeZone] <string>] [[-Width]
    <int>] [[-Height] <int>] [[-Left] <int>] [[-Right]
    <int>] [[-Bottom] <int>] [[-SendKeyDelayMilliSeconds]
    <int>] [-NoDockerInitialize] [-Force] [-ShowWindow]
    [-NoBorders] [-Centered] [-Fullscreen] [-RestoreFocus]
    [-SideBySide] [-FocusWindow] [-SetForeground]
    [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-SessionOnly] [-ClearSession]
    [-SkipSession] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Bottom <int>  
        Set the bottom position of the Docker window  
        Required?                    false  
        Position?                    13  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Centered  
        Center the Docker window on the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear session for Docker window before running  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FocusWindow  
        Focus the Docker window after launching  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Force  
        Force rebuild of Docker container and remove existing data  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ForceRebuild  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Fullscreen  
        Run the Docker window in fullscreen mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Height <int>  
        Set the height of the Docker window  
        Required?                    false  
        Position?                    10  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Left <int>  
        Set the left position of the Docker window  
        Required?                    false  
        Position?                    11  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBorders  
        Remove window borders for the Docker window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoDockerInitialize  
        Skip Docker initialization (used when already called by parent function)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RestoreFocus  
        Restore focus to the previous window after running Docker  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Right <int>  
        Set the right position of the Docker window  
        Required?                    false  
        Position?                    12  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyDelayMilliSeconds <int>  
        Delay in milliseconds between sending keys to Docker window  
        Required?                    false  
        Position?                    14  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyEscape  
        Send Escape key to the Docker window after launch  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus in the Docker window after launch  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyUseShiftEnter  
        Use Shift+Enter when sending keys to Docker window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use session only for Docker window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetForeground  
        Set the Docker window as foreground window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ShowWindow  
        Show the Docker window when running WireGuard  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SideBySide  
        Show Docker window side by side with other windows  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Skip session for Docker window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    8  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Width <int>  
        Set the width of the Docker window  
        Required?                    false  
        Position?                    9  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-WireGuardStatus 
```PowerShell 

   Get-WireGuardStatus  
``` 

### SYNTAX 
```PowerShell 
Get-WireGuardStatus [[-ContainerName] <string>]
    [[-VolumeName] <string>] [[-ServicePort] <int>]
    [[-HealthCheckTimeout] <int>] [[-HealthCheckInterval]
    <int>] [[-ImageName] <string>] [[-PUID] <string>]
    [[-PGID] <string>] [[-TimeZone] <string>] [[-Width]
    <int>] [[-Height] <int>] [[-Left] <int>] [[-Right]
    <int>] [[-Bottom] <int>] [[-SendKeyDelayMilliSeconds]
    <int>] [-NoDockerInitialize] [-Force] [-ShowWindow]
    [-NoBorders] [-Centered] [-Fullscreen] [-RestoreFocus]
    [-SideBySide] [-FocusWindow] [-SetForeground]
    [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-SessionOnly] [-ClearSession]
    [-SkipSession] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Bottom <int>  
        Window bottom position (pass-through)  
        Required?                    false  
        Position?                    13  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Centered  
        Center the window (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear session data (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FocusWindow  
        Focus the window after opening (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Force  
        Force rebuild of Docker container and remove existing data  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ForceRebuild  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Fullscreen  
        Open window in fullscreen mode (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Height <int>  
        Window height in characters or pixels (pass-through)  
        Required?                    false  
        Position?                    10  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Left <int>  
        Window left position (pass-through)  
        Required?                    false  
        Position?                    11  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBorders  
        Remove window borders (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoDockerInitialize  
        Skip Docker initialization (used when already called by parent function)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RestoreFocus  
        Restore focus to window after operation (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Right <int>  
        Window right position (pass-through)  
        Required?                    false  
        Position?                    12  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyDelayMilliSeconds <int>  
        Delay in milliseconds between sending keys (pass-through)  
        Required?                    false  
        Position?                    14  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyEscape  
        Send Escape key to window (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus when sending keys (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyUseShiftEnter  
        Use Shift+Enter when sending keys (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Session only mode (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetForeground  
        Set window to foreground (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ShowWindow  
        Show the window when running the container (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SideBySide  
        Show side-by-side window (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Skip session initialization (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    8  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Width <int>  
        Window width in characters or pixels (pass-through)  
        Required?                    false  
        Position?                    9  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Remove-WireGuardPeer 
```PowerShell 

   Remove-WireGuardPeer  
``` 

### SYNTAX 
```PowerShell 
Remove-WireGuardPeer [-PeerName] <string> [-ContainerName
    <string>] [-VolumeName <string>] [-ServicePort <int>]
    [-HealthCheckTimeout <int>] [-HealthCheckInterval <int>]
    [-ImageName <string>] [-PUID <string>] [-PGID <string>]
    [-TimeZone <string>] [-Force] [-NoDockerInitialize]
    [-ShowWindow] [-NoBorders] [-Width <int>] [-Height
    <int>] [-Left] [-Right] [-Bottom] [-Centered]
    [-Fullscreen] [-RestoreFocus] [-SideBySide]
    [-FocusWindow] [-SetForeground] [-SendKeyEscape]
    [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter]
    [-SendKeyDelayMilliSeconds <int>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FocusWindow  
        Focus the window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Force  
        Force removal without confirmation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ForceRebuild  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Fullscreen  
        Maximize the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Height <int>  
        The initial height of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBorders  
        Removes the borders of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoDockerInitialize  
        Skip Docker initialization when called by parent function  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PeerName <string>  
        The name of the peer to remove  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RestoreFocus  
        Restore PowerShell window focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetForeground  
        Set the window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ShowWindow  
        Show Docker Desktop window during initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SideBySide  
        Will either set the window fullscreen on a different monitor than Powershell, or side by side with Powershell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Width <int>  
        The initial width of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Reset-WireGuardConfiguration 
```PowerShell 

   Reset-WireGuardConfiguration  
``` 

### SYNTAX 
```PowerShell 
Reset-WireGuardConfiguration [[-ContainerName] <string>]
    [[-VolumeName] <string>] [[-ServicePort] <int>]
    [[-HealthCheckTimeout] <int>] [[-HealthCheckInterval]
    <int>] [[-ImageName] <string>] [[-PUID] <string>]
    [[-PGID] <string>] [[-TimeZone] <string>]
    [-NoDockerInitialize] [-Force] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Force  
        Force reset without confirmation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoDockerInitialize  
        Skip Docker initialization (used when already called by parent function)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    8  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-WireGuardPeerQRCode 
```PowerShell 

   Get-WireGuardPeerQRCode  
``` 

### SYNOPSIS 

### SYNTAX 
```PowerShell 
 
``` 

### DESCRIPTION 

### PARAMETERS 
```yaml 
 
``` 

<br/><hr/><br/>
