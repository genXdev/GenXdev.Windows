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
[![WinOS - Windows-10 or later](https://img.shields.io/badge/WinOS-Windows--10--10.0.19041--SP0-brightgreen)](https://www.microsoft.com/en-us/windows/get-windows-10) [![GenXdev.Helpers](https://img.shields.io/powershellgallery/v/GenXdev.Helpers.svg?style=flat-square&label=GenXdev.Helpers)](https://www.powershellgallery.com/packages/GenXdev.Helpers/) [![GenXdev.FileSystem](https://img.shields.io/powershellgallery/v/GenXdev.FileSystem.svg?style=flat-square&label=GenXdev.FileSystem)](https://www.powershellgallery.com/packages/GenXdev.FileSystem/)
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
| [Get-Window](#Get-Window) |  | Returns a window helper for the main window of the specified process |
| [Set-KnownFolderPath](#Set-KnownFolderPath) |  | Sets a known folder's path using SHSetKnownFolderPath. |
| [Get-KnownFolderPath](#Get-KnownFolderPath) |  | Gets a known folder's path using SHGetKnownFolderPath. |
| [Get-DesktopScalingFactor](#Get-DesktopScalingFactor) |  | Returns the scaling factor that is configured for a monitor |
| [Set-TaskbarAlignment](#Set-TaskbarAlignment) |  | Sets the alignment for the Windows 11+ Taskbar |
| [Get-PowershellMainWindowProcess](#Get-PowershellMainWindowProcess) |  | Returns the process of the window responsible for hosting the Powershell terminal |
| [Get-PowershellMainWindow](#Get-PowershellMainWindow) |  | Returns a window helper object for the mainwindow of the process responsible for hosting the Powershell terminal |
| [Set-WindowPosition](#Set-WindowPosition) | wp | Positions a window in a configurable manner, using commandline switches |
| [Set-WindowPositionForSecondary](#Set-WindowPositionForSecondary) | wps | Positions a window like Set-WindowPosition -> wp but defaults to the configured secondairy monitor |
| [Copy-SetWindowPositionParameters](#Copy-SetWindowPositionParameters) |  | The dynamic parameter block of a proxy function. This block can be used to copy a proxy function target's parameters . |
| [Start-ProcessWithPriority](#Start-ProcessWithPriority) | nice |  |
| [Get-MpCmdRunPath](#Get-MpCmdRunPath) |  |  |
| [Test-PathUsingWindowsDefender](#Test-PathUsingWindowsDefender) | HasNoVirus, virusscan | Executes a Windows Defender virusscan on a specified file or directory using the MpCmdRun.exe command-line utility.The function returns a boolean success result, when $true it indicates no threats where find in the file. |
| [Get-CurrentFocusedProcess](#Get-CurrentFocusedProcess) |  | This function retrieves the [Process] object of the window that currently has keyboard focus on Windows. |
| [Set-ForegroundWindow](#Set-ForegroundWindow) |  |  |
| [Initialize-ScheduledTaskScripts](#Initialize-ScheduledTaskScripts) |  | Creates daily and hourly PowerShell scripts and their corresponding scheduled task that will run as system |
| [Get-MonitorCount](#Get-MonitorCount) |  |  |
| [Get-ChildProcesses](#Get-ChildProcesses) |  | Returns processes that are children of the current PowerShell process by examining their parent process chain. |
| [CurrentUserHasElivatedRights](#CurrentUserHasElivatedRights) |  |  |
| [Send-Keys](#Send-Keys) |  | Sends keys to the active window or to the window of a specified processas if typed by the user.The text strings can contain control characters like {F11} or {ENTER}they will press the corresponding keys, unless -Escape is specified.Line feeds will automatically be converted to {ENTER} control codes.and Tabs to {TAB}. |

<br/><hr/><hr/><br/>


# Cmdlets

&nbsp;<hr/>
###	GenXdev.Windows<hr/>

##	Get-Window
````PowerShell
Get-Window
````

### SYNOPSIS
    Returns a window helper for the main window of the specified process

### SYNTAX
````PowerShell
Get-Window -ProcessName <String> [<CommonParameters>]
Get-Window -WindowHandle <Int64> [<CommonParameters>]
````

### DESCRIPTION
    Returns a window helper for the main window of the specified process

### PARAMETERS
    -ProcessName <String>
        The process to get the window helper for
        Required?                    true
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -WindowHandle <Int64>
        The window handle to get the window helper for
        Required?                    true
        Position?                    named
        Default value                0
        Accept pipeline input?       false
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
    Sets a known folder's path using SHSetKnownFolderPath.

### SYNTAX
````PowerShell
Set-KnownFolderPath [-KnownFolder] <String> [-Path] <String> [<CommonParameters>]
````

### DESCRIPTION
    Sets a known folder's path using SHSetKnownFolderPath.

### PARAMETERS
    -KnownFolder <String>
        The known folder whose path to set.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -Path <String>
        The path.
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Get-KnownFolderPath
````PowerShell
Get-KnownFolderPath
````

### SYNOPSIS
    Gets a known folder's path using SHGetKnownFolderPath.

### SYNTAX
````PowerShell
Get-KnownFolderPath [-KnownFolder] <String> [<CommonParameters>]
````

### DESCRIPTION
    Gets a known folder's path using SHGetKnownFolderPath.

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

<br/><hr/><hr/><br/>

##	Get-DesktopScalingFactor
````PowerShell
Get-DesktopScalingFactor
````

### SYNOPSIS
    Returns the scaling factor that is configured for a monitor

### SYNTAX
````PowerShell
Get-DesktopScalingFactor [[-monitor] <Int32>] [<CommonParameters>]
````

### DESCRIPTION
    Returns the scaling factor that is configured for a monitor

### PARAMETERS
    -monitor <Int32>
        The monitor to return the scaling factor for, or if not supplied the primary monitor is 
        used
        Required?                    false
        Position?                    1
        Default value                0
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Set-TaskbarAlignment
````PowerShell
Set-TaskbarAlignment
````

### SYNOPSIS
    Sets the alignment for the Windows 11+ Taskbar

### SYNTAX
````PowerShell
Set-TaskbarAlignment [-Justify] <Object> [<CommonParameters>]
````

### DESCRIPTION
    Sets the alignment for the Windows 11+ Taskbar

### PARAMETERS
    -Justify <Object>
        The new alignment
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

<br/><hr/><hr/><br/>

##	Get-PowershellMainWindowProcess
````PowerShell
Get-PowershellMainWindowProcess
````

### SYNOPSIS
    Returns the process of the window responsible for hosting the Powershell terminal

### SYNTAX
````PowerShell
Get-PowershellMainWindowProcess [<CommonParameters>]
````

### DESCRIPTION
    Returns the process of the window responsible for hosting the Powershell terminal

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
    Returns a window helper object for the mainwindow of the process responsible for hosting 
    the Powershell terminal

### SYNTAX
````PowerShell
Get-PowershellMainWindow [<CommonParameters>]
````

### DESCRIPTION
    Returns a window helper object for the mainwindow of the process responsible for hosting 
    the Powershell terminal

### PARAMETERS
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
        Accept wildcard characters?  false
    -Monitor <Int32>
        The monitor to use, 0 = default, 1 = secondary, -1 is discard
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -NoBorders [<SwitchParameter>]
        Open in NoBorders mode --> -nb
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
    -Fullscreen [<SwitchParameter>]
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
    -PassThru [<SwitchParameter>]
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

<br/><hr/><hr/><br/>

##	Set-WindowPositionForSecondary
````PowerShell
Set-WindowPositionForSecondary       --> wps
````

### SYNOPSIS
    Positions a window and positions it by default on the secondairy monitor

### SYNTAX
````PowerShell
Set-WindowPositionForSecondary [[-Monitor] <Int32>] [<CommonParameters>]
````

### DESCRIPTION
    Positions a window like Set-WindowPosition -> wp but defaults to the configured secondairy 
    monitor

### PARAMETERS
    -Monitor <Int32>
        The monitor to use, 0 = default, 1 = secondary, -1 is discard
        Required?                    false
        Position?                    1
        Default value                -2
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Copy-SetWindowPositionParameters
````PowerShell
Copy-SetWindowPositionParameters
````

### SYNOPSIS
    Proxy function dynamic parameter block for the Set-WindowPosition cmdlet

### SYNTAX
````PowerShell
Copy-SetWindowPositionParameters [[-ParametersToSkip] <String[]>] [<CommonParameters>]
````

### DESCRIPTION
    The dynamic parameter block of a proxy function. This block can be used to copy a proxy 
    function target's parameters .

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

<br/><hr/><hr/><br/>

##	Start-ProcessWithPriority
````PowerShell
Start-ProcessWithPriority            --> nice
````

### SYNTAX
````PowerShell
Start-ProcessWithPriority [-FilePath] <string> [[-ArgumentList] <string[]>] [[-Priority] 
{Idle | BelowNormal | Low | Normal | AboveNormal | High | RealTime}] [-NoWait] [-PassThru] 
[<CommonParameters>]
````

### PARAMETERS
    -ArgumentList <string[]>
        Required?                    false
        Position?                    1
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -FilePath <string>
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -NoWait
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -PassThru
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Priority <string>
        Required?                    false
        Position?                    2
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

##	Get-MpCmdRunPath
````PowerShell
Get-MpCmdRunPath
````

### SYNTAX
````PowerShell
Get-MpCmdRunPath 
````

### PARAMETERS
    None

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
    MpCmdRun.exe command-line utility.
    The function returns a boolean success result, when $true it indicates no threats where 
    find in the file.

### PARAMETERS
    -FilePath <String>
        The path to the file or directory to be scanned.
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -EnableRemediation [<SwitchParameter>]
        Instructs Windows Defender to take action when the provided FilePath contains a threat.
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

<br/><hr/><hr/><br/>

##	Get-CurrentFocusedProcess
````PowerShell
Get-CurrentFocusedProcess
````

### SYNOPSIS
    Retrieves the [Process] object of the window that has keyboard focus on Windows.

### SYNTAX
````PowerShell
Get-CurrentFocusedProcess [<CommonParameters>]
````

### DESCRIPTION
    This function retrieves the [Process] object of the window that currently has keyboard 
    focus on Windows.

### PARAMETERS
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

### SYNTAX
````PowerShell
Set-ForegroundWindow [-WindowHandle] <IntPtr> [<CommonParameters>]
````

### PARAMETERS
    -WindowHandle <IntPtr>
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

<br/><hr/><hr/><br/>

##	Initialize-ScheduledTaskScripts
````PowerShell
Initialize-ScheduledTaskScripts
````

### SYNOPSIS
    Creates daily and hourly PowerShell scripts and their corresponding scheduled task

### SYNTAX
````PowerShell
Initialize-ScheduledTaskScripts [[-FilePath] <String>] [[-Prefix] <String>] 
[<CommonParameters>]
````

### DESCRIPTION
    Creates daily and hourly PowerShell scripts and their corresponding scheduled task that 
    will run as system

### PARAMETERS
    -FilePath <String>
        The path of the directory where the scripts will reside
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -Prefix <String>
        A Prefix for the Scheduled-Task names
        Required?                    false
        Position?                    2
        Default value                PS
        Accept pipeline input?       false
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

### SYNTAX
````PowerShell
Get-MonitorCount 
````

### PARAMETERS
    None

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
    Returns processes that are children of the current PowerShell process by examining their 
    parent process chain.

### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	CurrentUserHasElivatedRights
````PowerShell
CurrentUserHasElivatedRights
````

### SYNTAX
````PowerShell
CurrentUserHasElivatedRights 
````

### PARAMETERS
    None

<br/><hr/><hr/><br/>

##	Send-Keys
````PowerShell
Send-Keys
````

### SYNOPSIS
    Sends keys to a window as if typed by user

### SYNTAX
````PowerShell
Send-Keys [-Keys] <String[]> [-Escape] [-Process <Process>] [-HoldKeyboardFocus] 
[-ShiftEnter] [<CommonParameters>]
````

### DESCRIPTION
    Sends keys to the active window or to the window of a specified process
    as if typed by the user.
    The text strings can contain control characters like {F11} or {ENTER}
    they will press the corresponding keys, unless -Escape is specified.
    Line feeds will automatically be converted to {ENTER} control codes.
    and Tabs to {TAB}.

### PARAMETERS
    -Keys <String[]>
        The text to send
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false
    -Escape [<SwitchParameter>]
        Escape control characters like {F11} or {ENTER} or modifiers like +(meaning shift), 
        ^(meaning control), %(meaning alt)
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -Process <Process>
        The process to send the keys to
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -HoldKeyboardFocus [<SwitchParameter>]
        Hold the keyboard focus to the target process main window when complete
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -ShiftEnter [<SwitchParameter>]
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

<br/><hr/><hr/><br/>
