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
| [CurrentUserHasElevatedRights](#CurrentUserHasElevatedRights) |  | Determines whether the current Windows user has administrative or backup operatorprivileges by checking their security principal roles. |
| [Set-WindowPositionForSecondary](#Set-WindowPositionForSecondary) | wps | Positions a window using Set-WindowPosition but defaults to the configuredsecondary monitor. Supports various positioning options like left/right/top/bottomalignment and border settings. |
| [Set-WindowPosition](#Set-WindowPosition) | wp | Positions a window in a configurable manner, using commandline switches |
| [Set-TaskbarAlignment](#Set-TaskbarAlignment) | Set-TaskAlign | Modifies the Windows Registry to change the taskbar alignment in Windows 11 andnewer versions between center and left positions. |
| [Set-KnownFolderPath](#Set-KnownFolderPath) |  | Uses the Windows Shell32 API to set the physical path of a known folder likeDocuments, Downloads etc. |
| [Set-ForegroundWindow](#Set-ForegroundWindow) |  | Attempts to bring the specified window to the foreground using multiple Win32 APIcalls for maximum compatibility. |
| [Send-Keys](#Send-Keys) |  | Sends keystrokes to either the active window or a specified process window as iftyped by a user. Supports special keys and modifiers through control sequences. |
| [Initialize-ScheduledTaskScripts](#Initialize-ScheduledTaskScripts) |  | Creates daily and hourly PowerShell scripts and their corresponding scheduled tasksthat will run as the current user with elevated privileges. Tasks are created for:- Every hour of every day of the week- Every hour daily- At system startup- At user logon |
| [Get-Window](#Get-Window) | gwin, window | Retrieves window information either by process id, name or window handle. Returnsa WindowObj containing details about the main window of the specifiedprocess(es). |
| [Get-PowershellMainWindowProcess](#Get-PowershellMainWindowProcess) |  | Traverses up the process tree from the current PowerShell process to find theparent window that hosts the terminal. If the immediate parent has no mainwindow, it looks for similar processes with main windows. |
| [Get-PowershellMainWindow](#Get-PowershellMainWindow) |  | Retrieves and returns a window helper object that represents the main window ofthe process hosting the current PowerShell terminal session. |
| [Get-MpCmdRunPath](#Get-MpCmdRunPath) |  | This function locates and returns the path to MpCmdRun.exe, which is the WindowsDefender command-line utility. It checks the standard installation location andprovides appropriate error handling. |
| [Get-MonitorCount](#Get-MonitorCount) |  | Uses WPF Screen Helper to determine the number of connected display monitors. |
| [Get-KnownFolderPath](#Get-KnownFolderPath) | folder | Uses the Windows Shell32 API to retrieve the path of a specified known folder.This is more reliable than using environment variables as it works acrossdifferent Windows versions and language settings. |
| [Get-DesktopScalingFactor](#Get-DesktopScalingFactor) |  | Returns the Windows display scaling factor (DPI setting) that is configured forthe specified monitor. If no monitor is specified, returns the scaling factor forthe primary monitor. |
| [Get-CurrentFocusedProcess](#Get-CurrentFocusedProcess) |  | Uses Windows API calls to identify and return the Process object associated withthe currently focused window in the Windows operating system. |
| [Get-ChildProcesses](#Get-ChildProcesses) |  | Returns processes that are children of the current PowerShell process by examiningtheir parent process chain. This includes both direct children and descendants. |
| [Get-ActiveUsers](#Get-ActiveUsers) | gusers | Retrieves all processes with their associated usernames and returns a unique listof users who have active processes running on the system. |
| [Start-ProcessWithPriority](#Start-ProcessWithPriority) | nice | Launches an executable with a customizable priority level and provides options forwaiting and process handling. |
| [Test-PathUsingWindowsDefender](#Test-PathUsingWindowsDefender) | HasNoVirus, virusscan | Executes a Windows Defender virusscan on a specified file or directory using theMpCmdRun.exe command-line utility. Returns true if no threats were found. |

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

##	Set-WindowPositionForSecondary
````PowerShell
Set-WindowPositionForSecondary       --> wps
````

### SYNOPSIS
    Positions a window on the secondary monitor with specified layout options.

### SYNTAX
````PowerShell
Set-WindowPositionForSecondary [[-Process] <Process[]>] [[-Monitor] <Int32>] [-NoBorders] 
[-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] 
[-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-PassThru] [<CommonParameters>]
````

### DESCRIPTION
    Positions a window using Set-WindowPosition but defaults to the configured
    secondary monitor. Supports various positioning options like left/right/top/bottom
    alignment and border settings.

### PARAMETERS
    -Process <Process[]>
        The process of the window to position
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -Monitor <Int32>
        The monitor to use, 0 = default, 1 = secondary, -1 is discard, -2 = configured
        secondary monitor
        Required?                    false
        Position?                    1
        Default value                -2
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -NoBorders [<SwitchParameter>]
        Open in NoBorders mode
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Width <Int32>
        The initial width of the window
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Height <Int32>
        The initial height of the window
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -X <Int32>
        The initial X position of the window
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Y <Int32>
        The initial Y position of the window
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Left [<SwitchParameter>]
        Place window on the left side of the screen
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Right [<SwitchParameter>]
        Place window on the right side of the screen
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Top [<SwitchParameter>]
        Place window on the top side of the screen
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Bottom [<SwitchParameter>]
        Place window on the bottom side of the screen
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Centered [<SwitchParameter>]
        Place window in the center of the screen
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
        Restore PowerShell window focus
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -PassThru [<SwitchParameter>]
        Returns a [System.Diagnostics.Process] object of the browser process
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

##	Set-WindowPosition
````PowerShell
Set-WindowPosition                   --> wp
````

### SYNOPSIS
    Positions a window

### SYNTAX
````PowerShell
Set-WindowPosition [[-Process] <Process[]>] [-Monitor <Int32>] [-NoBorders] [-Width 
<Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] 
[-Centered] [-Fullscreen] [-RestoreFocus] [-PassThru] [<CommonParameters>]
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
        Aliases                      
        Accept wildcard characters?  false
    -Monitor <Int32>
        The monitor to use, 0 = default, 1 = secondary, -1 is discard
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -NoBorders [<SwitchParameter>]
        Open in NoBorders mode --> -nb
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Width <Int32>
        The initial width of the window
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Height <Int32>
        The initial height of the window
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -X <Int32>
        The initial X position of the window
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Y <Int32>
        The initial Y position of the window
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Left [<SwitchParameter>]
        Place window on the left side of the screen
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Right [<SwitchParameter>]
        Place window on the right side of the screen
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Top [<SwitchParameter>]
        Place window on the top side of the screen
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Bottom [<SwitchParameter>]
        Place window on the bottom side of the screen
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Centered [<SwitchParameter>]
        Place window in the center of the screen
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
        Restore PowerShell window focus --> -bg
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -PassThru [<SwitchParameter>]
        Returns a [System.Diagnostics.Process] object of the browserprocess
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

##	Set-TaskbarAlignment
````PowerShell
Set-TaskbarAlignment                 --> Set-TaskAlign
````

### SYNOPSIS
    Sets the alignment for the Windows 11+ Taskbar.

### SYNTAX
````PowerShell
Set-TaskbarAlignment [-Justify] <String> [<CommonParameters>]
````

### DESCRIPTION
    Modifies the Windows Registry to change the taskbar alignment in Windows 11 and
    newer versions between center and left positions.

### PARAMETERS
    -Justify <String>
        Specifies the taskbar alignment. Valid values are 'Center' or 'Left'.
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

##	Set-KnownFolderPath
````PowerShell
Set-KnownFolderPath
````

### SYNOPSIS
    Sets a known folder's path using Windows Shell API.

### SYNTAX
````PowerShell
Set-KnownFolderPath [-KnownFolder] <String> [-Path] <String> [-WhatIf] [-Confirm] 
[<CommonParameters>]
````

### DESCRIPTION
    Uses the Windows Shell32 API to set the physical path of a known folder like
    Documents, Downloads etc.

### PARAMETERS
    -KnownFolder <String>
        The known folder whose path to set. Must be one of the predefined folder names.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Path <String>
        The new physical path for the known folder.
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

### NOTES
````PowerShell
    Requires elevation for system folders.
-------------------------- EXAMPLE 1 --------------------------
PS C:\> Set-KnownFolderPath -KnownFolder 'Desktop' -Path 'D:\Desktop'
````

<br/><hr/><hr/><br/>

##	Set-ForegroundWindow
````PowerShell
Set-ForegroundWindow
````

### SYNOPSIS
    Sets the specified window as the foreground window.

### SYNTAX
````PowerShell
Set-ForegroundWindow [-WindowHandle] <IntPtr> [<CommonParameters>]
````

### DESCRIPTION
    Attempts to bring the specified window to the foreground using multiple Win32 API
    calls for maximum compatibility.

### PARAMETERS
    -WindowHandle <IntPtr>
        The handle to the window that should be brought to the foreground.
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

##	Send-Keys
````PowerShell
Send-Keys
````

### SYNOPSIS
    Sends simulated keystrokes to a window.

### SYNTAX
````PowerShell
Send-Keys [-Keys] <String[]> [-Escape] [-Process <Process>] [-HoldKeyboardFocus] 
[-ShiftEnter] [-DelayMilliSeconds <Int32>] [<CommonParameters>]
````

### DESCRIPTION
    Sends keystrokes to either the active window or a specified process window as if
    typed by a user. Supports special keys and modifiers through control sequences.

### PARAMETERS
    -Keys <String[]>
        The text or key sequences to send. Control sequences like {F11} or {ENTER} are
        supported.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -Escape [<SwitchParameter>]
        When specified, escapes control sequences so they are sent as literal text.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Process <Process>
        Target process to receive the keystrokes. If not specified, sends to active
        window.
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -HoldKeyboardFocus [<SwitchParameter>]
        Maintains keyboard focus on the target window after sending keys.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -ShiftEnter [<SwitchParameter>]
        Converts line feeds to Shift+Enter instead of plain Enter.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -DelayMilliSeconds <Int32>
        Optional delay between sending keys in milliseconds.
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

##	Initialize-ScheduledTaskScripts
````PowerShell
Initialize-ScheduledTaskScripts
````

### SYNOPSIS
    Creates daily and hourly PowerShell scripts and their corresponding scheduled task.

### SYNTAX
````PowerShell
Initialize-ScheduledTaskScripts [[-FilePath] <String>] [[-Prefix] <String>] 
[<CommonParameters>]
````

### DESCRIPTION
    Creates daily and hourly PowerShell scripts and their corresponding scheduled tasks
    that will run as the current user with elevated privileges. Tasks are created for:
    - Every hour of every day of the week
    - Every hour daily
    - At system startup
    - At user logon

### PARAMETERS
    -FilePath <String>
        The directory path where the task scripts will be created. If not specified,
        defaults to a ScheduledTasks folder in the parent directory.
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Prefix <String>
        A prefix for the scheduled task names. Default is "PS".
        Required?                    false
        Position?                    2
        Default value                PS
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
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
Get-Window [-ProcessName] <String> [<CommonParameters>]
Get-Window [-ProcessId] <Int32> [<CommonParameters>]
Get-Window [-WindowHandle] <Int64> [<CommonParameters>]
````

### DESCRIPTION
    Retrieves window information either by process id, name or window handle. Returns
    a WindowObj containing details about the main window of the specified
    process(es).

### PARAMETERS
    -ProcessName <String>
        Name of the process(es) to get window information for. Supports wildcards.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -ProcessId <Int32>
        The ID of the process to get window information for.
        Required?                    true
        Position?                    1
        Default value                0
        Accept pipeline input?       true (ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -WindowHandle <Int64>
        The specific window handle to get information for.
        Required?                    true
        Position?                    1
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

##	Get-PowershellMainWindowProcess
````PowerShell
Get-PowershellMainWindowProcess
````

### SYNOPSIS
    Returns the process of the window responsible for hosting the PowerShell terminal.

### SYNTAX
````PowerShell
Get-PowershellMainWindowProcess [<CommonParameters>]
````

### DESCRIPTION
    Traverses up the process tree from the current PowerShell process to find the
    parent window that hosts the terminal. If the immediate parent has no main
    window, it looks for similar processes with main windows.

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
    Retrieves and returns a window helper object that represents the main window of
    the process hosting the current PowerShell terminal session.

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
    This function locates and returns the path to MpCmdRun.exe, which is the Windows
    Defender command-line utility. It checks the standard installation location and
    provides appropriate error handling.

### PARAMETERS
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
    Gets the number of monitors connected to the system.

### SYNTAX
````PowerShell
Get-MonitorCount [<CommonParameters>]
````

### DESCRIPTION
    Uses WPF Screen Helper to determine the number of connected display monitors.

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
    Gets the path of a known Windows folder using its name.

### SYNTAX
````PowerShell
Get-KnownFolderPath [-KnownFolder] <String> [<CommonParameters>]
````

### DESCRIPTION
    Uses the Windows Shell32 API to retrieve the path of a specified known folder.
    This is more reliable than using environment variables as it works across
    different Windows versions and language settings.

### PARAMETERS
    -KnownFolder <String>
        The name of the known folder to retrieve the path for.
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

##	Get-DesktopScalingFactor
````PowerShell
Get-DesktopScalingFactor
````

### SYNOPSIS
    Returns the scaling factor configured for a monitor.

### SYNTAX
````PowerShell
Get-DesktopScalingFactor [[-Monitor] <Int32>] [<CommonParameters>]
````

### DESCRIPTION
    Returns the Windows display scaling factor (DPI setting) that is configured for
    the specified monitor. If no monitor is specified, returns the scaling factor for
    the primary monitor.

### PARAMETERS
    -Monitor <Int32>
        The index of the monitor to check (0-based). The primary monitor is 0.
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

##	Get-CurrentFocusedProcess
````PowerShell
Get-CurrentFocusedProcess
````

### SYNOPSIS
    Retrieves the process object of the window that has keyboard focus on Windows.

### SYNTAX
````PowerShell
Get-CurrentFocusedProcess [<CommonParameters>]
````

### DESCRIPTION
    Uses Windows API calls to identify and return the Process object associated with
    the currently focused window in the Windows operating system.

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
    Retrieves child processes whose parent chain includes the current PowerShell process.

### SYNTAX
````PowerShell
Get-ChildProcesses [<CommonParameters>]
````

### DESCRIPTION
    Returns processes that are children of the current PowerShell process by examining
    their parent process chain. This includes both direct children and descendants.

### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-ActiveUsers
````PowerShell
Get-ActiveUsers                      --> gusers
````

### SYNOPSIS
    Gets a list of unique usernames for currently active processes.

### SYNTAX
````PowerShell
Get-ActiveUsers [<CommonParameters>]
````

### DESCRIPTION
    Retrieves all processes with their associated usernames and returns a unique list
    of users who have active processes running on the system.

### PARAMETERS
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
Start-ProcessWithPriority [-FilePath] <String> [[-ArgumentList] <String[]>] [[-Priority] 
<String>] [-NoWait] [-PassThru] [<CommonParameters>]
````

### DESCRIPTION
    Launches an executable with a customizable priority level and provides options for
    waiting and process handling.

### PARAMETERS
    -FilePath <String>
        The path to the executable file to run.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -ArgumentList <String[]>
        Optional arguments to pass to the executable.
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Priority <String>
        The priority level for the process. Valid values are: Idle, BelowNormal, Low,
        Normal, AboveNormal, High, RealTime. Defaults to BelowNormal.
        Required?                    false
        Position?                    3
        Default value                BelowNormal
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -NoWait [<SwitchParameter>]
        If specified, doesn't wait for the process to complete.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -PassThru [<SwitchParameter>]
        If specified, returns the process object.
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

##	Test-PathUsingWindowsDefender
````PowerShell
Test-PathUsingWindowsDefender        --> HasNoVirus, virusscan
````

### SYNOPSIS
    Executes a Windows Defender virusscan on a specified file or directory.

### SYNTAX
````PowerShell
Test-PathUsingWindowsDefender [-FilePath] <String> [-EnableRemediation] [<CommonParameters>]
````

### DESCRIPTION
    Executes a Windows Defender virusscan on a specified file or directory using the
    MpCmdRun.exe command-line utility. Returns true if no threats were found.

### PARAMETERS
    -FilePath <String>
        The path to the file or directory to be scanned.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -EnableRemediation [<SwitchParameter>]
        When specified, instructs Windows Defender to take action on found threats.
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
