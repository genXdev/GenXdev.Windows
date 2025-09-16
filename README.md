<hr/>

<img src="powershell.jpg" alt="GenXdev" width="50%"/>

<hr/>

### NAME
    GenXdev.Windows

### SYNOPSIS
    A Windows PowerShell module that provides UI Windows manipulation helpers

[![GenXdev.Windows](https://img.shields.io/powershellgallery/v/GenXdev.Windows.svg?style=flat-square&label=GenXdev.Windows)](https://www.powershellgallery.com/packages/GenXdev.Windows/) [![License](https://img.shields.io/github/license/genXdev/GenXdev.Windows?style=flat-square)](./LICENSE)

## MIT License

````text
MIT License

Copyright (c) 2025 GenXdev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
````

### FEATURES

    * ✅ Allow resizing/repositioning/closing of Windows
    * ✅ Get-Window will return a windows helper that allows you to manipulate the window
    * ✅ Read/write access to Windows special folder locations

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
| [CurrentUserHasElevatedRights](#currentuserhaselevatedrights) | &nbsp; | Checks if the current user has elevated rights. |
| [EnsureDockerDesktop](#ensuredockerdesktop) | &nbsp; | Checks if the WinGet PowerShell module is installed. |
| [EnsurePSTools](#ensurepstools) | &nbsp; | Ensures Sysinternals tools (PSTools) are installed and available. |
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
| [Get-Window](#get-window) | gwin, window | Gets window information for specified processes or window handles. |
| [Initialize-ScheduledTaskScripts](#initialize-scheduledtaskscripts) | &nbsp; | Creates scheduled tasks that run PowerShell scripts at specified intervals. |
| [Invoke-WindowsUpdate](#invoke-windowsupdate) | updatewindows | Checks if Windows is up to date and optionally installs available updates. |
| [Pop-Window](#pop-window) | popw | Pops the last active window helper from the stack with optional modifications. |
| [Push-Window](#push-window) | pushw | Pushes the current window onto the window stack with optional modifications. |
| [Send-Key](#send-key) | invokekeys, sendkeys | Sends simulated keystrokes to a window or process. |
| [Set-ClipboardFiles](#set-clipboardfiles) | setclipfiles | Sets files to the Windows clipboard for file operations like copy/paste. |
| [Set-ForegroundWindow](#set-foregroundwindow) | &nbsp; | Brings the specified window to the foreground and makes it the active window. |
| [Set-KnownFolderPath](#set-knownfolderpath) | &nbsp; | Modifies the physical path of a Windows known folder. |
| [Set-TaskbarAlignment](#set-taskbaralignment) | &nbsp; | Configures Windows 11+ taskbar alignment between center and left positions. |
| [Set-WindowPosition](#set-windowposition) | wp | Positions and resizes windows when explicit positioning parameters are provided. |
| [Set-WindowPositionForSecondary](#set-windowpositionforsecondary) | wps | Positions a window on the secondary monitor with specified layout options. |
| [Set-WindowsWallpaper](#set-windowswallpaper) | setaswallpaper | Sets a random wallpaper from a specified directory. |
| [Start-ProcessWithPriority](#start-processwithpriority) | nice | Starts a process with a specified priority level. |
| [Test-PathUsingWindowsDefender](#test-pathusingwindowsdefender) | HasNoVirus, virusscan | Scans files or directories for malware using Windows Defender. |

### GenXdev.Windows.WireGuard
| Command | Aliases | Description |
| :--- | :--- | :--- |
| [Add-WireGuardPeer](#add-wireguardpeer) | &nbsp; | Adds a new WireGuard VPN peer (client) configuration to the server. |
| [EnsureWireGuard](#ensurewireguard) | &nbsp; | Ensures WireGuard VPN service is installed and running via Docker container. |
| [Get-WireGuardPeerQRCode](#get-wireguardpeerqrcode) | &nbsp; | Generates a QR code for a WireGuard VPN peer configuration. |
| [Get-WireGuardPeers](#get-wireguardpeers) | &nbsp; | Gets information about all WireGuard VPN peers configured on the system. |
| [Get-WireGuardStatus](#get-wireguardstatus) | &nbsp; | Gets detailed status information about the WireGuard VPN server. |
| [Remove-WireGuardPeer](#remove-wireguardpeer) | &nbsp; | Removes a WireGuard VPN peer configuration. |
| [Reset-WireGuardConfiguration](#reset-wireguardconfiguration) | &nbsp; | Resets the WireGuard VPN server configuration, removing all peers. |

<br/><hr/><br/>


# Cmdlets

&nbsp;<hr/>
###	GenXdev.Windows<hr/> 

##	CurrentUserHasElevatedRights 
```PowerShell 

   CurrentUserHasElevatedRights  
```` 

### SYNTAX 
```PowerShell 
CurrentUserHasElevatedRights [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	EnsureDockerDesktop 
```PowerShell 

   EnsureDockerDesktop  
```` 

### SYNTAX 
```PowerShell 
EnsureDockerDesktop [[-Monitor] <int>] [[-Width] <int>] [[-Height] <int>] [[-X] <int>] [[-Y] <int>] [[-KeysToSend] <string[]>] [[-SendKeyDelayMilliSeconds] <int>] [-ShowWindow] [-NoBorders] [-Force] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-SideBySide] [-FocusWindow] [-SetForeground] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SessionOnly] [-ClearSession] [-SkipSession] [-NoDockerInitialization] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Forces a docker desktop restart  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Fullscreen  
        Maximize the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        The initial height of the window  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        Keystrokes to send to the Window, see documentation for cmdlet GenXdev.Windows\Send-Key  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        The monitor to use, 0 = default, -1 is discard  
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
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoDockerInitialization  
        Skip Docker initialization and return immediately  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restore PowerShell window focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ShowWindow  
        Show Docker Desktop window during initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Will either set the window fullscreen on a different monitor than Powershell, or side by side with Powershell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top  
        Place window on the top side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        The initial width of the window  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -X <int>  
        The initial X position of the window  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Y <int>  
        The initial Y position of the window  
        Required?                    false  
        Position?                    4  
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

<br/><hr/><br/>
 

##	EnsurePSTools 
```PowerShell 

   EnsurePSTools  
```` 

### SYNTAX 
```PowerShell 
EnsurePSTools [[-PSExeName] <string>] [-Force] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Force  
        Force reinstallation of Sysinternals tools  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PSExeName <string>  
        The executable name to verify installation  
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

<br/><hr/><br/>
 

##	Get-ActiveUser 
```PowerShell 

   Get-ActiveUser                       --> gusers  
```` 

### SYNTAX 
```PowerShell 
Get-ActiveUser [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-ChildProcesses 
```PowerShell 

   Get-ChildProcesses  
```` 

### SYNTAX 
```PowerShell 
Get-ChildProcesses [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-ClipboardFiles 
```PowerShell 

   Get-ClipboardFiles                   --> getclipfiles  
```` 

### SYNTAX 
```PowerShell 
Get-ClipboardFiles [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-CurrentFocusedProcess 
```PowerShell 

   Get-CurrentFocusedProcess  
```` 

### SYNTAX 
```PowerShell 
Get-CurrentFocusedProcess [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-DesktopScalingFactor 
```PowerShell 

   Get-DesktopScalingFactor  
```` 

### SYNTAX 
```PowerShell 
Get-DesktopScalingFactor [[-Monitor] <int>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Monitor <int>  
        The monitor index to check (0 = primary monitor)  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-ForegroundWindow 
```PowerShell 

   Get-ForegroundWindow  
```` 

### SYNTAX 
```PowerShell 
Get-ForegroundWindow [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-KnownFolderPath 
```PowerShell 

   Get-KnownFolderPath                  --> folder  
```` 

### SYNTAX 
```PowerShell 
Get-KnownFolderPath [-KnownFolder] {3DObjects | AddNewPrograms | AdminTools | AppUpdates | CDBurning | ChangeRemovePrograms | CommonAdminTools | CommonOEMLinks | CommonPrograms | CommonStartMenu | CommonStartup | CommonTemplates | ComputerFolder | ConflictFolder | ConnectionsFolder | Contacts | ControlPanelFolder | Cookies | Desktop | Documents | Downloads | Favorites | Fonts | Games | GameTasks | History | InternetCache | InternetFolder | Links | LocalAppData | LocalAppDataLow | LocalizedResourcesDir | Music | NetHood | NetworkFolder | OriginalImages | PhotoAlbums | Pictures | Playlists | PrintersFolder | PrintHood | Profile | ProgramData | ProgramFiles | ProgramFilesX64 | ProgramFilesX86 | ProgramFilesCommon | ProgramFilesCommonX64 | ProgramFilesCommonX86 | Programs | Public | PublicDesktop | PublicDocuments | PublicDownloads | PublicGameTasks | PublicMusic | PublicPictures | PublicVideos | QuickLaunch | Recent | RecycleBinFolder | ResourceDir | RoamingAppData | SampleMusic | SamplePictures | SamplePlaylists | SampleVideos | SavedGames | SavedSearches | SEARCH_CSC | SEARCH_MAPI | SearchHome | SendTo | SidebarDefaultParts | SidebarParts | StartMenu | Startup | SyncManagerFolder | SyncResultsFolder | SyncSetupFolder | System | SystemX86 | Templates | TreeProperties | UserProfiles | UsersFiles | Videos | Windows} [<CommonParameters>] 
```` 

### PARAMETERS 
    -KnownFolder <string>  
        The Windows known folder name to get the path for  
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

<br/><hr/><br/>
 

##	Get-MonitorCount 
```PowerShell 

   Get-MonitorCount  
```` 

### SYNTAX 
```PowerShell 
Get-MonitorCount [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-MpCmdRunPath 
```PowerShell 

   Get-MpCmdRunPath  
```` 

### SYNTAX 
```PowerShell 
Get-MpCmdRunPath [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-OpenedFileHandleProcesses 
```PowerShell 

   Get-OpenedFileHandleProcesses  
```` 

### SYNTAX 
```PowerShell 
Get-OpenedFileHandleProcesses [-FilePath] <string[]> [<CommonParameters>] 
```` 

### PARAMETERS 
    -FilePath <string[]>  
        The path to the file(s) to check for open handles  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-PowershellMainWindow 
```PowerShell 

   Get-PowershellMainWindow  
```` 

### SYNTAX 
```PowerShell 
Get-PowershellMainWindow [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-PowershellMainWindowProcess 
```PowerShell 

   Get-PowershellMainWindowProcess  
```` 

### SYNTAX 
```PowerShell 
Get-PowershellMainWindowProcess [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-Window 
```PowerShell 

   Get-Window                           --> gwin, window  
```` 

### SYNTAX 
```PowerShell 
Get-Window [[-ProcessName] <string>] [-ProcessId <int>] [-WindowHandle <long>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ProcessId <int>  
        ID of the process to get window information for  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Id, PID  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ProcessName <string>  
        Name of the process to get window information for  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -WindowHandle <long>  
        Window handle to get information for  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Handle, hWnd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Initialize-ScheduledTaskScripts 
```PowerShell 

   Initialize-ScheduledTaskScripts  
```` 

### SYNTAX 
```PowerShell 
Initialize-ScheduledTaskScripts [[-FilePath] <string>] [[-Prefix] <string>] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FilePath <string>  
        The directory path where task scripts will be created  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prefix <string>  
        Prefix for the scheduled task names  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Invoke-WindowsUpdate 
```PowerShell 

   Invoke-WindowsUpdate                 --> updatewindows  
```` 

### SYNTAX 
```PowerShell 
Invoke-WindowsUpdate [[-Criteria] <string>] [-Install] [-AutoReboot] [-IncludeDrivers] [-GroupByCategory] [-NoBanner] [-NoRebootCheck] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -AutoReboot  
        Automatically reboot if updates require a restart  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Criteria <string>  
        Custom Windows Update search criteria  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -GroupByCategory  
        Group and color output by update category  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IncludeDrivers  
        Include drivers in update search  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Install  
        Automatically install available Windows updates  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBanner  
        Disable banner/status output  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoRebootCheck  
        Skip reboot requirement check/reporting  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Pop-Window 
```PowerShell 

   Pop-Window                           --> popw  
```` 

### SYNTAX 
```PowerShell 
Pop-Window [-Maximize] [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <byte>] [-Focus] [-FadeIn] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ShowWindow] [-Monitor <int>] [<CommonParameters>]  
   Pop-Window -Width <int> -Height <int> [-Maximize] [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <byte>] [-Focus] [-FadeIn] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ShowWindow] [-Monitor <int>] [<CommonParameters>]  
   Pop-Window -X <int> -Y <int> [-Maximize] [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <byte>] [-Focus] [-FadeIn] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ShowWindow] [-Monitor <int>] [<CommonParameters>]  
   Pop-Window [-NoModify] [<CommonParameters>] 
```` 

### PARAMETERS 
    -AlwaysOnTop  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Bottom  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FadeIn  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Hide  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Maximize  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Minimize  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoModify  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           NoModify  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Opacity <byte>  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Restore  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Show  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ShowWindow  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      sw  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -X <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Position  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Y <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Position  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Push-Window 
```PowerShell 

   Push-Window                          --> pushw  
```` 

### SYNTAX 
```PowerShell 
Push-Window [-Maximize] [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <byte>] [-Focus] [-FadeOut] [-PassThru] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ShowWindow] [-Monitor <int>] [<CommonParameters>]  
   Push-Window -Width <int> -Height <int> [-Maximize] [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <byte>] [-Focus] [-FadeOut] [-PassThru] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ShowWindow] [-Monitor <int>] [<CommonParameters>]  
   Push-Window -X <int> -Y <int> [-Maximize] [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <byte>] [-Focus] [-FadeOut] [-PassThru] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ShowWindow] [-Monitor <int>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -AlwaysOnTop  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Bottom  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FadeOut  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Hide  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Maximize  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Minimize  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Opacity <byte>  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThru  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Restore  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Show  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ShowWindow  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      sw  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -X <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Position  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Y <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Position  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Send-Key 
```PowerShell 

   Send-Key                             --> invokekeys, sendkeys  
```` 

### SYNTAX 
```PowerShell 
Send-Key [-KeysToSend] <string[]> [-ProcessName <string>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <int>] [<CommonParameters>]  
   Send-Key [-KeysToSend] <string[]> [-ProcessId <int>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <int>] [<CommonParameters>]  
   Send-Key [-KeysToSend] <string[]> [-WindowHandle <long>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <int>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -KeysToSend <string[]>  
        The keyboard input to send as an array of strings  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ProcessId <int>  
        ID of the process to send keys to  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           ByProcessId  
        Aliases                      Id, PID  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ProcessName <string>  
        Name of the process to send keys to (supports wildcards)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           ByProcessName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Escape control characters and modifiers in input text  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window after sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter for newlines  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WindowHandle <long>  
        Window handle to send keys to  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           ByWindowHandle  
        Aliases                      Handle, hWnd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-ClipboardFiles 
```PowerShell 

   Set-ClipboardFiles                   --> setclipfiles  
```` 

### SYNTAX 
```PowerShell 
Set-ClipboardFiles [-InputObject] <string[]> [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -InputObject <string[]>  
        Array of file paths to add to the clipboard  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Path, FullName, ImageFileName, FileName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-ForegroundWindow 
```PowerShell 

   Set-ForegroundWindow  
```` 

### SYNTAX 
```PowerShell 
Set-ForegroundWindow [-WindowHandle] <IntPtr> [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WindowHandle <IntPtr>  
        Window handle to set as foreground window  
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

<br/><hr/><br/>
 

##	Set-KnownFolderPath 
```PowerShell 

   Set-KnownFolderPath  
```` 

### SYNOPSIS 
    Modifies the physical path of a Windows known folder.  

### SYNTAX 
```PowerShell 
Set-KnownFolderPath [-KnownFolder] <String> [-Path] <String> [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Uses the Windows Shell32 API to relocate system folders like Documents,  
    Downloads, Desktop, or other known Windows folders to a new location. The  
    function validates the target path exists, looks up the folder's unique GUID  
    from the comprehensive known folders registry, and uses the SHSetKnownFolderPath  
    API to perform the relocation. Common use cases include moving user folders to  
    a different drive for space management or organization. Exercise caution when  
    moving system-critical folders as this may affect system stability.  

### PARAMETERS 
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
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-TaskbarAlignment 
```PowerShell 

   Set-TaskbarAlignment  
```` 

### SYNTAX 
```PowerShell 
Set-TaskbarAlignment [-Justify] {Center | Left} [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Justify <string>  
        The taskbar alignment (Center or Left)  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-WindowPosition 
```PowerShell 

   Set-WindowPosition                   --> wp  
```` 

### SYNTAX 
```PowerShell 
Set-WindowPosition [-Monitor <int>] [-NoBorders] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-PassThru] [-SideBySide] [-FocusWindow] [-SetForeground] [-Minimize] [-Maximize] [-KeysToSend <string[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <int>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>]  
   Set-WindowPosition [[-ProcessName] <string>] [-Monitor <int>] [-NoBorders] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-PassThru] [-SideBySide] [-FocusWindow] [-SetForeground] [-Minimize] [-Maximize] [-KeysToSend <string[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <int>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>]  
   Set-WindowPosition [-Process <Process>] [-Monitor <int>] [-NoBorders] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-PassThru] [-SideBySide] [-FocusWindow] [-SetForeground] [-Minimize] [-Maximize] [-KeysToSend <string[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <int>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>]  
   Set-WindowPosition [-WindowHelper <WindowObj[]>] [-Monitor <int>] [-NoBorders] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-PassThru] [-SideBySide] [-FocusWindow] [-SetForeground] [-Minimize] [-Maximize] [-KeysToSend <string[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <int>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Fullscreen  
        Maximize the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        Window height in pixels  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        Keystrokes to send to the Window, see documentation for cmdlet GenXdev.Windows\Send-Key  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Maximize  
        Maximize the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Minimize  
        Minimizes the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        Monitor selection: 0=primary, 1+=specific monitor, -1=current, -2=secondary  
        Required?                    false  
        Position?                    Named  
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
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThru  
        Returns the window helper for each process  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Process <Process>  
        The process of the window to position  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           Process  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ProcessName <string>  
        The process name of the window to position  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           ProcessName  
        Aliases                      Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -RestoreFocus  
        Restore PowerShell window focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Will either set the window fullscreen on a different monitor than Powershell, or side by side with Powershell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top  
        Place window on the top side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        Window width in pixels  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WindowHelper <WindowObj[]>  
        Get-Window helper object for direct window manipulation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           WindowHelper  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -X <int>  
        Window horizontal position in pixels  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Y <int>  
        Window vertical position in pixels  
        Required?                    false  
        Position?                    Named  
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

<br/><hr/><br/>
 

##	Set-WindowPositionForSecondary 
```PowerShell 

   Set-WindowPositionForSecondary       --> wps  
```` 

### SYNTAX 
```PowerShell 
Set-WindowPositionForSecondary [[-Process] <Process[]>] [-Monitor <int>] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-FullScreen] [-NoBorders] [-RestoreFocus] [-FocusWindow] [-SetForeground] [-Maximize] [-KeysToSend <string[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <int>] [-PassThru] [-SideBySide] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FullScreen  
        Sends F11 to the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        The initial height of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        Keystrokes to send to the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Maximize  
        Maximize the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        The monitor to use, 0=default, -1=discard, -2=configured  
        Required?                    false  
        Position?                    Named  
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
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThru  
        Returns the process object after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Process <Process[]>  
        The process of the window to position  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restore PowerShell window focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the window to foreground after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Place window side by side with PowerShell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top  
        Place window on the top side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        The initial width of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -X <int>  
        The initial X position of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Y <int>  
        The initial Y position of the window  
        Required?                    false  
        Position?                    Named  
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

<br/><hr/><br/>
 

##	Set-WindowsWallpaper 
```PowerShell 

   Set-WindowsWallpaper                 --> setaswallpaper  
```` 

### SYNTAX 
```PowerShell 
Set-WindowsWallpaper [[-InputObject] <Object>] [-AllDrives] [-NoRecurse] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -AllDrives  
        Search across all available drives  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -InputObject <Object>  
        Path to the directory containing the wallpaper images  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Path, FullName, FilePath, Input  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoRecurse  
        Do not recurse into subdirectories  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Start-ProcessWithPriority 
```PowerShell 

   Start-ProcessWithPriority            --> nice  
```` 

### SYNTAX 
```PowerShell 
Start-ProcessWithPriority [-FilePath] <string> [[-ArgumentList] <string[]>] [[-Priority] {Idle | BelowNormal | Low | Normal | AboveNormal | High | RealTime}] [-NoWait] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ArgumentList <string[]>  
        Arguments to pass to the executable  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FilePath <string>  
        Path to the executable to run  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoWait  
        Do not wait for process completion  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThru  
        Return the process object  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Priority <string>  
        Process priority level  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Test-PathUsingWindowsDefender 
```PowerShell 

   Test-PathUsingWindowsDefender        --> HasNoVirus, virusscan  
```` 

### SYNTAX 
```PowerShell 
Test-PathUsingWindowsDefender [-FilePath] <string> [-EnableRemediation] [<CommonParameters>] 
```` 

### PARAMETERS 
    -EnableRemediation  
        Instructs Windows Defender to take action on threats  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FilePath <string>  
        The path to the file or directory to be scanned  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Windows.WireGuard<hr/> 

##	Add-WireGuardPeer 
```PowerShell 

   Add-WireGuardPeer  
```` 

### SYNTAX 
```PowerShell 
Add-WireGuardPeer [-PeerName] <string> [[-AllowedIPs] <string>] [[-DNS] <string>] [[-OutputPath] <string>] [[-ContainerName] <string>] [[-VolumeName] <string>] [[-ServicePort] <int>] [[-HealthCheckTimeout] <int>] [[-HealthCheckInterval] <int>] [[-ImageName] <string>] [[-PUID] <string>] [[-PGID] <string>] [[-TimeZone] <string>] [-SaveConfig] [-ShowWindow] [-NoBorders] [-Width <int>] [-Height <int>] [-Left <int>] [-Right <int>] [-Bottom <int>] [-Centered] [-Fullscreen] [-RestoreFocus] [-SideBySide] [-FocusWindow] [-SetForeground] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <int>] [-SessionOnly] [-ClearSession] [-SkipSession] [-ShowQRCode] [-NoDockerInitialize] [-Force] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -AllowedIPs <string>  
        The IP ranges that will be routed through the VPN  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Bottom <int>  
        Set the window bottom position when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Center the window when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear session when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DNS <string>  
        DNS servers to use for this peer  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the window after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force rebuild of Docker container and remove existing data  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ForceRebuild  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Fullscreen  
        Start the service in fullscreen mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    8  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        Set the window height when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    9  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left <int>  
        Set the window left position when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Remove window borders when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoDockerInitialize  
        Skip Docker initialization (used when already called by parent function)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OutputPath <string>  
        The path where the peer configuration file should be saved  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      outfile, OutputFile  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    11  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    10  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PeerName <string>  
        A unique name for the peer  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restore focus to the window after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right <int>  
        Set the window right position when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SaveConfig  
        Save the peer configuration to a file  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay in milliseconds when sending keys after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Send Escape key to the window after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus when sending keys after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter when sending keys after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use session only for the WireGuard service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the window to foreground after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ShowQRCode  
        Generate QR code for easy mobile setup  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ShowWindow  
        Show the WireGuard window when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Show the window side by side when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Skip session when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    12  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        Set the window width when initializing the service  
        Required?                    false  
        Position?                    Named  
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

<br/><hr/><br/>
 

##	EnsureWireGuard 
```PowerShell 

   EnsureWireGuard  
```` 

### SYNTAX 
```PowerShell 
EnsureWireGuard [[-ContainerName] <string>] [[-VolumeName] <string>] [[-ServicePort] <int>] [[-HealthCheckTimeout] <int>] [[-HealthCheckInterval] <int>] [[-ImageName] <string>] [[-PUID] <string>] [[-PGID] <string>] [[-TimeZone] <string>] [-ShowWindow] [-NoBorders] [-Width <int>] [-Height <int>] [-Left] [-Right] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-SideBySide] [-FocusWindow] [-SetForeground] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <int>] [-SessionOnly] [-ClearSession] [-SkipSession] [-Force] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force rebuild of Docker container and remove existing data  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ForceRebuild  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Fullscreen  
        Maximize the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        The initial height of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Removes the borders of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restore PowerShell window focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ShowWindow  
        Show Docker Desktop window during initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Will either set the window fullscreen on a different monitor than Powershell, or side by side with Powershell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    8  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        The initial width of the window  
        Required?                    false  
        Position?                    Named  
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

<br/><hr/><br/>
 

##	Get-WireGuardPeerQRCode 
```PowerShell 

   Get-WireGuardPeerQRCode  
```` 

### SYNTAX 
```PowerShell 
Get-WireGuardPeerQRCode [-PeerName] <string> [-NoDockerInitialize] [-Force] [-ContainerName <string>] [-VolumeName <string>] [-ServicePort <int>] [-HealthCheckTimeout <int>] [-HealthCheckInterval <int>] [-ImageName <string>] [-PUID <string>] [-PGID <string>] [-TimeZone <string>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force rebuild of Docker container and remove existing data  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ForceRebuild  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoDockerInitialize  
        Skip Docker initialization (used when already called by parent function)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PeerName <string>  
        The name of the peer to generate a QR code for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    Named  
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

<br/><hr/><br/>
 

##	Get-WireGuardPeers 
```PowerShell 

   Get-WireGuardPeers  
```` 

### SYNTAX 
```PowerShell 
Get-WireGuardPeers [[-ContainerName] <string>] [[-VolumeName] <string>] [[-ServicePort] <int>] [[-HealthCheckTimeout] <int>] [[-HealthCheckInterval] <int>] [[-ImageName] <string>] [[-PUID] <string>] [[-PGID] <string>] [[-TimeZone] <string>] [[-Width] <int>] [[-Height] <int>] [[-Left] <int>] [[-Right] <int>] [[-Bottom] <int>] [[-SendKeyDelayMilliSeconds] <int>] [-NoDockerInitialize] [-Force] [-ShowWindow] [-NoBorders] [-Centered] [-Fullscreen] [-RestoreFocus] [-SideBySide] [-FocusWindow] [-SetForeground] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Bottom <int>  
        Set the bottom position of the Docker window  
        Required?                    false  
        Position?                    13  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Center the Docker window on the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear session for Docker window before running  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the Docker window after launching  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force rebuild of Docker container and remove existing data  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ForceRebuild  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Fullscreen  
        Run the Docker window in fullscreen mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        Set the height of the Docker window  
        Required?                    false  
        Position?                    10  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left <int>  
        Set the left position of the Docker window  
        Required?                    false  
        Position?                    11  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Remove window borders for the Docker window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoDockerInitialize  
        Skip Docker initialization (used when already called by parent function)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restore focus to the previous window after running Docker  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right <int>  
        Set the right position of the Docker window  
        Required?                    false  
        Position?                    12  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay in milliseconds between sending keys to Docker window  
        Required?                    false  
        Position?                    14  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Send Escape key to the Docker window after launch  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus in the Docker window after launch  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter when sending keys to Docker window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use session only for Docker window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the Docker window as foreground window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ShowWindow  
        Show the Docker window when running WireGuard  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Show Docker window side by side with other windows  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Skip session for Docker window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    8  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        Set the width of the Docker window  
        Required?                    false  
        Position?                    9  
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

<br/><hr/><br/>
 

##	Get-WireGuardStatus 
```PowerShell 

   Get-WireGuardStatus  
```` 

### SYNTAX 
```PowerShell 
Get-WireGuardStatus [[-ContainerName] <string>] [[-VolumeName] <string>] [[-ServicePort] <int>] [[-HealthCheckTimeout] <int>] [[-HealthCheckInterval] <int>] [[-ImageName] <string>] [[-PUID] <string>] [[-PGID] <string>] [[-TimeZone] <string>] [[-Width] <int>] [[-Height] <int>] [[-Left] <int>] [[-Right] <int>] [[-Bottom] <int>] [[-SendKeyDelayMilliSeconds] <int>] [-NoDockerInitialize] [-Force] [-ShowWindow] [-NoBorders] [-Centered] [-Fullscreen] [-RestoreFocus] [-SideBySide] [-FocusWindow] [-SetForeground] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Bottom <int>  
        Window bottom position (pass-through)  
        Required?                    false  
        Position?                    13  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Center the window (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear session data (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the window after opening (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force rebuild of Docker container and remove existing data  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ForceRebuild  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Fullscreen  
        Open window in fullscreen mode (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        Window height in characters or pixels (pass-through)  
        Required?                    false  
        Position?                    10  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left <int>  
        Window left position (pass-through)  
        Required?                    false  
        Position?                    11  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Remove window borders (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoDockerInitialize  
        Skip Docker initialization (used when already called by parent function)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restore focus to window after operation (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right <int>  
        Window right position (pass-through)  
        Required?                    false  
        Position?                    12  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay in milliseconds between sending keys (pass-through)  
        Required?                    false  
        Position?                    14  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Send Escape key to window (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus when sending keys (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter when sending keys (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Session only mode (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set window to foreground (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ShowWindow  
        Show the window when running the container (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Show side-by-side window (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Skip session initialization (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    8  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        Window width in characters or pixels (pass-through)  
        Required?                    false  
        Position?                    9  
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

<br/><hr/><br/>
 

##	Remove-WireGuardPeer 
```PowerShell 

   Remove-WireGuardPeer  
```` 

### SYNTAX 
```PowerShell 
Remove-WireGuardPeer [-PeerName] <string> [-ContainerName <string>] [-VolumeName <string>] [-ServicePort <int>] [-HealthCheckTimeout <int>] [-HealthCheckInterval <int>] [-ImageName <string>] [-PUID <string>] [-PGID <string>] [-TimeZone <string>] [-Force] [-NoDockerInitialize] [-ShowWindow] [-NoBorders] [-Width <int>] [-Height <int>] [-Left] [-Right] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-SideBySide] [-FocusWindow] [-SetForeground] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <int>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force removal without confirmation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ForceRebuild  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Fullscreen  
        Maximize the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        The initial height of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Removes the borders of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoDockerInitialize  
        Skip Docker initialization when called by parent function  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PeerName <string>  
        The name of the peer to remove  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restore PowerShell window focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ShowWindow  
        Show Docker Desktop window during initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Will either set the window fullscreen on a different monitor than Powershell, or side by side with Powershell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        The initial width of the window  
        Required?                    false  
        Position?                    Named  
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

<br/><hr/><br/>
 

##	Reset-WireGuardConfiguration 
```PowerShell 

   Reset-WireGuardConfiguration  
```` 

### SYNTAX 
```PowerShell 
Reset-WireGuardConfiguration [[-ContainerName] <string>] [[-VolumeName] <string>] [[-ServicePort] <int>] [[-HealthCheckTimeout] <int>] [[-HealthCheckInterval] <int>] [[-ImageName] <string>] [[-PUID] <string>] [[-PGID] <string>] [[-TimeZone] <string>] [-NoDockerInitialize] [-Force] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force reset without confirmation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoDockerInitialize  
        Skip Docker initialization (used when already called by parent function)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    8  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Windows<hr/> 

##	CurrentUserHasElevatedRights 
```PowerShell 

   CurrentUserHasElevatedRights  
```` 

### SYNTAX 
```PowerShell 
CurrentUserHasElevatedRights [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	EnsureDockerDesktop 
```PowerShell 

   EnsureDockerDesktop  
```` 

### SYNTAX 
```PowerShell 
EnsureDockerDesktop [[-Monitor] <int>] [[-Width] <int>] [[-Height] <int>] [[-X] <int>] [[-Y] <int>] [[-KeysToSend] <string[]>] [[-SendKeyDelayMilliSeconds] <int>] [-ShowWindow] [-NoBorders] [-Force] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-SideBySide] [-FocusWindow] [-SetForeground] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SessionOnly] [-ClearSession] [-SkipSession] [-NoDockerInitialization] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Forces a docker desktop restart  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Fullscreen  
        Maximize the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        The initial height of the window  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        Keystrokes to send to the Window, see documentation for cmdlet GenXdev.Windows\Send-Key  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        The monitor to use, 0 = default, -1 is discard  
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
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoDockerInitialization  
        Skip Docker initialization and return immediately  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restore PowerShell window focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ShowWindow  
        Show Docker Desktop window during initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Will either set the window fullscreen on a different monitor than Powershell, or side by side with Powershell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top  
        Place window on the top side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        The initial width of the window  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -X <int>  
        The initial X position of the window  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Y <int>  
        The initial Y position of the window  
        Required?                    false  
        Position?                    4  
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

<br/><hr/><br/>
 

##	EnsurePSTools 
```PowerShell 

   EnsurePSTools  
```` 

### SYNTAX 
```PowerShell 
EnsurePSTools [[-PSExeName] <string>] [-Force] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Force  
        Force reinstallation of Sysinternals tools  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PSExeName <string>  
        The executable name to verify installation  
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

<br/><hr/><br/>
 

##	Get-ActiveUser 
```PowerShell 

   Get-ActiveUser                       --> gusers  
```` 

### SYNTAX 
```PowerShell 
Get-ActiveUser [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-ChildProcesses 
```PowerShell 

   Get-ChildProcesses  
```` 

### SYNTAX 
```PowerShell 
Get-ChildProcesses [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-ClipboardFiles 
```PowerShell 

   Get-ClipboardFiles                   --> getclipfiles  
```` 

### SYNTAX 
```PowerShell 
Get-ClipboardFiles [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-CurrentFocusedProcess 
```PowerShell 

   Get-CurrentFocusedProcess  
```` 

### SYNTAX 
```PowerShell 
Get-CurrentFocusedProcess [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-DesktopScalingFactor 
```PowerShell 

   Get-DesktopScalingFactor  
```` 

### SYNTAX 
```PowerShell 
Get-DesktopScalingFactor [[-Monitor] <int>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Monitor <int>  
        The monitor index to check (0 = primary monitor)  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-ForegroundWindow 
```PowerShell 

   Get-ForegroundWindow  
```` 

### SYNTAX 
```PowerShell 
Get-ForegroundWindow [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-KnownFolderPath 
```PowerShell 

   Get-KnownFolderPath                  --> folder  
```` 

### SYNTAX 
```PowerShell 
Get-KnownFolderPath [-KnownFolder] {3DObjects | AddNewPrograms | AdminTools | AppUpdates | CDBurning | ChangeRemovePrograms | CommonAdminTools | CommonOEMLinks | CommonPrograms | CommonStartMenu | CommonStartup | CommonTemplates | ComputerFolder | ConflictFolder | ConnectionsFolder | Contacts | ControlPanelFolder | Cookies | Desktop | Documents | Downloads | Favorites | Fonts | Games | GameTasks | History | InternetCache | InternetFolder | Links | LocalAppData | LocalAppDataLow | LocalizedResourcesDir | Music | NetHood | NetworkFolder | OriginalImages | PhotoAlbums | Pictures | Playlists | PrintersFolder | PrintHood | Profile | ProgramData | ProgramFiles | ProgramFilesX64 | ProgramFilesX86 | ProgramFilesCommon | ProgramFilesCommonX64 | ProgramFilesCommonX86 | Programs | Public | PublicDesktop | PublicDocuments | PublicDownloads | PublicGameTasks | PublicMusic | PublicPictures | PublicVideos | QuickLaunch | Recent | RecycleBinFolder | ResourceDir | RoamingAppData | SampleMusic | SamplePictures | SamplePlaylists | SampleVideos | SavedGames | SavedSearches | SEARCH_CSC | SEARCH_MAPI | SearchHome | SendTo | SidebarDefaultParts | SidebarParts | StartMenu | Startup | SyncManagerFolder | SyncResultsFolder | SyncSetupFolder | System | SystemX86 | Templates | TreeProperties | UserProfiles | UsersFiles | Videos | Windows} [<CommonParameters>] 
```` 

### PARAMETERS 
    -KnownFolder <string>  
        The Windows known folder name to get the path for  
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

<br/><hr/><br/>
 

##	Get-MonitorCount 
```PowerShell 

   Get-MonitorCount  
```` 

### SYNTAX 
```PowerShell 
Get-MonitorCount [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-MpCmdRunPath 
```PowerShell 

   Get-MpCmdRunPath  
```` 

### SYNTAX 
```PowerShell 
Get-MpCmdRunPath [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-OpenedFileHandleProcesses 
```PowerShell 

   Get-OpenedFileHandleProcesses  
```` 

### SYNTAX 
```PowerShell 
Get-OpenedFileHandleProcesses [-FilePath] <string[]> [<CommonParameters>] 
```` 

### PARAMETERS 
    -FilePath <string[]>  
        The path to the file(s) to check for open handles  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-PowershellMainWindow 
```PowerShell 

   Get-PowershellMainWindow  
```` 

### SYNTAX 
```PowerShell 
Get-PowershellMainWindow [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-PowershellMainWindowProcess 
```PowerShell 

   Get-PowershellMainWindowProcess  
```` 

### SYNTAX 
```PowerShell 
Get-PowershellMainWindowProcess [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-Window 
```PowerShell 

   Get-Window                           --> gwin, window  
```` 

### SYNTAX 
```PowerShell 
Get-Window [[-ProcessName] <string>] [-ProcessId <int>] [-WindowHandle <long>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ProcessId <int>  
        ID of the process to get window information for  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Id, PID  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ProcessName <string>  
        Name of the process to get window information for  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -WindowHandle <long>  
        Window handle to get information for  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Handle, hWnd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Initialize-ScheduledTaskScripts 
```PowerShell 

   Initialize-ScheduledTaskScripts  
```` 

### SYNTAX 
```PowerShell 
Initialize-ScheduledTaskScripts [[-FilePath] <string>] [[-Prefix] <string>] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FilePath <string>  
        The directory path where task scripts will be created  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prefix <string>  
        Prefix for the scheduled task names  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Invoke-WindowsUpdate 
```PowerShell 

   Invoke-WindowsUpdate                 --> updatewindows  
```` 

### SYNTAX 
```PowerShell 
Invoke-WindowsUpdate [[-Criteria] <string>] [-Install] [-AutoReboot] [-IncludeDrivers] [-GroupByCategory] [-NoBanner] [-NoRebootCheck] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -AutoReboot  
        Automatically reboot if updates require a restart  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Criteria <string>  
        Custom Windows Update search criteria  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -GroupByCategory  
        Group and color output by update category  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IncludeDrivers  
        Include drivers in update search  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Install  
        Automatically install available Windows updates  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBanner  
        Disable banner/status output  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoRebootCheck  
        Skip reboot requirement check/reporting  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Pop-Window 
```PowerShell 

   Pop-Window                           --> popw  
```` 

### SYNTAX 
```PowerShell 
Pop-Window [-Maximize] [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <byte>] [-Focus] [-FadeIn] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ShowWindow] [-Monitor <int>] [<CommonParameters>]  
   Pop-Window -Width <int> -Height <int> [-Maximize] [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <byte>] [-Focus] [-FadeIn] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ShowWindow] [-Monitor <int>] [<CommonParameters>]  
   Pop-Window -X <int> -Y <int> [-Maximize] [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <byte>] [-Focus] [-FadeIn] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ShowWindow] [-Monitor <int>] [<CommonParameters>]  
   Pop-Window [-NoModify] [<CommonParameters>] 
```` 

### PARAMETERS 
    -AlwaysOnTop  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Bottom  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FadeIn  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Hide  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Maximize  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Minimize  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoModify  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           NoModify  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Opacity <byte>  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Restore  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Show  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ShowWindow  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      sw  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -X <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Position  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Y <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Position  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Push-Window 
```PowerShell 

   Push-Window                          --> pushw  
```` 

### SYNTAX 
```PowerShell 
Push-Window [-Maximize] [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <byte>] [-Focus] [-FadeOut] [-PassThru] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ShowWindow] [-Monitor <int>] [<CommonParameters>]  
   Push-Window -Width <int> -Height <int> [-Maximize] [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <byte>] [-Focus] [-FadeOut] [-PassThru] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ShowWindow] [-Monitor <int>] [<CommonParameters>]  
   Push-Window -X <int> -Y <int> [-Maximize] [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <byte>] [-Focus] [-FadeOut] [-PassThru] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ShowWindow] [-Monitor <int>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -AlwaysOnTop  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Bottom  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FadeOut  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Hide  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Maximize  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Minimize  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Opacity <byte>  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThru  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Restore  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Show  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ShowWindow  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      sw  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions, Position, Default  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Dimensions  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -X <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Position  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Y <int>  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Position  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Send-Key 
```PowerShell 

   Send-Key                             --> invokekeys, sendkeys  
```` 

### SYNTAX 
```PowerShell 
Send-Key [-KeysToSend] <string[]> [-ProcessName <string>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <int>] [<CommonParameters>]  
   Send-Key [-KeysToSend] <string[]> [-ProcessId <int>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <int>] [<CommonParameters>]  
   Send-Key [-KeysToSend] <string[]> [-WindowHandle <long>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <int>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -KeysToSend <string[]>  
        The keyboard input to send as an array of strings  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ProcessId <int>  
        ID of the process to send keys to  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           ByProcessId  
        Aliases                      Id, PID  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ProcessName <string>  
        Name of the process to send keys to (supports wildcards)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           ByProcessName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Escape control characters and modifiers in input text  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window after sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter for newlines  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WindowHandle <long>  
        Window handle to send keys to  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           ByWindowHandle  
        Aliases                      Handle, hWnd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-ClipboardFiles 
```PowerShell 

   Set-ClipboardFiles                   --> setclipfiles  
```` 

### SYNTAX 
```PowerShell 
Set-ClipboardFiles [-InputObject] <string[]> [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -InputObject <string[]>  
        Array of file paths to add to the clipboard  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Path, FullName, ImageFileName, FileName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-ForegroundWindow 
```PowerShell 

   Set-ForegroundWindow  
```` 

### SYNTAX 
```PowerShell 
Set-ForegroundWindow [-WindowHandle] <IntPtr> [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WindowHandle <IntPtr>  
        Window handle to set as foreground window  
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

<br/><hr/><br/>
 

##	Set-KnownFolderPath 
```PowerShell 

   Set-KnownFolderPath  
```` 

### SYNOPSIS 
    Modifies the physical path of a Windows known folder.  

### SYNTAX 
```PowerShell 
Set-KnownFolderPath [-KnownFolder] <String> [-Path] <String> [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Uses the Windows Shell32 API to relocate system folders like Documents,  
    Downloads, Desktop, or other known Windows folders to a new location. The  
    function validates the target path exists, looks up the folder's unique GUID  
    from the comprehensive known folders registry, and uses the SHSetKnownFolderPath  
    API to perform the relocation. Common use cases include moving user folders to  
    a different drive for space management or organization. Exercise caution when  
    moving system-critical folders as this may affect system stability.  

### PARAMETERS 
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
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-TaskbarAlignment 
```PowerShell 

   Set-TaskbarAlignment  
```` 

### SYNTAX 
```PowerShell 
Set-TaskbarAlignment [-Justify] {Center | Left} [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Justify <string>  
        The taskbar alignment (Center or Left)  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-WindowPosition 
```PowerShell 

   Set-WindowPosition                   --> wp  
```` 

### SYNTAX 
```PowerShell 
Set-WindowPosition [-Monitor <int>] [-NoBorders] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-PassThru] [-SideBySide] [-FocusWindow] [-SetForeground] [-Minimize] [-Maximize] [-KeysToSend <string[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <int>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>]  
   Set-WindowPosition [[-ProcessName] <string>] [-Monitor <int>] [-NoBorders] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-PassThru] [-SideBySide] [-FocusWindow] [-SetForeground] [-Minimize] [-Maximize] [-KeysToSend <string[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <int>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>]  
   Set-WindowPosition [-Process <Process>] [-Monitor <int>] [-NoBorders] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-PassThru] [-SideBySide] [-FocusWindow] [-SetForeground] [-Minimize] [-Maximize] [-KeysToSend <string[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <int>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>]  
   Set-WindowPosition [-WindowHelper <WindowObj[]>] [-Monitor <int>] [-NoBorders] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-PassThru] [-SideBySide] [-FocusWindow] [-SetForeground] [-Minimize] [-Maximize] [-KeysToSend <string[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <int>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Fullscreen  
        Maximize the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        Window height in pixels  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        Keystrokes to send to the Window, see documentation for cmdlet GenXdev.Windows\Send-Key  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Maximize  
        Maximize the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Minimize  
        Minimizes the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        Monitor selection: 0=primary, 1+=specific monitor, -1=current, -2=secondary  
        Required?                    false  
        Position?                    Named  
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
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThru  
        Returns the window helper for each process  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Process <Process>  
        The process of the window to position  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           Process  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ProcessName <string>  
        The process name of the window to position  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           ProcessName  
        Aliases                      Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -RestoreFocus  
        Restore PowerShell window focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Will either set the window fullscreen on a different monitor than Powershell, or side by side with Powershell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top  
        Place window on the top side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        Window width in pixels  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WindowHelper <WindowObj[]>  
        Get-Window helper object for direct window manipulation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           WindowHelper  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -X <int>  
        Window horizontal position in pixels  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Y <int>  
        Window vertical position in pixels  
        Required?                    false  
        Position?                    Named  
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

<br/><hr/><br/>
 

##	Set-WindowPositionForSecondary 
```PowerShell 

   Set-WindowPositionForSecondary       --> wps  
```` 

### SYNTAX 
```PowerShell 
Set-WindowPositionForSecondary [[-Process] <Process[]>] [-Monitor <int>] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-FullScreen] [-NoBorders] [-RestoreFocus] [-FocusWindow] [-SetForeground] [-Maximize] [-KeysToSend <string[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <int>] [-PassThru] [-SideBySide] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FullScreen  
        Sends F11 to the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        The initial height of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        Keystrokes to send to the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Maximize  
        Maximize the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        The monitor to use, 0=default, -1=discard, -2=configured  
        Required?                    false  
        Position?                    Named  
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
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThru  
        Returns the process object after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Process <Process[]>  
        The process of the window to position  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restore PowerShell window focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the window to foreground after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Place window side by side with PowerShell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top  
        Place window on the top side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        The initial width of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -X <int>  
        The initial X position of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Y <int>  
        The initial Y position of the window  
        Required?                    false  
        Position?                    Named  
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

<br/><hr/><br/>
 

##	Set-WindowsWallpaper 
```PowerShell 

   Set-WindowsWallpaper                 --> setaswallpaper  
```` 

### SYNTAX 
```PowerShell 
Set-WindowsWallpaper [[-InputObject] <Object>] [-AllDrives] [-NoRecurse] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -AllDrives  
        Search across all available drives  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -InputObject <Object>  
        Path to the directory containing the wallpaper images  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Path, FullName, FilePath, Input  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoRecurse  
        Do not recurse into subdirectories  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Start-ProcessWithPriority 
```PowerShell 

   Start-ProcessWithPriority            --> nice  
```` 

### SYNTAX 
```PowerShell 
Start-ProcessWithPriority [-FilePath] <string> [[-ArgumentList] <string[]>] [[-Priority] {Idle | BelowNormal | Low | Normal | AboveNormal | High | RealTime}] [-NoWait] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ArgumentList <string[]>  
        Arguments to pass to the executable  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FilePath <string>  
        Path to the executable to run  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoWait  
        Do not wait for process completion  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThru  
        Return the process object  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Priority <string>  
        Process priority level  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Test-PathUsingWindowsDefender 
```PowerShell 

   Test-PathUsingWindowsDefender        --> HasNoVirus, virusscan  
```` 

### SYNTAX 
```PowerShell 
Test-PathUsingWindowsDefender [-FilePath] <string> [-EnableRemediation] [<CommonParameters>] 
```` 

### PARAMETERS 
    -EnableRemediation  
        Instructs Windows Defender to take action on threats  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FilePath <string>  
        The path to the file or directory to be scanned  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Windows.WireGuard<hr/> 

##	Add-WireGuardPeer 
```PowerShell 

   Add-WireGuardPeer  
```` 

### SYNTAX 
```PowerShell 
Add-WireGuardPeer [-PeerName] <string> [[-AllowedIPs] <string>] [[-DNS] <string>] [[-OutputPath] <string>] [[-ContainerName] <string>] [[-VolumeName] <string>] [[-ServicePort] <int>] [[-HealthCheckTimeout] <int>] [[-HealthCheckInterval] <int>] [[-ImageName] <string>] [[-PUID] <string>] [[-PGID] <string>] [[-TimeZone] <string>] [-SaveConfig] [-ShowWindow] [-NoBorders] [-Width <int>] [-Height <int>] [-Left <int>] [-Right <int>] [-Bottom <int>] [-Centered] [-Fullscreen] [-RestoreFocus] [-SideBySide] [-FocusWindow] [-SetForeground] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <int>] [-SessionOnly] [-ClearSession] [-SkipSession] [-ShowQRCode] [-NoDockerInitialize] [-Force] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -AllowedIPs <string>  
        The IP ranges that will be routed through the VPN  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Bottom <int>  
        Set the window bottom position when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Center the window when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear session when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DNS <string>  
        DNS servers to use for this peer  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the window after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force rebuild of Docker container and remove existing data  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ForceRebuild  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Fullscreen  
        Start the service in fullscreen mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    8  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        Set the window height when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    9  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left <int>  
        Set the window left position when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Remove window borders when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoDockerInitialize  
        Skip Docker initialization (used when already called by parent function)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OutputPath <string>  
        The path where the peer configuration file should be saved  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      outfile, OutputFile  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    11  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    10  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PeerName <string>  
        A unique name for the peer  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restore focus to the window after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right <int>  
        Set the window right position when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SaveConfig  
        Save the peer configuration to a file  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay in milliseconds when sending keys after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Send Escape key to the window after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus when sending keys after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter when sending keys after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use session only for the WireGuard service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the window to foreground after initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ShowQRCode  
        Generate QR code for easy mobile setup  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ShowWindow  
        Show the WireGuard window when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Show the window side by side when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Skip session when initializing the service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    12  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        Set the window width when initializing the service  
        Required?                    false  
        Position?                    Named  
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

<br/><hr/><br/>
 

##	EnsureWireGuard 
```PowerShell 

   EnsureWireGuard  
```` 

### SYNTAX 
```PowerShell 
EnsureWireGuard [[-ContainerName] <string>] [[-VolumeName] <string>] [[-ServicePort] <int>] [[-HealthCheckTimeout] <int>] [[-HealthCheckInterval] <int>] [[-ImageName] <string>] [[-PUID] <string>] [[-PGID] <string>] [[-TimeZone] <string>] [-ShowWindow] [-NoBorders] [-Width <int>] [-Height <int>] [-Left] [-Right] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-SideBySide] [-FocusWindow] [-SetForeground] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <int>] [-SessionOnly] [-ClearSession] [-SkipSession] [-Force] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force rebuild of Docker container and remove existing data  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ForceRebuild  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Fullscreen  
        Maximize the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        The initial height of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Removes the borders of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restore PowerShell window focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ShowWindow  
        Show Docker Desktop window during initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Will either set the window fullscreen on a different monitor than Powershell, or side by side with Powershell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    8  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        The initial width of the window  
        Required?                    false  
        Position?                    Named  
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

<br/><hr/><br/>
 

##	Get-WireGuardPeerQRCode 
```PowerShell 

   Get-WireGuardPeerQRCode  
```` 

### SYNTAX 
```PowerShell 
Get-WireGuardPeerQRCode [-PeerName] <string> [-NoDockerInitialize] [-Force] [-ContainerName <string>] [-VolumeName <string>] [-ServicePort <int>] [-HealthCheckTimeout <int>] [-HealthCheckInterval <int>] [-ImageName <string>] [-PUID <string>] [-PGID <string>] [-TimeZone <string>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force rebuild of Docker container and remove existing data  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ForceRebuild  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoDockerInitialize  
        Skip Docker initialization (used when already called by parent function)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PeerName <string>  
        The name of the peer to generate a QR code for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    Named  
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

<br/><hr/><br/>
 

##	Get-WireGuardPeers 
```PowerShell 

   Get-WireGuardPeers  
```` 

### SYNTAX 
```PowerShell 
Get-WireGuardPeers [[-ContainerName] <string>] [[-VolumeName] <string>] [[-ServicePort] <int>] [[-HealthCheckTimeout] <int>] [[-HealthCheckInterval] <int>] [[-ImageName] <string>] [[-PUID] <string>] [[-PGID] <string>] [[-TimeZone] <string>] [[-Width] <int>] [[-Height] <int>] [[-Left] <int>] [[-Right] <int>] [[-Bottom] <int>] [[-SendKeyDelayMilliSeconds] <int>] [-NoDockerInitialize] [-Force] [-ShowWindow] [-NoBorders] [-Centered] [-Fullscreen] [-RestoreFocus] [-SideBySide] [-FocusWindow] [-SetForeground] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Bottom <int>  
        Set the bottom position of the Docker window  
        Required?                    false  
        Position?                    13  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Center the Docker window on the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear session for Docker window before running  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the Docker window after launching  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force rebuild of Docker container and remove existing data  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ForceRebuild  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Fullscreen  
        Run the Docker window in fullscreen mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        Set the height of the Docker window  
        Required?                    false  
        Position?                    10  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left <int>  
        Set the left position of the Docker window  
        Required?                    false  
        Position?                    11  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Remove window borders for the Docker window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoDockerInitialize  
        Skip Docker initialization (used when already called by parent function)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restore focus to the previous window after running Docker  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right <int>  
        Set the right position of the Docker window  
        Required?                    false  
        Position?                    12  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay in milliseconds between sending keys to Docker window  
        Required?                    false  
        Position?                    14  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Send Escape key to the Docker window after launch  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus in the Docker window after launch  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter when sending keys to Docker window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use session only for Docker window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the Docker window as foreground window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ShowWindow  
        Show the Docker window when running WireGuard  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Show Docker window side by side with other windows  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Skip session for Docker window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    8  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        Set the width of the Docker window  
        Required?                    false  
        Position?                    9  
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

<br/><hr/><br/>
 

##	Get-WireGuardStatus 
```PowerShell 

   Get-WireGuardStatus  
```` 

### SYNTAX 
```PowerShell 
Get-WireGuardStatus [[-ContainerName] <string>] [[-VolumeName] <string>] [[-ServicePort] <int>] [[-HealthCheckTimeout] <int>] [[-HealthCheckInterval] <int>] [[-ImageName] <string>] [[-PUID] <string>] [[-PGID] <string>] [[-TimeZone] <string>] [[-Width] <int>] [[-Height] <int>] [[-Left] <int>] [[-Right] <int>] [[-Bottom] <int>] [[-SendKeyDelayMilliSeconds] <int>] [-NoDockerInitialize] [-Force] [-ShowWindow] [-NoBorders] [-Centered] [-Fullscreen] [-RestoreFocus] [-SideBySide] [-FocusWindow] [-SetForeground] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Bottom <int>  
        Window bottom position (pass-through)  
        Required?                    false  
        Position?                    13  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Center the window (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear session data (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the window after opening (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force rebuild of Docker container and remove existing data  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ForceRebuild  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Fullscreen  
        Open window in fullscreen mode (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        Window height in characters or pixels (pass-through)  
        Required?                    false  
        Position?                    10  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left <int>  
        Window left position (pass-through)  
        Required?                    false  
        Position?                    11  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Remove window borders (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoDockerInitialize  
        Skip Docker initialization (used when already called by parent function)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restore focus to window after operation (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right <int>  
        Window right position (pass-through)  
        Required?                    false  
        Position?                    12  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay in milliseconds between sending keys (pass-through)  
        Required?                    false  
        Position?                    14  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Send Escape key to window (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus when sending keys (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter when sending keys (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Session only mode (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set window to foreground (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ShowWindow  
        Show the window when running the container (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Show side-by-side window (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Skip session initialization (pass-through)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    8  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        Window width in characters or pixels (pass-through)  
        Required?                    false  
        Position?                    9  
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

<br/><hr/><br/>
 

##	Remove-WireGuardPeer 
```PowerShell 

   Remove-WireGuardPeer  
```` 

### SYNTAX 
```PowerShell 
Remove-WireGuardPeer [-PeerName] <string> [-ContainerName <string>] [-VolumeName <string>] [-ServicePort <int>] [-HealthCheckTimeout <int>] [-HealthCheckInterval <int>] [-ImageName <string>] [-PUID <string>] [-PGID <string>] [-TimeZone <string>] [-Force] [-NoDockerInitialize] [-ShowWindow] [-NoBorders] [-Width <int>] [-Height <int>] [-Left] [-Right] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-SideBySide] [-FocusWindow] [-SetForeground] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <int>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force removal without confirmation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ForceRebuild  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Fullscreen  
        Maximize the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        The initial height of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Removes the borders of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoDockerInitialize  
        Skip Docker initialization when called by parent function  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PeerName <string>  
        The name of the peer to remove  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restore PowerShell window focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ShowWindow  
        Show Docker Desktop window during initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Will either set the window fullscreen on a different monitor than Powershell, or side by side with Powershell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        The initial width of the window  
        Required?                    false  
        Position?                    Named  
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

<br/><hr/><br/>
 

##	Reset-WireGuardConfiguration 
```PowerShell 

   Reset-WireGuardConfiguration  
```` 

### SYNTAX 
```PowerShell 
Reset-WireGuardConfiguration [[-ContainerName] <string>] [[-VolumeName] <string>] [[-ServicePort] <int>] [[-HealthCheckTimeout] <int>] [[-HealthCheckInterval] <int>] [[-ImageName] <string>] [[-PUID] <string>] [[-PGID] <string>] [[-TimeZone] <string>] [-NoDockerInitialize] [-Force] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ContainerName <string>  
        The name for the Docker container  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force reset without confirmation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckInterval <int>  
        Interval in seconds between health check attempts  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HealthCheckTimeout <int>  
        Maximum time in seconds to wait for service health check  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ImageName <string>  
        Custom Docker image name to use  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoDockerInitialize  
        Skip Docker initialization (used when already called by parent function)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PGID <string>  
        Group ID for permissions in the container  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PUID <string>  
        User ID for permissions in the container  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ServicePort <int>  
        The port number for the WireGuard service  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TimeZone <string>  
        Timezone to use for the container  
        Required?                    false  
        Position?                    8  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VolumeName <string>  
        The name for the Docker volume for persistent storage  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
