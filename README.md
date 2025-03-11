<hr/>

<img src="powershell.jpg" alt="GenXdev" width="50%"/>

<hr/>

### NAME
    GenXdev.Windows

### SYNOPSIS
    A Windows PowerShell module that provides ui Windows manipulation helpers

[![GenXdev.Windows](https://img.shields.io/powershellgallery/v/GenXdev.Windows.svg?style=flat-square&label=GenXdev.Windows)](https://www.powershellgallery.com/packages/GenXdev.Windows/) [![License](https://img.shields.io/github/license/genXdev/GenXdev.Windows?style=flat-square)](./LICENSE)

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
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [CurrentUserHasElevatedRights](#CurrentUserHasElevatedRights) |  | Checks if the current user has elevated rights. |
| [Get-ActiveUser](#Get-ActiveUser) | gusers | Retrieves a list of unique usernames from currently active system processes. |
| [Get-ChildProcesses](#Get-ChildProcesses) |  | Retrieves all processes that are descendants of the current PowerShell process. |
| [Get-CurrentFocusedProcess](#Get-CurrentFocusedProcess) |  | Retrieves the process object of the window that currently has keyboard focus. |
| [Get-DesktopScalingFactor](#Get-DesktopScalingFactor) |  | Retrieves the Windows display scaling factor (DPI setting) for a specified monitor. |
| [Get-KnownFolderPath](#Get-KnownFolderPath) | folder | Gets the path of a Windows known folder using the Windows Shell32 API. |
| [Get-MonitorCount](#Get-MonitorCount) |  | Gets the total number of display monitors connected to the system. |
| [Get-MpCmdRunPath](#Get-MpCmdRunPath) |  | Gets the path to the Windows Defender MpCmdRun.exe executable. |
| [Get-PowershellMainWindow](#Get-PowershellMainWindow) |  | Returns a window helper object for the PowerShell terminal's main window. |
| [Get-PowershellMainWindowProcess](#Get-PowershellMainWindowProcess) |  | Returns the process object for the window hosting the PowerShell terminal. |
| [Get-Window](#Get-Window) | gwin, window | Gets window information for specified processes or window handles. |
| [Initialize-ScheduledTaskScripts](#Initialize-ScheduledTaskScripts) |  | Creates scheduled tasks that run PowerShell scripts at specified intervals. |
| [Send-Key](#Send-Key) | sendkeys, invokekeys | Sends simulated keystrokes to a window or process. |
| [Set-ForegroundWindow](#Set-ForegroundWindow) |  | Brings the specified window to the foreground and makes it the active window. |
| [Set-KnownFolderPath](#Set-KnownFolderPath) |  | Modifies the physical path of a Windows known folder. |
| [Set-TaskbarAlignment](#Set-TaskbarAlignment) | set-taskalign | Configures Windows 11+ taskbar alignment between center and left positions. |
| [Set-WindowPosition](#Set-WindowPosition) | wp | Positions and resizes windows on specified monitors with various layout options. |
| [Set-WindowPositionForSecondary](#Set-WindowPositionForSecondary) | wps | Positions a window on the secondary monitor with specified layout options. |
| [Start-ProcessWithPriority](#Start-ProcessWithPriority) | nice | Starts a process with a specified priority level. |
| [Test-PathUsingWindowsDefender](#Test-PathUsingWindowsDefender) | virusscan | Scans files or directories for malware using Windows Defender. |

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
    privileges by checking their security principal roles.  

### PARAMETERS 
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
 

##	Initialize-ScheduledTaskScripts 
````PowerShell 

   Initialize-ScheduledTaskScripts  
```` 

### SYNOPSIS 
    Creates scheduled tasks that run PowerShell scripts at specified intervals.  

### SYNTAX 
````PowerShell 

   Initialize-ScheduledTaskScripts [[-FilePath] <String>] [[-Prefix] <String>] [-WhatIf] [-Confirm]   
   [<CommonParameters>]  
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
 

##	Send-Key 
````PowerShell 

   Send-Key                             --> invokekeys, sendkeys  
```` 

### SYNOPSIS 
    Sends simulated keystrokes to a window or process.  

### SYNTAX 
````PowerShell 

   Send-Key [-KeysToSend] <String[]> [-Escape] [-ProcessName <String>] [-HoldKeyboardFocus] [-ShiftEnter]   
   [-DelayMilliSeconds <Int32>] [<CommonParameters>]  
   Send-Key [-KeysToSend] <String[]> [-Escape] [-ProcessId <Int32>] [-HoldKeyboardFocus] [-ShiftEnter]   
   [-DelayMilliSeconds <Int32>] [<CommonParameters>]  
   Send-Key [-KeysToSend] <String[]> [-Escape] [-WindowHandle <Int64>] [-HoldKeyboardFocus] [-ShiftEnter]   
   [-DelayMilliSeconds <Int32>] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Sends keystrokes to either the active window or a specified process window as if  
    typed by a user. Supports special keys and keyboard modifiers through control  
    sequences like {F11}, {ENTER}, etc. Can target specific processes and maintain  
    keyboard focus.  

### PARAMETERS 
    -KeysToSend <String[]>  
        The text or key sequences to send. Supports control sequences like {F11} and  
        keyboard modifiers (+, ^, %). Can be piped or provided as array.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -Escape [<SwitchParameter>]  
        When specified, escapes special characters so they are sent as literal text  
        instead of being interpreted as control sequences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ProcessName <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       true (ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -ProcessId <Int32>  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       true (ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -WindowHandle <Int64>  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       true (ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -HoldKeyboardFocus [<SwitchParameter>]  
        Prevents returning keyboard focus to PowerShell after sending keys.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ShiftEnter [<SwitchParameter>]  
        Sends Shift+Enter instead of regular Enter for line breaks.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DelayMilliSeconds <Int32>  
        Adds delay between sending different key sequences. Useful for slower apps.  
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
    Uses the Windows Shell32 API to relocate system folders like Documents, Downloads,  
    or Desktop to a new location. The function validates the target path exists,  
    looks up the folder's unique GUID, and uses the SHSetKnownFolderPath API to  
    perform the relocation. Common use cases include moving user folders to a  
    different drive for space management or organization.  

### PARAMETERS 
    -KnownFolder <String>  
        The name of the known folder to relocate. Only specific system folders can be  
        moved to prevent system instability. Valid values are restricted to commonly  
        moved user folders.  
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

   Set-WindowPosition [[-ProcessName] <String[]>] [-Monitor <Int32>] [-NoBorders] [-Width <Int32>]   
   [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered]   
   [-Fullscreen] [-RestoreFocus] [-PassThru] [-SideBySide] [-WhatIf] [-Confirm] [<CommonParameters>]  
   Set-WindowPosition [-Process <Process[]>] [-Monitor <Int32>] [-NoBorders] [-Width <Int32>] [-Height   
   <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen]   
   [-RestoreFocus] [-PassThru] [-SideBySide] [-WhatIf] [-Confirm] [<CommonParameters>]  
   Set-WindowPosition [-WindowHelper <WindowObj[]>] [-Monitor <Int32>] [-NoBorders] [-Width <Int32>]   
   [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered]   
   [-Fullscreen] [-RestoreFocus] [-PassThru] [-SideBySide] [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Provides precise control over window positioning and sizing, supporting multiple  
    monitors, border removal, and various preset positions like left/right split,  
    top/bottom split, and center placement. Windows can be positioned by coordinates  
    or using predefined layouts.  

### PARAMETERS 
    -ProcessName <String[]>  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -Process <Process[]>  
        Process or processes whose windows need positioning (defaults to PowerShell window)  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -WindowHelper <WindowObj[]>  
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
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Height <Int32>  
        Window height in pixels (-1 for automatic sizing)  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -X <Int32>  
        Window horizontal position (-1 for automatic)  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Y <Int32>  
        Window vertical position (-1 for automatic)  
        Required?                    false  
        Position?                    named  
        Default value                -1  
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

   Set-WindowPositionForSecondary [[-Process] <Process[]>] [[-Monitor] <Int32>] [-NoBorders] [-Width   
   <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered]   
   [-Fullscreen] [-RestoreFocus] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    This function allows positioning windows on a configured secondary monitor using  
    Set-WindowPosition with various layout options including alignment, size, and  
    border settings. It handles monitor selection based on global configuration.  

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
        Position?                    1  
        Default value                -2  
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
    -Fullscreen [<SwitchParameter>]  
        Maximize the window to fill the screen.  
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
    -PassThru [<SwitchParameter>]  
        Return the Process object after positioning.  
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

   Start-ProcessWithPriority [-FilePath] <String> [[-ArgumentList] <String[]>] [[-Priority] <String>]   
   [-NoWait] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]  
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
    in detection-only mode or with automatic threat remediation enabled.  

### PARAMETERS 
    -FilePath <String>  
        The full or relative path to the file or directory to be scanned. The path will  
        be expanded to its full form before scanning.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -EnableRemediation [<SwitchParameter>]  
        When specified, allows Windows Defender to automatically remove or quarantine any  
        detected threats. If omitted, the scan will only detect and report threats.  
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
