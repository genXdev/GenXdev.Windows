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

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
