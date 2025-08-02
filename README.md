<hr/>

<img src="powershell.jpg" alt="GenXdev" width="50%"/>

<hr/>

### NAME
    GenXdev.Windows

### SYNOPSIS
    A Windows PowerShell module that provides ui Windows manipulation helpers

[![GenXdev.Windows](https://img.shields.io/powershellgallery/v/GenXdev.Windows.svg?style=flat-square&label=GenXdev.Windows)](https://www.powershellgallery.com/packages/GenXdev.Windows/) [![License](https://img.shields.io/github/license/genXdev/GenXdev.Windows?style=flat-square)](./LICENSE)

## MIT License

```text
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
````PowerShell
Install-Module "GenXdev.Windows"
Import-Module "GenXdev.Windows"
````
### UPDATE
````PowerShell
Update-Module
````
<br/><hr/><hr/><br/>

# Cmdlet Index
### GenXdev.Windows<hr/>
### GenXdev.Windows
| Command | Aliases | Description |
| --- | --- | --- |
| [CurrentUserHasElevatedRights](#currentuserhaselevatedrights) | &nbsp; | Checks if the current user has elevated rights. |
| [EnsureDockerDesktop](#ensuredockerdesktop) | &nbsp; | Checks if the WinGet PowerShell module is installed. |
| [EnsurePSTools](#ensurepstools) | &nbsp; | Ensures Sysinternals tools (PSTools) are installed and available. |
| [Get-ActiveUser](#get-activeuser) | gusers | Retrieves a list of unique usernames from currently active system processes. |
| [Get-ChildProcesses](#get-childprocesses) | &nbsp; | Retrieves all processes that are descendants of the current PowerShell process. |
| [Get-ClipboardFiles](#get-clipboardfiles) | &nbsp; | Gets files from the Windows clipboard that were set for file operations like copy/paste. |
| [Get-CurrentFocusedProcess](#get-currentfocusedprocess) | &nbsp; | Retrieves the process object of the window that currently has keyboard focus. |
| [Get-DesktopScalingFactor](#get-desktopscalingfactor) | &nbsp; | Retrieves the Windows display scaling factor (DPI setting) for a specified monitor. |
| [Get-ForegroundWindow](#get-foregroundwindow) | &nbsp; |  |
| [Get-KnownFolderPath](#get-knownfolderpath) | folder | Gets the path of a Windows known folder using the Windows Shell32 API. |
| [Get-MonitorCount](#get-monitorcount) | &nbsp; | Gets the total number of display monitors connected to the system. |
| [Get-MpCmdRunPath](#get-mpcmdrunpath) | &nbsp; | Gets the path to the Windows Defender MpCmdRun.exe executable. |
| [Get-OpenedFileHandleProcesses](#get-openedfilehandleprocesses) | &nbsp; | Retrieves processes that have open file handles to specified files. |
| [Get-PowershellMainWindow](#get-powershellmainwindow) | &nbsp; | Returns a window helper object for the PowerShell terminal's main window. |
| [Get-PowershellMainWindowProcess](#get-powershellmainwindowprocess) | &nbsp; | Returns the process object for the window hosting the PowerShell terminal. |
| [Get-Window](#get-window) | gwin, window | Gets window information for specified processes or window handles. |
| [Get-WindowsIsUpToDate](#get-windowsisuptodate) | updatewindows | Checks if Windows is up to date and optionally installs available updates. |
| [Initialize-ScheduledTaskScripts](#initialize-scheduledtaskscripts) | &nbsp; | Creates scheduled tasks that run PowerShell scripts at specified intervals. |
| [Pop-Window](#pop-window) | popw | Pops the last active window helper from the stack with optional modifications. |
| [Push-Window](#push-window) | pushw | Pushes the current window onto the window stack with optional modifications. |
| [Send-Key](#send-key) | sendkeys, invokekeys | Sends simulated keystrokes to a window or process. |
| [Set-ClipboardFiles](#set-clipboardfiles) | setclipfiles | Sets files to the Windows clipboard for file operations like copy/paste. |
| [Set-ForegroundWindow](#set-foregroundwindow) | &nbsp; | Brings the specified window to the foreground and makes it the active window. |
| [Set-KnownFolderPath](#set-knownfolderpath) | &nbsp; | Modifies the physical path of a Windows known folder. |
| [Set-TaskbarAlignment](#set-taskbaralignment) | set-taskalign | Configures Windows 11+ taskbar alignment between center and left positions. |
| [Set-WindowPosition](#set-windowposition) | wp | Positions and resizes windows on specified monitors with various layout options. |
| [Set-WindowPositionForSecondary](#set-windowpositionforsecondary) | wps | Positions a window on the secondary monitor with specified layout options. |
| [Set-WindowsWallpaper](#set-windowswallpaper) | setaswallpaper | Sets a random wallpaper from a specified directory. |
| [Start-ProcessWithPriority](#start-processwithpriority) | nice | Starts a process with a specified priority level. |
| [Test-PathUsingWindowsDefender](#test-pathusingwindowsdefender) | virusscan | Scans files or directories for malware using Windows Defender. |

### GenXdev.Windows.WireGuard
| Command | Aliases | Description |
| --- | --- | --- |
| [Add-WireGuardPeer](#add-wireguardpeer) | &nbsp; | Adds a new WireGuard VPN peer (client) configuration to the server. |
| [EnsureWireGuard](#ensurewireguard) | &nbsp; | Ensures WireGuard VPN service is installed and running via Docker container. |
| [Get-WireGuardPeerQRCode](#get-wireguardpeerqrcode) | &nbsp; | Generates a QR code for a WireGuard VPN peer configuration. |
| [Get-WireGuardPeers](#get-wireguardpeers) | &nbsp; | Gets information about all WireGuard VPN peers configured on the system. |
| [Get-WireGuardStatus](#get-wireguardstatus) | &nbsp; | Gets detailed status information about the WireGuard VPN server. |
| [Remove-WireGuardPeer](#remove-wireguardpeer) | &nbsp; | Removes a WireGuard VPN peer configuration. |
| [Reset-WireGuardConfiguration](#reset-wireguardconfiguration) | &nbsp; | Resets the WireGuard VPN server configuration, removing all peers. |

<br/><hr/><hr/><br/>


# Cmdlets

&nbsp;<hr/>
###	GenXdev.Windows<hr/> 

##	CurrentUserHasElevatedRights 
````PowerShell 

   CurrentUserHasElevatedRights  
```` 

### SYNOPSIS 
    Checks if the current user has elevated rights.  

### SYNTAX 
````PowerShell 
CurrentUserHasElevatedRights [<CommonParameters>] 
```` 

### DESCRIPTION 
    Determines whether the current Windows user has administrative or backup operator  
    privileges by checking their security principal roles. Returns true if the user  
    has elevated rights, false otherwise. Implements robust error handling for  
    security and access-related issues.  

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	EnsureDockerDesktop 
````PowerShell 

   EnsureDockerDesktop  
```` 

### SYNOPSIS 
    Ensures Docker Desktop is installed and available for containerization  
    operations.  

### SYNTAX 
````PowerShell 
EnsureDockerDesktop [-ShowWindow] [[-Monitor] <Int32>] [-NoBorders] [-Force] [[-Width] <Int32>] [[-Height] <Int32>] [[-X] <Int32>] [[-Y] <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-SideBySide] [-FocusWindow] [-SetForeground] [[-KeysToSend] <String[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [[-SendKeyDelayMilliSeconds] <Int32>] [-SessionOnly] [-ClearSession] [-SkipSession] [-NoDockerInitialization] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Verifies if Docker Desktop is installed and properly configured on the system.  
    If not found, installs Docker Desktop using WinGet and handles the complete  
    installation process automatically. This function also manages Docker Desktop  
    service startup, daemon readiness verification, and handles authentication  
    requirements when necessary. The function includes comprehensive path  
    management for both system and user-level Docker installations.  

### PARAMETERS 
    -ShowWindow [<SwitchParameter>]  
        Shows the Docker Desktop window during initialization when specified. When  
        this switch is enabled, Docker Desktop will start with its window visible  
        instead of minimized to the system tray.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Monitor <Int32>  
        Specifies the monitor to move the Docker Desktop window to:  
          0 = Primary monitor (default)  
          1..n = Specific monitor (1-based index)  
          -1 = Discard monitor positioning  
          -2 = Secondary monitor (uses $Global:DefaultSecondaryMonitor if defined)  
        Required?                    false  
        Position?                    1  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoBorders [<SwitchParameter>]  
        Removes the window borders and title bar from the Docker Desktop window for  
        a cleaner appearance.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Force [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Width <Int32>  
        Sets the width of the Docker Desktop window in pixels. Use -1 for automatic  
        sizing based on window content.  
        Required?                    false  
        Position?                    2  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Height <Int32>  
        Sets the height of the Docker Desktop window in pixels. Use -1 for automatic  
        sizing based on window content.  
        Required?                    false  
        Position?                    3  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -X <Int32>  
        Sets the horizontal position of the Docker Desktop window in pixels. Use -1  
        for automatic positioning by the system.  
        Required?                    false  
        Position?                    4  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Y <Int32>  
        Sets the vertical position of the Docker Desktop window in pixels. Use -1  
        for automatic positioning by the system.  
        Required?                    false  
        Position?                    5  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Left [<SwitchParameter>]  
        Places the Docker Desktop window on the left half of the screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Right [<SwitchParameter>]  
        Places the Docker Desktop window on the right half of the screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Top [<SwitchParameter>]  
        Places the Docker Desktop window on the top half of the screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Bottom [<SwitchParameter>]  
        Places the Docker Desktop window on the bottom half of the screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Centered [<SwitchParameter>]  
        Centers the Docker Desktop window on the screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Fullscreen [<SwitchParameter>]  
        Maximizes the Docker Desktop window to fill the entire screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -RestoreFocus [<SwitchParameter>]  
        Returns focus to the PowerShell window after positioning Docker Desktop.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SideBySide [<SwitchParameter>]  
        Positions Docker Desktop side by side with PowerShell on the same monitor  
        or fullscreen on a different monitor.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FocusWindow [<SwitchParameter>]  
        Focuses the Docker Desktop window after positioning and initialization.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SetForeground [<SwitchParameter>]  
        Sets the Docker Desktop window to foreground after positioning and  
        initialization.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -KeysToSend <String[]>  
        Keystrokes to send to the Docker Desktop window after positioning and  
        initialization. See documentation for cmdlet GenXdev.Windows\Send-Key.  
        Required?                    false  
        Position?                    6  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyEscape [<SwitchParameter>]  
        Escape control characters and modifiers when sending keys  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]  
        Hold keyboard focus on target window when sending keys  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter [<SwitchParameter>]  
        Use Shift+Enter instead of Enter when sending keys  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <Int32>  
        Delay between different input strings in milliseconds when sending keys  
        Required?                    false  
        Position?                    7  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Uses alternative settings stored in session for AI preferences instead of  
        persistent preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Clears alternative settings stored in session for AI preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Stores settings only in persistent preferences without affecting session  
        variables.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoDockerInitialization [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
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

<br/><hr/><hr/><br/>
 

##	EnsurePSTools 
````PowerShell 

   EnsurePSTools  
```` 

### SYNOPSIS 
    Ensures Sysinternals tools (PSTools) are installed and available.  

### SYNTAX 
````PowerShell 
EnsurePSTools [-Force] [[-PSExeName] <String>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Verifies if Sysinternals tools like handle.exe are installed and properly  
    configured on the system. If not found, installs the Sysinternals Suite  
    using WinGet and handles the complete installation process automatically.  

### PARAMETERS 
    -Force [<SwitchParameter>]  
        Switch to force reinstallation of Sysinternals tools even if they are already  
        installed.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PSExeName <String>  
        The executable name to check for verifying Sysinternals tools installation.  
        Default is 'handle.exe'.  
        Required?                    false  
        Position?                    1  
        Default value                handle.exe  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Get-ActiveUser 
````PowerShell 

   Get-ActiveUser                       --> gusers  
```` 

### SYNOPSIS 
    Retrieves a list of unique usernames from currently active system processes.  

### SYNTAX 
````PowerShell 
Get-ActiveUser [<CommonParameters>] 
```` 

### DESCRIPTION 
    Queries all running processes on the system, extracts the associated username for  
    each process, and returns a deduplicated list of users who have active processes.  
    This is useful for system administration and security monitoring.  

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Get-ChildProcesses 
````PowerShell 

   Get-ChildProcesses  
```` 

### SYNOPSIS 
    Retrieves all processes that are descendants of the current PowerShell process.  

### SYNTAX 
````PowerShell 
Get-ChildProcesses [<CommonParameters>] 
```` 

### DESCRIPTION 
    Examines all running processes and identifies those that have the current  
    PowerShell process as an ancestor in their parent process chain. This includes  
    both direct child processes and their descendants (grandchildren, etc.).  

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Get-ClipboardFiles 
````PowerShell 

   Get-ClipboardFiles                   --> getclipfiles  
```` 

### SYNOPSIS 
    Gets files from the Windows clipboard that were set for file operations like copy/paste.  

### SYNTAX 
````PowerShell 
Get-ClipboardFiles [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function retrieves file paths from the Windows clipboard that were previously  
    set for file operations. It handles both STA and MTA threading modes automatically,  
    ensuring compatibility across different PowerShell execution contexts. The function  
    validates file existence and returns only existing files/directories as objects  
    similar to Get-ChildItem or Get-Item output.  

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Get-CurrentFocusedProcess 
````PowerShell 

   Get-CurrentFocusedProcess  
```` 

### SYNOPSIS 
    Retrieves the process object of the window that currently has keyboard focus.  

### SYNTAX 
````PowerShell 
Get-CurrentFocusedProcess [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function uses Windows API calls through P/Invoke to identify and return the  
    Process object associated with the currently focused window. It leverages the  
    User32.dll functions GetForegroundWindow and GetWindowThreadProcessId to determine  
    which window has focus and obtain its associated process ID.  

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

### NOTES 
````PowerShell 

       Requires Windows operating system as it uses Windows-specific API calls.  
       May return null if the process cannot be accessed due to permissions.  
       ##############################################################################  
   -------------------------- EXAMPLE 1 --------------------------  
   PS C:\> $focusedProcess = Get-CurrentFocusedProcess  
   Write-Host "Active window process: $($focusedProcess.ProcessName)"  
```` 

<br/><hr/><hr/><br/>
 

##	Get-DesktopScalingFactor 
````PowerShell 

   Get-DesktopScalingFactor  
```` 

### SYNOPSIS 
    Retrieves the Windows display scaling factor (DPI setting) for a specified monitor.  

### SYNTAX 
````PowerShell 
Get-DesktopScalingFactor [[-Monitor] <Int32>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Gets the current Windows display scaling factor configured for a monitor in the  
    system. The scaling factor is expressed as a percentage where 100 represents  
    standard scaling (96 DPI). Common values are 100, 125, 150, and 200.  
    If no monitor is specified, returns the scaling factor for the primary display.  

### PARAMETERS 
    -Monitor <Int32>  
        Specifies the zero-based index of the monitor to check. The primary monitor is  
        index 0, secondary monitor is 1, and so on. Valid values range from 0 to 32.  
        Required?                    false  
        Position?                    1  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Get-ForegroundWindow 
````PowerShell 

   Get-ForegroundWindow  
```` 

### SYNTAX 
````PowerShell 
Get-ForegroundWindow [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Get-KnownFolderPath 
````PowerShell 

   Get-KnownFolderPath                  --> folder  
```` 

### SYNOPSIS 
    Gets the path of a Windows known folder using the Windows Shell32 API.  

### SYNTAX 
````PowerShell 
Get-KnownFolderPath [-KnownFolder] <String> [<CommonParameters>] 
```` 

### DESCRIPTION 
    Retrieves the path of a specified Windows known folder using the Shell32 API's  
    SHGetKnownFolderPath function. This method is more reliable than using  
    environment variables as it works consistently across different Windows versions  
    and language settings. Supports all standard Windows known folders like  
    Documents, Downloads, AppData etc.  

### PARAMETERS 
    -KnownFolder <String>  
        Specifies the name of the Windows known folder to retrieve. Must be one of the  
        predefined folder names like 'Documents', 'Downloads', etc. The function will  
        return the full path to this folder.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Get-MonitorCount 
````PowerShell 

   Get-MonitorCount  
```` 

### SYNOPSIS 
    Gets the total number of display monitors connected to the system.  

### SYNTAX 
````PowerShell 
Get-MonitorCount [<CommonParameters>] 
```` 

### DESCRIPTION 
    Uses the Windows Presentation Foundation (WPF) Screen helper class to accurately  
    determine the number of physical display monitors currently connected to the  
    system. This includes both active and detected but disabled monitors.  

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Get-MpCmdRunPath 
````PowerShell 

   Get-MpCmdRunPath  
```` 

### SYNOPSIS 
    Gets the path to the Windows Defender MpCmdRun.exe executable.  

### SYNTAX 
````PowerShell 
Get-MpCmdRunPath [<CommonParameters>] 
```` 

### DESCRIPTION 
    Locates and returns the full path to the Windows Defender command-line utility  
    (MpCmdRun.exe). The function checks the standard installation location in  
    Program Files and provides appropriate error handling if the file is not found.  

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Get-OpenedFileHandleProcesses 
````PowerShell 

   Get-OpenedFileHandleProcesses  
```` 

### SYNOPSIS 
    Retrieves processes that have open file handles to specified files.  

### SYNTAX 
````PowerShell 
Get-OpenedFileHandleProcesses [-FilePath] <String[]> [<CommonParameters>] 
```` 

### DESCRIPTION 
    Uses the Sysinternals handle.exe tool to identify processes that currently have  
    open handles to one or more specified files. This is useful for determining  
    which processes are preventing file operations like deletion or modification.  
    The function requires handle.exe from the Sysinternals suite to be installed  
    and available in the system path. It parses the output from handle.exe to  
    identify processes with open handles to the specified files and returns  
    detailed information about those processes.  

### PARAMETERS 
    -FilePath <String[]>  
        The path to the file(s) to check for open handles. Supports pipeline input.  
        Multiple file paths can be provided to check multiple files at once.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Get-PowershellMainWindow 
````PowerShell 

   Get-PowershellMainWindow  
```` 

### SYNOPSIS 
    Returns a window helper object for the PowerShell terminal's main window.  

### SYNTAX 
````PowerShell 
Get-PowershellMainWindow [<CommonParameters>] 
```` 

### DESCRIPTION 
    Retrieves a WindowObj helper object that represents the main window of the current  
    PowerShell host process. This allows manipulation and interaction with the  
    terminal window itself.  

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Get-PowershellMainWindowProcess 
````PowerShell 

   Get-PowershellMainWindowProcess  
```` 

### SYNOPSIS 
    Returns the process object for the window hosting the PowerShell terminal.  

### SYNTAX 
````PowerShell 
Get-PowershellMainWindowProcess [<CommonParameters>] 
```` 

### DESCRIPTION 
    Traverses up the process tree starting from the current PowerShell process to  
    locate the parent window responsible for hosting the terminal. If the immediate  
    parent process doesn't have a main window handle, it searches for similar  
    processes that do have main windows. This is useful for identifying the actual  
    terminal window process (like Windows Terminal, ConHost, etc.) that contains  
    the PowerShell session.  

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Get-Window 
````PowerShell 

   Get-Window                           --> gwin, window  
```` 

### SYNOPSIS 
    Gets window information for specified processes or window handles.  

### SYNTAX 
````PowerShell 
Get-Window [[-ProcessName] <String>] [-ProcessId <Int32>] [-WindowHandle <Int64>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Retrieves window information using process name, ID, or window handle. Returns  
    WindowObj objects containing details about the main windows of matching processes.  
    Supports wildcards when searching by process name.  

### PARAMETERS 
    -ProcessName <String>  
        Name of the process(es) to get window information for. Supports wildcards.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -ProcessId <Int32>  
        Process ID to get window information for. Must be a valid running process ID.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       true (ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -WindowHandle <Int64>  
        Window handle to get information for. Must be a valid window handle number.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       true (ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Get-WindowsIsUpToDate 
````PowerShell 

   Get-WindowsIsUpToDate                --> updatewindows  
```` 

### SYNOPSIS 
    Checks if Windows is up to date and optionally installs available updates.  

### SYNTAX 
````PowerShell 
Get-WindowsIsUpToDate [-AutoInstall] [-AutoReboot] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function checks for both Windows updates and winget package updates. It can  
    display available updates or automatically install them. The function requires  
    administrative privileges to install Windows updates and can optionally reboot  
    the system if updates require a restart.  

### PARAMETERS 
    -AutoInstall [<SwitchParameter>]  
        Automatically install available Windows and winget updates instead of just  
        checking for their availability.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AutoReboot [<SwitchParameter>]  
        Automatically reboot the system if installed updates require a restart. This  
        parameter only has effect when AutoInstall is also specified.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Initialize-ScheduledTaskScripts 
````PowerShell 

   Initialize-ScheduledTaskScripts  
```` 

### SYNOPSIS 
    Creates scheduled tasks that run PowerShell scripts at specified intervals.  

### SYNTAX 
````PowerShell 
Initialize-ScheduledTaskScripts [[-FilePath] <String>] [[-Prefix] <String>] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Creates and configures scheduled tasks that execute PowerShell scripts at various  
    intervals including:  
    - System startup  
    - User logon  
    - Every hour of specific days (e.g., Monday at 13:00)  
    - Daily at specific hours (e.g., every day at 15:00)  
    Each task runs with elevated privileges under the current user's context.  

### PARAMETERS 
    -FilePath <String>  
        The directory path where the PowerShell scripts for each task will be created.  
        If not specified, scripts are created in a 'ScheduledTasks' folder in the parent  
        directory.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Prefix <String>  
        A prefix string added to all task names for grouping and identification.  
        Default is "PS".  
        Required?                    false  
        Position?                    2  
        Default value                PS  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Shows what would happen if the cmdlet runs. The cmdlet is not run.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Prompts you for confirmation before running the cmdlet.  
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

<br/><hr/><hr/><br/>
 

##	Pop-Window 
````PowerShell 

   Pop-Window                           --> popw  
```` 

### SYNOPSIS 
    Pops the last active window helper from the stack with optional modifications.  

### SYNTAX 
````PowerShell 
Pop-Window [-Maximize] [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <Byte>] [-Focus] [-FadeIn] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ShowWindow] [-Monitor <Int32>] [<CommonParameters>]  
   Pop-Window [-Maximize] [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <Byte>] -Width <Int32> -Height <Int32> [-Focus] [-FadeIn] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ShowWindow] [-Monitor <Int32>] [<CommonParameters>]  
   Pop-Window [-Maximize] [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <Byte>] -X <Int32> -Y <Int32> [-Focus] [-FadeIn] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ShowWindow] [-Monitor <Int32>] [<CommonParameters>]  
   Pop-Window [-NoModify] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Pops a window helper from the stack and optionally applies window transformations.  
    If the stack is empty or contains invalid windows, returns the currently focused  
    window. This function allows you to manipulate windows that were previously saved  
    with Push-Window, applying various positioning, sizing, and visual effects.  

### PARAMETERS 
    -Maximize [<SwitchParameter>]  
        Maximizes the window after popping it from the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Minimize [<SwitchParameter>]  
        Minimizes the window after popping it from the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Restore [<SwitchParameter>]  
        Restores the window to its normal state after popping it from the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Hide [<SwitchParameter>]  
        Hides the window after popping it from the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Show [<SwitchParameter>]  
        Ensures the window is visible after popping it from the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoBorders [<SwitchParameter>]  
        Removes the window borders after popping it from the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AlwaysOnTop [<SwitchParameter>]  
        Sets the window to always be on top after popping it from the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Opacity <Byte>  
        Sets the window opacity (0-255) after popping it from the stack.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -X <Int32>  
        Sets the window X position after popping it from the stack.  
        Required?                    true  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Y <Int32>  
        Sets the window Y position after popping it from the stack.  
        Required?                    true  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Width <Int32>  
        Sets the window width after popping it from the stack.  
        Required?                    true  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Height <Int32>  
        Sets the window height after popping it from the stack.  
        Required?                    true  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Focus [<SwitchParameter>]  
        Focuses the window after popping it from the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FadeIn [<SwitchParameter>]  
        Applies a fade-in effect when showing the window after popping it from the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoModify [<SwitchParameter>]  
        Pops the window but doesn't apply any modifications (just returns it).  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Left [<SwitchParameter>]  
        Places window on left half of screen after popping it from the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Right [<SwitchParameter>]  
        Places window on right half of screen after popping it from the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Top [<SwitchParameter>]  
        Places window on top half of screen after popping it from the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Bottom [<SwitchParameter>]  
        Places window on bottom half of screen after popping it from the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Centered [<SwitchParameter>]  
        Centers window on screen after popping it from the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ShowWindow [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Monitor <Int32>  
        Specifies the monitor to move the window to after popping from the stack:  
          0 = Primary monitor (default)  
          1..n = Specific monitor (1-based index)  
          -2 = Secondary monitor (uses $Global:DefaultSecondaryMonitor if defined)  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Push-Window 
````PowerShell 

   Push-Window                          --> pushw  
```` 

### SYNOPSIS 
    Pushes the current window onto the window stack with optional modifications.  

### SYNTAX 
````PowerShell 
Push-Window [-Maximize] [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <Byte>] [-Focus] [-FadeOut] [-PassThru] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ShowWindow] [-Monitor <Int32>] [<CommonParameters>]  
   Push-Window [-Maximize] [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <Byte>] -Width <Int32> -Height <Int32> [-Focus] [-FadeOut] [-PassThru] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ShowWindow] [-Monitor <Int32>] [<CommonParameters>]  
   Push-Window [-Maximize] [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <Byte>] -X <Int32> -Y <Int32> [-Focus] [-FadeOut] [-PassThru] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ShowWindow] [-Monitor <Int32>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Pushes a window helper for the currently focused window onto the stack.  
    Allows applying various window transformations before or after pushing.  
    This function captures the current window and stores it for later retrieval  
    with Pop-Window, while optionally applying positioning, sizing, and visual  
    effects.  

### PARAMETERS 
    -Maximize [<SwitchParameter>]  
        Maximizes the window before pushing it onto the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Minimize [<SwitchParameter>]  
        Minimizes the window before pushing it onto the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Restore [<SwitchParameter>]  
        Restores the window to its normal state before pushing it onto the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Hide [<SwitchParameter>]  
        Hides the window before pushing it onto the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Show [<SwitchParameter>]  
        Ensures the window is visible before pushing it onto the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoBorders [<SwitchParameter>]  
        Removes the window borders before pushing it onto the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AlwaysOnTop [<SwitchParameter>]  
        Sets the window to always be on top before pushing it onto the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Opacity <Byte>  
        Sets the window opacity (0-255) before pushing it onto the stack.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -X <Int32>  
        Sets the window X position before pushing it onto the stack.  
        Required?                    true  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Y <Int32>  
        Sets the window Y position before pushing it onto the stack.  
        Required?                    true  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Width <Int32>  
        Sets the window width before pushing it onto the stack.  
        Required?                    true  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Height <Int32>  
        Sets the window height before pushing it onto the stack.  
        Required?                    true  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Focus [<SwitchParameter>]  
        Focuses the window before pushing it onto the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FadeOut [<SwitchParameter>]  
        Applies a fade-out effect before pushing the window onto the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PassThru [<SwitchParameter>]  
        Returns the window object after pushing it onto the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Left [<SwitchParameter>]  
        Places window on left half of screen before pushing it onto the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Right [<SwitchParameter>]  
        Places window on right half of screen before pushing it onto the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Top [<SwitchParameter>]  
        Places window on top half of screen before pushing it onto the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Bottom [<SwitchParameter>]  
        Places window on bottom half of screen before pushing it onto the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Centered [<SwitchParameter>]  
        Centers window on screen before pushing it onto the stack.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ShowWindow [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Monitor <Int32>  
        Specifies the monitor to move the window to before pushing onto the stack:  
          0 = Primary monitor (default)  
          1..n = Specific monitor (1-based index)  
          -2 = Secondary monitor (uses $Global:DefaultSecondaryMonitor if defined)  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Send-Key 
````PowerShell 

   Send-Key                             --> invokekeys, sendkeys  
```` 

### SYNOPSIS 
    Sends simulated keystrokes to a window or process.  

### SYNTAX 
````PowerShell 
Send-Key [-KeysToSend] <String[]> [-ProcessName <String>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [<CommonParameters>]  
   Send-Key [-KeysToSend] <String[]> [-ProcessId <Int32>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [<CommonParameters>]  
   Send-Key [-KeysToSend] <String[]> [-WindowHandle <Int64>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function sends keyboard input to a target window or process using the  
    Windows Script Host Shell object. It can target windows by process name,  
    process ID, or window handle. The function supports special key sequences,  
    escape characters, and various timing options for reliable key delivery.  

### PARAMETERS 
    -KeysToSend <String[]>  
        The keyboard input to send as an array of strings. Supports special key  
        sequences like {ENTER}, {TAB}, {F1}, etc. Each string in the array is  
        processed sequentially with optional delays between them.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -ProcessName <String>  
        The name of the target process to send keys to. Supports wildcard patterns  
        for flexible process matching.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       true (ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -ProcessId <Int32>  
        The process ID of the target process to send keys to. Provides precise  
        targeting when multiple processes have similar names.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       true (ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -WindowHandle <Int64>  
        The window handle (HWND) of the target window to send keys to. Offers  
        direct window targeting when the handle is known.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       true (ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyEscape [<SwitchParameter>]  
        When specified, escapes curly braces in the input text so they are sent as  
        literal characters rather than interpreted as special key sequences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]  
        When specified, keeps keyboard focus on the target window after sending  
        keys instead of returning focus to the PowerShell window.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter [<SwitchParameter>]  
        When specified, converts newline characters to Shift+Enter key sequences  
        instead of regular Enter key sequences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <Int32>  
        The delay in milliseconds between sending different key sequences. Helps  
        ensure reliable delivery when sending multiple key strings.  
        Required?                    false  
        Position?                    named  
        Default value                10  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Set-ClipboardFiles 
````PowerShell 

   Set-ClipboardFiles                   --> setclipfiles  
```` 

### SYNOPSIS 
    Sets files to the Windows clipboard for file operations like copy/paste.  

### SYNTAX 
````PowerShell 
Set-ClipboardFiles [-InputObject] <String[]> [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function copies one or more file paths to the Windows clipboard,  
    enabling file operations like paste in Windows Explorer. It handles both  
    STA and MTA threading modes automatically, ensuring compatibility across  
    different PowerShell execution contexts. The function validates file  
    existence before adding paths to the clipboard.  

### PARAMETERS 
    -InputObject <String[]>  
        Array of file paths to add to the clipboard. Accepts pipeline input and  
        supports various aliases for compatibility with different object properties.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
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

<br/><hr/><hr/><br/>
 

##	Set-ForegroundWindow 
````PowerShell 

   Set-ForegroundWindow  
```` 

### SYNOPSIS 
    Brings the specified window to the foreground and makes it the active window.  

### SYNTAX 
````PowerShell 
Set-ForegroundWindow [-WindowHandle] <IntPtr> [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Makes a window the foreground window using multiple Win32 API methods for maximum  
    reliability. First attempts using SwitchToThisWindow API, then falls back to  
    SetForegroundWindow if needed. This dual approach ensures consistent window  
    activation across different Windows versions and scenarios.  

### PARAMETERS 
    -WindowHandle <IntPtr>  
        An IntPtr handle to the target window. This handle can be obtained from Windows  
        API calls or PowerShell window management functions like Get-Process  
        MainWindowHandle.  
        Required?                    true  
        Position?                    1  
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

<br/><hr/><hr/><br/>
 

##	Set-KnownFolderPath 
````PowerShell 

   Set-KnownFolderPath  
```` 

### SYNOPSIS 
    Modifies the physical path of a Windows known folder.  

### SYNTAX 
````PowerShell 
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

<br/><hr/><hr/><br/>
 

##	Set-TaskbarAlignment 
````PowerShell 

   Set-TaskbarAlignment                 --> Set-TaskAlign  
```` 

### SYNOPSIS 
    Configures Windows 11+ taskbar alignment between center and left positions.  

### SYNTAX 
````PowerShell 
Set-TaskbarAlignment [-Justify] <String> [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Sets the taskbar alignment in Windows 11 and newer versions by modifying the  
    registry key 'TaskbarAl' under HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\  
    Explorer\Advanced. The alignment can be set to either center (value 1) or left  
    (value 0).  

### PARAMETERS 
    -Justify <String>  
        Specifies the desired taskbar alignment: 'Center' or 'Left'. This setting is  
        converted to the appropriate registry value (1 for Center, 0 for Left).  
        Required?                    true  
        Position?                    1  
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

<br/><hr/><hr/><br/>
 

##	Set-WindowPosition 
````PowerShell 

   Set-WindowPosition                   --> wp  
```` 

### SYNOPSIS 
    Positions and resizes windows on specified monitors with various layout options.  

### SYNTAX 
````PowerShell 
Set-WindowPosition [-Monitor <Int32>] [-NoBorders] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-PassThru] [-SideBySide] [-FocusWindow] [-SetForeground] [-Maximize] [-KeysToSend <String[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>]  
   Set-WindowPosition [[-ProcessName] <String>] [-Monitor <Int32>] [-NoBorders] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-PassThru] [-SideBySide] [-FocusWindow] [-SetForeground] [-Maximize] [-KeysToSend <String[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>]  
   Set-WindowPosition [-Process <Process>] [-Monitor <Int32>] [-NoBorders] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-PassThru] [-SideBySide] [-FocusWindow] [-SetForeground] [-Maximize] [-KeysToSend <String[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>]  
   Set-WindowPosition [-WindowHelper <WindowObj[]>] [-Monitor <Int32>] [-NoBorders] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-PassThru] [-SideBySide] [-FocusWindow] [-SetForeground] [-Maximize] [-KeysToSend <String[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Provides precise control over window positioning and sizing, supporting multiple  
    monitors, border removal, and various preset positions like left/right split,  
    top/bottom split, and center placement. Windows can be positioned by coordinates  
    or using predefined layouts.  

### PARAMETERS 
    -ProcessName <String>  
        The process name of the window to position (defaults to PowerShell window)  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -Process <Process>  
        Process or processes whose windows need positioning (defaults to PowerShell window)  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -WindowHelper <WindowObj[]>  
        Window helper object for direct window manipulation  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -Monitor <Int32>  
        Monitor selection: 0=primary, 1+=specific monitor, -1=current, -2=secondary  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoBorders [<SwitchParameter>]  
        Removes window borders and title bar for a cleaner appearance  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Width <Int32>  
        Window width in pixels (-1 for automatic sizing)  
        Required?                    false  
        Position?                    named  
        Default value                -999999  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Height <Int32>  
        Window height in pixels (-1 for automatic sizing)  
        Required?                    false  
        Position?                    named  
        Default value                -999999  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -X <Int32>  
        Window horizontal position (-1 for automatic)  
        Required?                    false  
        Position?                    named  
        Default value                -999999  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Y <Int32>  
        Window vertical position (-1 for automatic)  
        Required?                    false  
        Position?                    named  
        Default value                -999999  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Left [<SwitchParameter>]  
        Places window on left half of screen  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Right [<SwitchParameter>]  
        Places window on right half of screen  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Top [<SwitchParameter>]  
        Places window on top half of screen  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Bottom [<SwitchParameter>]  
        Places window on bottom half of screen  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Centered [<SwitchParameter>]  
        Centers window on screen  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Fullscreen [<SwitchParameter>]  
        Maximizes window to fill entire screen  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -RestoreFocus [<SwitchParameter>]  
        Returns focus to PowerShell window after positioning  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PassThru [<SwitchParameter>]  
        Returns window helper object for further manipulation  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SideBySide [<SwitchParameter>]  
        Will either set the window fullscreen on a different monitor than Powershell, or  
        side by side with Powershell on the same monitor  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FocusWindow [<SwitchParameter>]  
        Focus the window after positioning  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SetForeground [<SwitchParameter>]  
        Set the window to foreground after positioning  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Maximize [<SwitchParameter>]  
        Maximize the window after positioning  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -KeysToSend <String[]>  
        Keystrokes to send to the window after positioning  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyEscape [<SwitchParameter>]  
        Escape control characters and modifiers when sending keys  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]  
        Hold keyboard focus on target window when sending keys  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter [<SwitchParameter>]  
        Use Shift+Enter instead of Enter when sending keys  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <Int32>  
        Delay between different input strings in milliseconds when sending keys  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Switch to use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Switch to clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Switch to store settings only in persistent preferences without affecting  
        session  
        Required?                    false  
        Position?                    named  
        Default value                False  
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

<br/><hr/><hr/><br/>
 

##	Set-WindowPositionForSecondary 
````PowerShell 

   Set-WindowPositionForSecondary       --> wps  
```` 

### SYNOPSIS 
    Positions a window on the secondary monitor with specified layout options.  

### SYNTAX 
````PowerShell 
Set-WindowPositionForSecondary [[-Process] <Process[]>] [-Monitor <Int32>] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-FullScreen] [-NoBorders] [-RestoreFocus] [-FocusWindow] [-SetForeground] [-Maximize] [-KeysToSend <String[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-PassThru] [-SideBySide] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function allows positioning windows on a configured secondary monitor using  
    Set-WindowPosition with various layout options including alignment, size, and  
    border settings. It handles monitor selection based on global configuration and  
    provides a convenient wrapper for secondary monitor window positioning.  

### PARAMETERS 
    -Process <Process[]>  
        The process or processes containing the windows to position.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -Monitor <Int32>  
        The monitor to use (0=default, 1=secondary, -1=discard, -2=configured secondary).  
        Required?                    false  
        Position?                    named  
        Default value                -2  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Width <Int32>  
        The desired width of the window in pixels.  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Height <Int32>  
        The desired height of the window in pixels.  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -X <Int32>  
        The desired X coordinate for window placement.  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Y <Int32>  
        The desired Y coordinate for window placement.  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Left [<SwitchParameter>]  
        Place the window on the left side of the screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Right [<SwitchParameter>]  
        Place the window on the right side of the screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Top [<SwitchParameter>]  
        Place the window at the top of the screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Bottom [<SwitchParameter>]  
        Place the window at the bottom of the screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Centered [<SwitchParameter>]  
        Center the window on the screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FullScreen [<SwitchParameter>]  
        Maximize the window to fill the screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoBorders [<SwitchParameter>]  
        Remove window borders and title bar.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -RestoreFocus [<SwitchParameter>]  
        Return focus to the PowerShell window after positioning.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FocusWindow [<SwitchParameter>]  
        Focus the window after positioning.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SetForeground [<SwitchParameter>]  
        Set the window to foreground after positioning.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Maximize [<SwitchParameter>]  
        Maximize the window after positioning.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -KeysToSend <String[]>  
        Keystrokes to send to the window after positioning.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyEscape [<SwitchParameter>]  
        Escape control characters and modifiers when sending keys  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]  
        Hold keyboard focus on target window when sending keys  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter [<SwitchParameter>]  
        Use Shift+Enter instead of Enter when sending keys  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <Int32>  
        Delay between different input strings in milliseconds when sending keys  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PassThru [<SwitchParameter>]  
        Return the Process object after positioning.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SideBySide [<SwitchParameter>]  
        Place window side by side with PowerShell on the same monitor.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Use alternative settings stored in session for AI preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Clear alternative settings stored in session for AI preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Store settings only in persistent preferences without affecting session.  
        Required?                    false  
        Position?                    named  
        Default value                False  
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

<br/><hr/><hr/><br/>
 

##	Set-WindowsWallpaper 
````PowerShell 

   Set-WindowsWallpaper                 --> setaswallpaper  
```` 

### SYNOPSIS 
    Sets a random wallpaper from a specified directory.  

### SYNTAX 
````PowerShell 
Set-WindowsWallpaper [[-InputObject] <Object>] [-AllDrives] [-NoRecurse] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Selects a random image file from the specified directory and sets it as the  
    Windows desktop wallpaper. Supports JPG/JPEG image formats and configures the  
    wallpaper to "fit" the screen by default.  

### PARAMETERS 
    -InputObject <Object>  
        The file path pattern to search for wallpaper images. Supports wildcards and  
        recursive search. This is the path to the directory containing the wallpaper  
        images. When multiple images are found, one is selected at random.  
        Required?                    false  
        Position?                    1  
        Default value                .\  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -AllDrives [<SwitchParameter>]  
        Search across all available drives.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoRecurse [<SwitchParameter>]  
        Do not recurse into subdirectories.  
        Required?                    false  
        Position?                    named  
        Default value                False  
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

<br/><hr/><hr/><br/>
 

##	Start-ProcessWithPriority 
````PowerShell 

   Start-ProcessWithPriority            --> nice  
```` 

### SYNOPSIS 
    Starts a process with a specified priority level.  

### SYNTAX 
````PowerShell 
Start-ProcessWithPriority [-FilePath] <String> [[-ArgumentList] <String[]>] [[-Priority] <String>] [-NoWait] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Launches an executable with a customizable priority level and provides options for  
    waiting and process handling. This function wraps Start-Process with additional  
    functionality to control process priority and execution behavior.  

### PARAMETERS 
    -FilePath <String>  
        The path to the executable file to run. This parameter is mandatory and must  
        contain a valid path to an executable file.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ArgumentList <String[]>  
        Arguments to pass to the executable. Multiple arguments can be provided as an  
        array of strings.  
        Required?                    false  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Priority <String>  
        Sets the process priority level. Valid values are: Idle, BelowNormal, Low,  
        Normal, AboveNormal, High, RealTime. Defaults to BelowNormal. Higher priorities  
        may impact system performance.  
        Required?                    false  
        Position?                    3  
        Default value                BelowNormal  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoWait [<SwitchParameter>]  
        Switch to determine if the function should wait for process completion. When  
        specified, the function returns immediately after starting the process.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PassThru [<SwitchParameter>]  
        Switch to return the process object after creation. Useful when you need to  
        manipulate the process after it starts.  
        Required?                    false  
        Position?                    named  
        Default value                False  
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

<br/><hr/><hr/><br/>
 

##	Test-PathUsingWindowsDefender 
````PowerShell 

   Test-PathUsingWindowsDefender        --> HasNoVirus, virusscan  
```` 

### SYNOPSIS 
    Scans files or directories for malware using Windows Defender.  

### SYNTAX 
````PowerShell 
Test-PathUsingWindowsDefender [-FilePath] <String> [-EnableRemediation] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Performs a targeted scan of specified files or directories using Windows  
    Defender's command-line interface (MpCmdRun.exe). The function can either scan  
    in detection-only mode or with automatic threat remediation enabled. Returns  
    true if no threats are detected, false if threats are found or scan fails.  

### PARAMETERS 
    -FilePath <String>  
        The full or relative path to the file or directory to be scanned. The path will  
        be expanded to its full form before scanning. Accepts pipeline input and  
        supports both individual files and directories.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -EnableRemediation [<SwitchParameter>]  
        When specified, allows Windows Defender to automatically remove or quarantine  
        any detected threats. If omitted, the scan will only detect and report threats  
        without taking any remediation action.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Windows.WireGuard<hr/> 

##	Add-WireGuardPeer 
````PowerShell 

   Add-WireGuardPeer  
```` 

### SYNTAX 
````PowerShell 
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
        Show QR code in the console for easy mobile setup  
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

<br/><hr/><hr/><br/>
 

##	EnsureWireGuard 
````PowerShell 

   EnsureWireGuard  
```` 

### SYNOPSIS 
    Ensures WireGuard VPN service is installed and running via Docker container.  

### SYNTAX 
````PowerShell 
EnsureWireGuard [[-ContainerName] <String>] [[-VolumeName] <String>] [[-ServicePort] <Int32>] [[-HealthCheckTimeout] <Int32>] [[-HealthCheckInterval] <Int32>] [[-ImageName] <String>] [[-PUID] <String>] [[-PGID] <String>] [[-TimeZone] <String>] [-ShowWindow] [-NoBorders] [-Width <Int32>] [-Height <Int32>] [-Left] [-Right] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-SideBySide] [-FocusWindow] [-SetForeground] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-SessionOnly] [-ClearSession] [-SkipSession] [-Force] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function sets up and manages the WireGuard VPN service using Docker  
    Desktop. It automatically ensures Docker Desktop is running, pulls the latest  
    WireGuard Docker image, creates persistent storage volumes, and manages the  
    container lifecycle including health monitoring and restart capabilities.  
    WireGuard is a simple, fast, and modern VPN that utilizes state-of-the-art  
    cryptography. It offers superior performance and simplicity compared to  
    traditional VPN solutions like OpenVPN, with minimal configuration overhead  
    and excellent cross-platform support.  

### PARAMETERS 
    -ContainerName <String>  
        The name for the Docker container. Default: "wireguard"  
        Required?                    false  
        Position?                    1  
        Default value                wireguard  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VolumeName <String>  
        The name for the Docker volume for persistent storage of configuration files  
        and client certificates. Default: "wireguard_data"  
        Required?                    false  
        Position?                    2  
        Default value                wireguard_data  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ServicePort <Int32>  
        The UDP port number for the WireGuard service to listen on. Must be between  
        1-65535. Default: 51839  
        Required?                    false  
        Position?                    3  
        Default value                51839  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HealthCheckTimeout <Int32>  
        Maximum time in seconds to wait for service health check before timing out.  
        Must be between 10-300 seconds. Default: 60  
        Required?                    false  
        Position?                    4  
        Default value                60  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HealthCheckInterval <Int32>  
        Interval in seconds between health check attempts during startup validation.  
        Must be between 1-10 seconds. Default: 3  
        Required?                    false  
        Position?                    5  
        Default value                3  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ImageName <String>  
        Custom Docker image name to use instead of the default. If not specified,  
        uses the official "linuxserver/wireguard" image from Docker Hub.  
        Required?                    false  
        Position?                    6  
        Default value                linuxserver/wireguard  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PUID <String>  
        User ID for file permissions inside the container. Should match your host  
        system user ID for proper file access. Default: "1000"  
        Required?                    false  
        Position?                    7  
        Default value                1000  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PGID <String>  
        Group ID for file permissions inside the container. Should match your host  
        system group ID for proper file access. Default: "1000"  
        Required?                    false  
        Position?                    8  
        Default value                1000  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -TimeZone <String>  
        Timezone identifier to use for container logging and timestamps. Uses standard  
        timezone database format. Default: "Etc/UTC"  
        Required?                    false  
        Position?                    9  
        Default value                Etc/UTC  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ShowWindow [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoBorders [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Width <Int32>  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Height <Int32>  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Left [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Right [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Bottom [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Centered [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Fullscreen [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -RestoreFocus [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SideBySide [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FocusWindow [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SetForeground [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyEscape [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <Int32>  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Force [<SwitchParameter>]  
        Forces complete rebuilding of Docker container and removes all existing data.  
        This will stop and remove existing containers and volumes, pull the latest  
        WireGuard image, and create a fresh container with clean configuration.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

### NOTES 
````PowerShell 

       To generate client configurations after setup:  
       - Run: docker exec -it wireguard /app/show-peer 1  
       For Android 10 and above:  
       - Install the official WireGuard app from Google Play Store  
       - Scan the QR code or import the config file to connect  
       For more information, see: https://www.wireguard.com/  
       ##############################################################################  
   -------------------------- EXAMPLE 1 --------------------------  
   PS C:\> EnsureWireGuard  
   -------------------------- EXAMPLE 2 --------------------------  
   PS C:\> EnsureWireGuard -ContainerName "my_wireguard" -ServicePort 51821  
   -------------------------- EXAMPLE 3 --------------------------  
   PS C:\> EnsureWireGuard -VolumeName "custom_vpn_data" -HealthCheckTimeout 120  
   -------------------------- EXAMPLE 4 --------------------------  
   PS C:\> EnsureWireGuard -PUID 1001 -PGID 1001 -TimeZone "America/New_York"  
   -------------------------- EXAMPLE 5 --------------------------  
   PS C:\> EnsureWireGuard -Force  
```` 

<br/><hr/><hr/><br/>
 

##	Get-WireGuardPeerQRCode 
````PowerShell 

   Get-WireGuardPeerQRCode  
```` 

### SYNOPSIS 
    Generates a QR code for a WireGuard VPN peer configuration.  

### SYNTAX 
````PowerShell 
Get-WireGuardPeerQRCode [-PeerName] <String> [-NoDockerInitialize] [-Force] [-ContainerName <String>] [-VolumeName <String>] [-ServicePort <Int32>] [-HealthCheckTimeout <Int32>] [-HealthCheckInterval <Int32>] [-ImageName <String>] [-PUID <String>] [-PGID <String>] [-TimeZone <String>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function generates a QR code for a WireGuard VPN peer configuration that  
    can be scanned by mobile devices for easy setup. The QR code is displayed in  
    the console and can be used to quickly configure WireGuard clients on  
    smartphones and tablets. The function interacts with the linuxserver/wireguard  
    Docker container to generate QR codes for peer configurations.  

### PARAMETERS 
    -PeerName <String>  
        The name of the peer to generate a QR code for.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoDockerInitialize [<SwitchParameter>]  
        Skip Docker initialization (used when already called by parent function).  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Force [<SwitchParameter>]  
        Force rebuild of Docker container and remove existing data.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ContainerName <String>  
        The name for the Docker container.  
        Required?                    false  
        Position?                    named  
        Default value                wireguard  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VolumeName <String>  
        The name for the Docker volume for persistent storage.  
        Required?                    false  
        Position?                    named  
        Default value                wireguard_data  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ServicePort <Int32>  
        The port number for the WireGuard service.  
        Required?                    false  
        Position?                    named  
        Default value                51839  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HealthCheckTimeout <Int32>  
        Maximum time in seconds to wait for service health check.  
        Required?                    false  
        Position?                    named  
        Default value                60  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HealthCheckInterval <Int32>  
        Interval in seconds between health check attempts.  
        Required?                    false  
        Position?                    named  
        Default value                3  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ImageName <String>  
        Custom Docker image name to use.  
        Required?                    false  
        Position?                    named  
        Default value                linuxserver/wireguard  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PUID <String>  
        User ID for permissions in the container.  
        Required?                    false  
        Position?                    named  
        Default value                1000  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PGID <String>  
        Group ID for permissions in the container.  
        Required?                    false  
        Position?                    named  
        Default value                1000  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -TimeZone <String>  
        Timezone to use for the container.  
        Required?                    false  
        Position?                    named  
        Default value                Etc/UTC  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

### NOTES 
````PowerShell 

       This function requires the container to be running (use EnsureWireGuard first)  
       and the peer to exist (use Add-WireGuardPeer to create peers).  
       ##############################################################################  
   -------------------------- EXAMPLE 1 --------------------------  
   PS C:\> Get-WireGuardPeerQRCode -PeerName "MyPhone"  
   -------------------------- EXAMPLE 2 --------------------------  
   PS C:\> Get-WireGuardPeerQRCode -PeerName "Tablet" -NoDockerInitialize  
```` 

<br/><hr/><hr/><br/>
 

##	Get-WireGuardPeers 
````PowerShell 

   Get-WireGuardPeers  
```` 

### SYNOPSIS 
    Gets information about all WireGuard VPN peers configured on the system.  

### SYNTAX 
````PowerShell 
Get-WireGuardPeers [-NoDockerInitialize] [-Force] [[-ContainerName] <String>] [[-VolumeName] <String>] [[-ServicePort] <Int32>] [[-HealthCheckTimeout] <Int32>] [[-HealthCheckInterval] <Int32>] [[-ImageName] <String>] [[-PUID] <String>] [[-PGID] <String>] [[-TimeZone] <String>] [-ShowWindow] [-NoBorders] [[-Width] <Int32>] [[-Height] <Int32>] [[-Left] <Int32>] [[-Right] <Int32>] [[-Bottom] <Int32>] [-Centered] [-Fullscreen] [-RestoreFocus] [-SideBySide] [-FocusWindow] [-SetForeground] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [[-SendKeyDelayMilliSeconds] <Int32>] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function retrieves comprehensive information about all WireGuard VPN peers  
    configured on the server running in a Docker container. It provides detailed  
    information including peer names, public keys, allowed IP addresses, connection  
    endpoints, handshake status, data transfer statistics, and current connection  
    status. The function can operate in conjunction with parent functions or  
    independently manage Docker container initialization.  

### PARAMETERS 
    -NoDockerInitialize [<SwitchParameter>]  
        Skip Docker initialization process when this function is called by a parent  
        function that has already handled container setup.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Force [<SwitchParameter>]  
        Force complete rebuild of the Docker container and remove all existing  
        persistent data before starting fresh.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ContainerName <String>  
        The name identifier for the Docker container running the WireGuard service.  
        Must be a valid Docker container name.  
        Required?                    false  
        Position?                    1  
        Default value                wireguard  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VolumeName <String>  
        The name identifier for the Docker volume used for persistent storage of  
        WireGuard configuration and peer data.  
        Required?                    false  
        Position?                    2  
        Default value                wireguard_data  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ServicePort <Int32>  
        The UDP port number on which the WireGuard service listens for VPN connections.  
        Must be within valid port range.  
        Required?                    false  
        Position?                    3  
        Default value                51839  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HealthCheckTimeout <Int32>  
        Maximum time in seconds to wait for the WireGuard service to respond to health  
        check attempts before considering it failed.  
        Required?                    false  
        Position?                    4  
        Default value                60  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HealthCheckInterval <Int32>  
        Interval in seconds between consecutive health check attempts when waiting for  
        the service to become ready.  
        Required?                    false  
        Position?                    5  
        Default value                3  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ImageName <String>  
        Custom Docker image name to use instead of the default linuxserver/wireguard  
        image for the container.  
        Required?                    false  
        Position?                    6  
        Default value                linuxserver/wireguard  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PUID <String>  
        User ID for file permissions and process ownership within the Docker container.  
        Used for security and permission management.  
        Required?                    false  
        Position?                    7  
        Default value                1000  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PGID <String>  
        Group ID for file permissions and process ownership within the Docker container.  
        Used for security and permission management.  
        Required?                    false  
        Position?                    8  
        Default value                1000  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -TimeZone <String>  
        Timezone setting to use for the container's system clock and log timestamps.  
        Should be a valid timezone identifier.  
        Required?                    false  
        Position?                    9  
        Default value                Etc/UTC  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ShowWindow [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoBorders [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Width <Int32>  
        Required?                    false  
        Position?                    10  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Height <Int32>  
        Required?                    false  
        Position?                    11  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Left <Int32>  
        Required?                    false  
        Position?                    12  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Right <Int32>  
        Required?                    false  
        Position?                    13  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Bottom <Int32>  
        Required?                    false  
        Position?                    14  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Centered [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Fullscreen [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -RestoreFocus [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SideBySide [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FocusWindow [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SetForeground [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyEscape [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <Int32>  
        Required?                    false  
        Position?                    15  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

### NOTES 
````PowerShell 

       This function interacts with the linuxserver/wireguard Docker container to  
       retrieve information about configured WireGuard peers. The container must be  
       running and accessible. Use EnsureWireGuard function first if container setup  
       is required.  
       ##############################################################################  
   -------------------------- EXAMPLE 1 --------------------------  
   PS C:\> Get-WireGuardPeers  
   -------------------------- EXAMPLE 2 --------------------------  
   PS C:\> Get-WireGuardPeers -NoDockerInitialize -ContainerName "custom_wireguard" `  
                      -ServicePort 55555  
```` 

<br/><hr/><hr/><br/>
 

##	Get-WireGuardStatus 
````PowerShell 

   Get-WireGuardStatus  
```` 

### SYNOPSIS 
    Gets detailed status information about the WireGuard VPN server.  

### SYNTAX 
````PowerShell 
Get-WireGuardStatus [-NoDockerInitialize] [-Force] [[-ContainerName] <String>] [[-VolumeName] <String>] [[-ServicePort] <Int32>] [[-HealthCheckTimeout] <Int32>] [[-HealthCheckInterval] <Int32>] [[-ImageName] <String>] [[-PUID] <String>] [[-PGID] <String>] [[-TimeZone] <String>] [-ShowWindow] [-NoBorders] [[-Width] <Int32>] [[-Height] <Int32>] [[-Left] <Int32>] [[-Right] <Int32>] [[-Bottom] <Int32>] [-Centered] [-Fullscreen] [-RestoreFocus] [-SideBySide] [-FocusWindow] [-SetForeground] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [[-SendKeyDelayMilliSeconds] <Int32>] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function retrieves detailed status information about the WireGuard VPN  
    server running in a Docker container, including interface details, listening  
    port, connected peers, and server health. It provides comprehensive information  
    about the WireGuard service including server status, peer counts, uptime, and  
    network configuration details.  

### PARAMETERS 
    -NoDockerInitialize [<SwitchParameter>]  
        Skip Docker initialization (used when already called by parent function).  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Force [<SwitchParameter>]  
        Force rebuild of Docker container and remove existing data.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ContainerName <String>  
        The name for the Docker container.  
        Required?                    false  
        Position?                    1  
        Default value                wireguard  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VolumeName <String>  
        The name for the Docker volume for persistent storage.  
        Required?                    false  
        Position?                    2  
        Default value                wireguard_data  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ServicePort <Int32>  
        The port number for the WireGuard service.  
        Required?                    false  
        Position?                    3  
        Default value                51839  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HealthCheckTimeout <Int32>  
        Maximum time in seconds to wait for service health check.  
        Required?                    false  
        Position?                    4  
        Default value                60  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HealthCheckInterval <Int32>  
        Interval in seconds between health check attempts.  
        Required?                    false  
        Position?                    5  
        Default value                3  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ImageName <String>  
        Custom Docker image name to use.  
        Required?                    false  
        Position?                    6  
        Default value                linuxserver/wireguard  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PUID <String>  
        User ID for permissions in the container.  
        Required?                    false  
        Position?                    7  
        Default value                1000  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PGID <String>  
        Group ID for permissions in the container.  
        Required?                    false  
        Position?                    8  
        Default value                1000  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -TimeZone <String>  
        Timezone to use for the container.  
        Required?                    false  
        Position?                    9  
        Default value                Etc/UTC  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ShowWindow [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoBorders [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Width <Int32>  
        Required?                    false  
        Position?                    10  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Height <Int32>  
        Required?                    false  
        Position?                    11  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Left <Int32>  
        Required?                    false  
        Position?                    12  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Right <Int32>  
        Required?                    false  
        Position?                    13  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Bottom <Int32>  
        Required?                    false  
        Position?                    14  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Centered [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Fullscreen [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -RestoreFocus [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SideBySide [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FocusWindow [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SetForeground [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyEscape [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <Int32>  
        Required?                    false  
        Position?                    15  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

### NOTES 
````PowerShell 

       This function interacts with the linuxserver/wireguard Docker container to  
       retrieve status information about the WireGuard server. It requires the  
       container to be running (use EnsureWireGuard first).  
   -------------------------- EXAMPLE 1 --------------------------  
   PS C:\> Get-WireGuardStatus  
   Returns the status of the WireGuard server with default settings.  
   -------------------------- EXAMPLE 2 --------------------------  
   PS C:\> Get-WireGuardStatus -NoDockerInitialize -ContainerName "custom_wireguard"  
   Retrieves status for a custom container without initializing Docker.  
```` 

<br/><hr/><hr/><br/>
 

##	Remove-WireGuardPeer 
````PowerShell 

   Remove-WireGuardPeer  
```` 

### SYNOPSIS 
    Removes a WireGuard VPN peer configuration.  

### SYNTAX 
````PowerShell 
Remove-WireGuardPeer [-PeerName] <String> [-ContainerName <String>] [-VolumeName <String>] [-ServicePort <Int32>] [-HealthCheckTimeout <Int32>] [-HealthCheckInterval <Int32>] [-ImageName <String>] [-PUID <String>] [-PGID <String>] [-TimeZone <String>] [-Force] [-NoDockerInitialize] [-ShowWindow] [-NoBorders] [-Width <Int32>] [-Height <Int32>] [-Left] [-Right] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-SideBySide] [-FocusWindow] [-SetForeground] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function removes a WireGuard VPN peer configuration from the server running  
    in a Docker container. It deletes the peer's configuration files and updates the  
    WireGuard server to stop accepting connections from this peer. The function  
    validates peer existence before removal and provides confirmation prompts unless  
    the Force parameter is specified.  

### PARAMETERS 
    -PeerName <String>  
        The name of the peer to remove from the WireGuard configuration.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ContainerName <String>  
        The name for the Docker container running the WireGuard service.  
        Required?                    false  
        Position?                    named  
        Default value                wireguard  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VolumeName <String>  
        The name for the Docker volume used for persistent storage.  
        Required?                    false  
        Position?                    named  
        Default value                wireguard_data  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ServicePort <Int32>  
        The port number for the WireGuard service.  
        Required?                    false  
        Position?                    named  
        Default value                51839  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HealthCheckTimeout <Int32>  
        Maximum time in seconds to wait for service health check.  
        Required?                    false  
        Position?                    named  
        Default value                60  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HealthCheckInterval <Int32>  
        Interval in seconds between health check attempts.  
        Required?                    false  
        Position?                    named  
        Default value                3  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ImageName <String>  
        Custom Docker image name to use for the WireGuard container.  
        Required?                    false  
        Position?                    named  
        Default value                linuxserver/wireguard  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PUID <String>  
        User ID for permissions in the container.  
        Required?                    false  
        Position?                    named  
        Default value                1000  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PGID <String>  
        Group ID for permissions in the container.  
        Required?                    false  
        Position?                    named  
        Default value                1000  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -TimeZone <String>  
        Timezone to use for the container.  
        Required?                    false  
        Position?                    named  
        Default value                Etc/UTC  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Force [<SwitchParameter>]  
        If specified, bypasses confirmation prompts when removing the peer.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoDockerInitialize [<SwitchParameter>]  
        Skip Docker initialization when already called by parent function.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ShowWindow [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoBorders [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Width <Int32>  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Height <Int32>  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Left [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Right [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Bottom [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Centered [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Fullscreen [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -RestoreFocus [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SideBySide [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FocusWindow [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SetForeground [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyEscape [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <Int32>  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
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

### NOTES 
````PowerShell 

       This function interacts with the linuxserver/wireguard Docker container to manage  
       WireGuard peers. It requires the container to be running (use EnsureWireGuard  
       first). The function will validate peer existence before attempting removal and  
       provides detailed error handling for failed operations.  
       ##############################################################################  
   -------------------------- EXAMPLE 1 --------------------------  
   PS C:\> Remove-WireGuardPeer -PeerName "MyPhone"  
   Removes the peer named "MyPhone" with confirmation prompt.  
   -------------------------- EXAMPLE 2 --------------------------  
   PS C:\> Remove-WireGuardPeer -PeerName "Tablet" -Force  
   Removes the peer named "Tablet" without confirmation prompt.  
   -------------------------- EXAMPLE 3 --------------------------  
   PS C:\> Remove-WireGuardPeer "WorkLaptop"  
   Removes the peer using positional parameter syntax.  
```` 

<br/><hr/><hr/><br/>
 

##	Reset-WireGuardConfiguration 
````PowerShell 

   Reset-WireGuardConfiguration  
```` 

### SYNOPSIS 
    Resets the WireGuard VPN server configuration, removing all peers.  

### SYNTAX 
````PowerShell 
Reset-WireGuardConfiguration [[-ContainerName] <String>] [[-VolumeName] <String>] [[-ServicePort] <Int32>] [[-HealthCheckTimeout] <Int32>] [[-HealthCheckInterval] <Int32>] [[-ImageName] <String>] [[-PUID] <String>] [[-PGID] <String>] [[-TimeZone] <String>] [-NoDockerInitialize] [-Force] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function resets the WireGuard VPN server configuration running in a Docker  
    container by removing all peers and generating a fresh server configuration.  
    This is a destructive operation that cannot be undone and will permanently  
    remove all peer configurations. The function stops the WireGuard service,  
    removes all peer directories and configuration files, removes server keys,  
    restarts the container, and verifies that a new configuration is generated.  

### PARAMETERS 
    -ContainerName <String>  
        The name for the Docker container. Defaults to 'wireguard' if not specified.  
        Used to identify which container to operate on.  
        Required?                    false  
        Position?                    1  
        Default value                wireguard  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VolumeName <String>  
        The name for the Docker volume for persistent storage. Defaults to  
        'wireguard_data' if not specified. Used for data persistence across container  
        restarts.  
        Required?                    false  
        Position?                    2  
        Default value                wireguard_data  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ServicePort <Int32>  
        The port number for the WireGuard service. Must be between 1 and 65535.  
        Defaults to 51839. This is the UDP port WireGuard will listen on.  
        Required?                    false  
        Position?                    3  
        Default value                51839  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HealthCheckTimeout <Int32>  
        Maximum time in seconds to wait for service health check. Must be between 10  
        and 300 seconds. Defaults to 60 seconds. Used when verifying service health.  
        Required?                    false  
        Position?                    4  
        Default value                60  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HealthCheckInterval <Int32>  
        Interval in seconds between health check attempts. Must be between 1 and 10  
        seconds. Defaults to 3 seconds. Controls how often health checks are performed.  
        Required?                    false  
        Position?                    5  
        Default value                3  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ImageName <String>  
        Custom Docker image name to use. Defaults to 'linuxserver/wireguard'. This  
        allows using alternative WireGuard Docker images if needed.  
        Required?                    false  
        Position?                    6  
        Default value                linuxserver/wireguard  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PUID <String>  
        User ID for permissions in the container. Defaults to '1000'. This controls  
        file ownership and permissions within the container.  
        Required?                    false  
        Position?                    7  
        Default value                1000  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PGID <String>  
        Group ID for permissions in the container. Defaults to '1000'. This controls  
        group ownership and permissions within the container.  
        Required?                    false  
        Position?                    8  
        Default value                1000  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -TimeZone <String>  
        Timezone to use for the container. Defaults to 'Etc/UTC'. This sets the  
        container's timezone for logging and scheduling purposes.  
        Required?                    false  
        Position?                    9  
        Default value                Etc/UTC  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoDockerInitialize [<SwitchParameter>]  
        Skip Docker initialization (used when already called by parent function).  
        When specified, assumes Docker and WireGuard are already initialized.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Force [<SwitchParameter>]  
        If specified, bypasses confirmation prompts when removing all peer  
        configurations. Use with caution as this is a destructive operation.  
        Required?                    false  
        Position?                    named  
        Default value                False  
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

### NOTES 
````PowerShell 

       This function interacts with the linuxserver/wireguard Docker container to reset  
       the WireGuard server configuration. It requires the container to be running  
       (use EnsureWireGuard first). This operation will remove all peer configurations  
       and cannot be undone. The function will restart the container to regenerate  
       a fresh configuration.  
       ##############################################################################  
   -------------------------- EXAMPLE 1 --------------------------  
   PS C:\> Reset-WireGuardConfiguration  
   Resets the WireGuard configuration with default settings and prompts for  
   confirmation before proceeding.  
   -------------------------- EXAMPLE 2 --------------------------  
   PS C:\> Reset-WireGuardConfiguration -Force -ContainerName "my-wireguard"  
   Resets the WireGuard configuration for a custom container name without  
   confirmation prompts.  
```` 

<br/><hr/><hr/><br/>
