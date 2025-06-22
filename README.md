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
| [EnsureDockerDesktop](#EnsureDockerDesktop) |  | Checks if the WinGet PowerShell module is installed. |
| [EnsurePSTools](#EnsurePSTools) |  | Ensures Sysinternals tools (PSTools) are installed and available. |
| [Get-ActiveUser](#Get-ActiveUser) | gusers | Retrieves a list of unique usernames from currently active system processes. |
| [Get-ChildProcesses](#Get-ChildProcesses) |  | Retrieves all processes that are descendants of the current PowerShell process. |
| [Get-CurrentFocusedProcess](#Get-CurrentFocusedProcess) |  | Retrieves the process object of the window that currently has keyboard focus. |
| [Get-DesktopScalingFactor](#Get-DesktopScalingFactor) |  | Retrieves the Windows display scaling factor (DPI setting) for a specified monitor. |
| [Get-ForegroundWindow](#Get-ForegroundWindow) |  |  |
| [Get-KnownFolderPath](#Get-KnownFolderPath) | folder | Gets the path of a Windows known folder using the Windows Shell32 API. |
| [Get-MonitorCount](#Get-MonitorCount) |  | Gets the total number of display monitors connected to the system. |
| [Get-MpCmdRunPath](#Get-MpCmdRunPath) |  | Gets the path to the Windows Defender MpCmdRun.exe executable. |
| [Get-OpenedFileHandleProcesses](#Get-OpenedFileHandleProcesses) |  | Retrieves processes that have open file handles to specified files. |
| [Get-PowershellMainWindow](#Get-PowershellMainWindow) |  | Returns a window helper object for the PowerShell terminal's main window. |
| [Get-PowershellMainWindowProcess](#Get-PowershellMainWindowProcess) |  | Returns the process object for the window hosting the PowerShell terminal. |
| [Get-Window](#Get-Window) | gwin, window | Gets window information for specified processes or window handles. |
| [Initialize-ScheduledTaskScripts](#Initialize-ScheduledTaskScripts) |  | Creates scheduled tasks that run PowerShell scripts at specified intervals. |
| [Pop-Window](#Pop-Window) | popw | Pops the last active window helper from the stack with optional modifications. |
| [Push-Window](#Push-Window) | pushw | Pushes the current window onto the window stack with optional modifications. |
| [Send-Key](#Send-Key) | sendkeys, invokekeys | Sends simulated keystrokes to a window or process. |
| [Set-ForegroundWindow](#Set-ForegroundWindow) |  | Brings the specified window to the foreground and makes it the active window. |
| [Set-KnownFolderPath](#Set-KnownFolderPath) |  | Modifies the physical path of a Windows known folder. |
| [Set-TaskbarAlignment](#Set-TaskbarAlignment) | set-taskalign | Configures Windows 11+ taskbar alignment between center and left positions. |
| [Set-WindowPosition](#Set-WindowPosition) | wp | Positions and resizes windows on specified monitors with various layout options. |
| [Set-WindowPositionForSecondary](#Set-WindowPositionForSecondary) | wps | Positions a window on the secondary monitor with specified layout options. |
| [Start-ProcessWithPriority](#Start-ProcessWithPriority) | nice | Starts a process with a specified priority level. |
| [Test-PathUsingWindowsDefender](#Test-PathUsingWindowsDefender) | virusscan | Scans files or directories for malware using Windows Defender. |

<hr/>
&nbsp;

### GenXdev.Windows.WireGuard</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Add-WireGuardPeer](#Add-WireGuardPeer) |  | Adds a new WireGuard VPN peer (client) configuration to the server. |
| [EnsureWireGuard](#EnsureWireGuard) |  | Ensures WireGuard VPN service is installed and running via Docker container. |
| [Get-WireGuardPeerQRCode](#Get-WireGuardPeerQRCode) |  | Generates a QR code for a WireGuard VPN peer configuration. |
| [Get-WireGuardPeers](#Get-WireGuardPeers) |  | Gets information about all WireGuard VPN peers configured on the system. |
| [Get-WireGuardStatus](#Get-WireGuardStatus) |  | Gets detailed status information about the WireGuard VPN server. |
| [Remove-WireGuardPeer](#Remove-WireGuardPeer) |  | Removes a WireGuard VPN peer configuration. |
| [Reset-WireGuardConfiguration](#Reset-WireGuardConfiguration) |  | Resets the WireGuard VPN server configuration, removing all peers. |

<br/><hr/><hr/><br/>


# Cmdlets

&nbsp;<hr/>
###	GenXdev.Windows<hr/> 
NAME
    CurrentUserHasElevatedRights
    
SYNOPSIS
    Checks if the current user has elevated rights.
    
    
SYNTAX
    CurrentUserHasElevatedRights [<CommonParameters>]
    
    
DESCRIPTION
    Determines whether the current Windows user has administrative or backup operator
    privileges by checking their security principal roles. Returns true if the user
    has elevated rights, false otherwise. Implements robust error handling for
    security and access-related issues.
    

PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    System.Boolean
    Returns true if user has admin or backup operator rights, false otherwise.
    
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > $hasRights = CurrentUserHasElevatedRights
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    EnsureDockerDesktop
    
SYNOPSIS
    Ensures Docker Desktop is installed and available for containerization
    operations.
    
    
SYNTAX
    EnsureDockerDesktop [-ShowWindow] [<CommonParameters>]
    
    
DESCRIPTION
    Verifies if Docker Desktop is installed and properly configured on the system.
    If not found, installs Docker Desktop using WinGet and handles the complete
    installation process automatically. This function also manages Docker Desktop
    service startup, daemon readiness verification, and handles authentication
    requirements when necessary. The function includes comprehensive path
    management for both system and user-level Docker installations.
    

PARAMETERS
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
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > EnsureDockerDesktop
    Ensures Docker Desktop is installed and properly configured.
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > EnsureDockerDesktop -ShowWindow
    Ensures Docker Desktop is installed, properly configured, and shows its UI
    window.
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    EnsurePSTools
    
SYNOPSIS
    Ensures Sysinternals tools (PSTools) are installed and available.
    
    
SYNTAX
    EnsurePSTools [-Force] [[-PSExeName] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    Verifies if Sysinternals tools like handle.exe are installed and properly
    configured on the system. If not found, installs the Sysinternals Suite
    using WinGet and handles the complete installation process automatically.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > EnsurePSTools
    Ensures Sysinternals tools are installed and properly configured.
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > EnsurePSTools -Force -PSExeName 'procexp.exe'
    Forces reinstallation of Sysinternals tools and uses procexp.exe to verify
    installation.
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Get-ActiveUser
    
SYNOPSIS
    Retrieves a list of unique usernames from currently active system processes.
    
    
SYNTAX
    Get-ActiveUser [<CommonParameters>]
    
    
DESCRIPTION
    Queries all running processes on the system, extracts the associated username for
    each process, and returns a deduplicated list of users who have active processes.
    This is useful for system administration and security monitoring.
    

PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Get-ActiveUser
    Returns a list of all unique usernames with active processes.
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > gusers
    Uses the alias to get the same results.
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Get-ChildProcesses
    
SYNOPSIS
    Retrieves all processes that are descendants of the current PowerShell process.
    
    
SYNTAX
    Get-ChildProcesses [<CommonParameters>]
    
    
DESCRIPTION
    Examines all running processes and identifies those that have the current
    PowerShell process as an ancestor in their parent process chain. This includes
    both direct child processes and their descendants (grandchildren, etc.).
    

PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > # Get all child processes of the current PowerShell session
    Get-ChildProcesses
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > # Get child processes and display verbose output
    Get-ChildProcesses -Verbose
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Get-CurrentFocusedProcess
    
SYNOPSIS
    Retrieves the process object of the window that currently has keyboard focus.
    
    
SYNTAX
    Get-CurrentFocusedProcess [<CommonParameters>]
    
    
DESCRIPTION
    This function uses Windows API calls through P/Invoke to identify and return the
    Process object associated with the currently focused window. It leverages the
    User32.dll functions GetForegroundWindow and GetWindowThreadProcessId to determine
    which window has focus and obtain its associated process ID.
    

PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        Requires Windows operating system as it uses Windows-specific API calls.
        May return null if the process cannot be accessed due to permissions.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > $focusedProcess = Get-CurrentFocusedProcess
    Write-Host "Active window process: $($focusedProcess.ProcessName)"
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Get-DesktopScalingFactor
    
SYNOPSIS
    Retrieves the Windows display scaling factor (DPI setting) for a specified monitor.
    
    
SYNTAX
    Get-DesktopScalingFactor [[-Monitor] <Int32>] [<CommonParameters>]
    
    
DESCRIPTION
    Gets the current Windows display scaling factor configured for a monitor in the
    system. The scaling factor is expressed as a percentage where 100 represents
    standard scaling (96 DPI). Common values are 100, 125, 150, and 200.
    If no monitor is specified, returns the scaling factor for the primary display.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    System.Single
    
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Get-DesktopScalingFactor -Monitor 0
    Returns the scaling factor percentage for the primary monitor
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > Get-DesktopScalingFactor 1
    Returns the scaling factor percentage for the second monitor using positional
    parameter
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Get-ForegroundWindow
    
SYNTAX
    Get-ForegroundWindow [<CommonParameters>]
    
    
PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
    
INPUTS
    None
    
    
OUTPUTS
    System.Object
    
ALIASES
    None
    

REMARKS
    None 

<br/><hr/><hr/><br/>
 
NAME
    Get-KnownFolderPath
    
SYNOPSIS
    Gets the path of a Windows known folder using the Windows Shell32 API.
    
    
SYNTAX
    Get-KnownFolderPath [-KnownFolder] <String> [<CommonParameters>]
    
    
DESCRIPTION
    Retrieves the path of a specified Windows known folder using the Shell32 API's
    SHGetKnownFolderPath function. This method is more reliable than using
    environment variables as it works consistently across different Windows versions
    and language settings. Supports all standard Windows known folders like
    Documents, Downloads, AppData etc.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Get-KnownFolderPath -KnownFolder 'Documents'
    # Returns: C:\Users\Username\Documents
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > folder Downloads
    # Returns: C:\Users\Username\Downloads using the alias
    
    
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS > cd (folder Desktop)
    # Changes to the Desktop folder using the alias
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Get-MonitorCount
    
SYNOPSIS
    Gets the total number of display monitors connected to the system.
    
    
SYNTAX
    Get-MonitorCount [<CommonParameters>]
    
    
DESCRIPTION
    Uses the Windows Presentation Foundation (WPF) Screen helper class to accurately
    determine the number of physical display monitors currently connected to the
    system. This includes both active and detected but disabled monitors.
    

PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Get-MonitorCount
    Returns the total number of connected monitors (e.g. 2)
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > $screens = Get-MonitorCount -Verbose
    Returns monitor count with verbose output showing detection process
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Get-MpCmdRunPath
    
SYNOPSIS
    Gets the path to the Windows Defender MpCmdRun.exe executable.
    
    
SYNTAX
    Get-MpCmdRunPath [<CommonParameters>]
    
    
DESCRIPTION
    Locates and returns the full path to the Windows Defender command-line utility
    (MpCmdRun.exe). The function checks the standard installation location in
    Program Files and provides appropriate error handling if the file is not found.
    

PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    System.String
    Returns the full path to MpCmdRun.exe if found.
    
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > $defenderPath = Get-MpCmdRunPath
    # Returns path like: "${env:ProgramFiles}\Windows Defender\MpCmdRun.exe"
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Get-OpenedFileHandleProcesses
    
SYNOPSIS
    Retrieves processes that have open file handles to specified files.
    
    
SYNTAX
    Get-OpenedFileHandleProcesses [-FilePath] <String[]> [<CommonParameters>]
    
    
DESCRIPTION
    Uses the Sysinternals handle.exe tool to identify processes that currently have
    open handles to one or more specified files. This is useful for determining
    which processes are preventing file operations like deletion or modification.
    
    The function requires handle.exe from the Sysinternals suite to be installed
    and available in the system path. It parses the output from handle.exe to
    identify processes with open handles to the specified files and returns
    detailed information about those processes.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Get-OpenedFileHandleProcesses -FilePath "C:\temp\example.txt"
    # Identifies all processes that have open handles to the specified file
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > "file1.txt", "file2.txt" | Get-OpenedFileHandleProcesses
    # Checks multiple files via pipeline input for processes with open handles
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Get-PowershellMainWindow
    
SYNOPSIS
    Returns a window helper object for the PowerShell terminal's main window.
    
    
SYNTAX
    Get-PowershellMainWindow [<CommonParameters>]
    
    
DESCRIPTION
    Retrieves a WindowObj helper object that represents the main window of the current
    PowerShell host process. This allows manipulation and interaction with the
    terminal window itself.
    

PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    GenXdev.Helpers.WindowObj
    Represents the main window of the PowerShell host process with properties and
    methods for window manipulation.
    
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > $mainWindow = Get-PowershellMainWindow
    $null = $mainWindow.SetForeground()
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Get-PowershellMainWindowProcess
    
SYNOPSIS
    Returns the process object for the window hosting the PowerShell terminal.
    
    
SYNTAX
    Get-PowershellMainWindowProcess [<CommonParameters>]
    
    
DESCRIPTION
    Traverses up the process tree starting from the current PowerShell process to
    locate the parent window responsible for hosting the terminal. If the immediate
    parent process doesn't have a main window handle, it searches for similar
    processes that do have main windows. This is useful for identifying the actual
    terminal window process (like Windows Terminal, ConHost, etc.) that contains
    the PowerShell session.
    

PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > $hostProcess = Get-PowershellMainWindowProcess
    Write-Host "PowerShell is hosted in: $($hostProcess.ProcessName)"
    
    Returns the process hosting the current PowerShell session and displays its name.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Get-Window
    
SYNOPSIS
    Gets window information for specified processes or window handles.
    
    
SYNTAX
    Get-Window [[-ProcessName] <String>] [-ProcessId <Int32>] [-WindowHandle <Int64>] [<CommonParameters>]
    
    
DESCRIPTION
    Retrieves window information using process name, ID, or window handle. Returns
    WindowObj objects containing details about the main windows of matching processes.
    Supports wildcards when searching by process name.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Get-Window -ProcessName "notepad"
    Gets window information for all running Notepad instances.
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > gwin -Id 1234
    Gets window information for the process with ID 1234 using the alias.
    
    
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS > window -Handle 45678
    Gets window information for specific window handle using the alias.
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Initialize-ScheduledTaskScripts
    
SYNOPSIS
    Creates scheduled tasks that run PowerShell scripts at specified intervals.
    
    
SYNTAX
    Initialize-ScheduledTaskScripts [[-FilePath] <String>] [[-Prefix] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
DESCRIPTION
    Creates and configures scheduled tasks that execute PowerShell scripts at various
    intervals including:
    - System startup
    - User logon
    - Every hour of specific days (e.g., Monday at 13:00)
    - Daily at specific hours (e.g., every day at 15:00)
    Each task runs with elevated privileges under the current user's context.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Initialize-ScheduledTaskScripts -FilePath "C:\Tasks" -Prefix "MyTasks"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > Initialize-ScheduledTaskScripts
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Pop-Window
    
SYNOPSIS
    Pops the last active window helper from the stack with optional modifications.
    
    
SYNTAX
    Pop-Window [-Maximize] [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <Byte>] [-Focus] [-FadeIn] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-Monitor <Int32>] [<CommonParameters>]
    
    Pop-Window [-Maximize] [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <Byte>] -Width <Int32> -Height <Int32> [-Focus] [-FadeIn] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-Monitor <Int32>] [<CommonParameters>]
    
    Pop-Window [-Maximize] [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <Byte>] -X <Int32> -Y <Int32> [-Focus] [-FadeIn] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-Monitor <Int32>] [<CommonParameters>]
    
    Pop-Window [-NoModify] [<CommonParameters>]
    
    
DESCRIPTION
    Pops a window helper from the stack and optionally applies window transformations.
    If the stack is empty or contains invalid windows, returns the currently focused
    window. This function allows you to manipulate windows that were previously saved
    with Push-Window, applying various positioning, sizing, and visual effects.
    

PARAMETERS
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
        
    -Fullscreen [<SwitchParameter>]
        Fills window to entire screen after popping it from the stack.
        
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Pop-Window -Maximize -Focus
    # Pops the last window from the stack, maximizes it and gives it focus.
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > Pop-Window -X 100 -Y 100 -Width 800 -Height 600 -AlwaysOnTop
    # Pops the last window, positions it at coordinates (100,100),
    # resizes it to 800x600, and sets it to always stay on top.
    
    
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS > popw -Left -Focus
    # Pops the last window, positions it on the left half of the screen,
    # and gives it focus using the alias.
    
    
    
    
    
    
    -------------------------- EXAMPLE 4 --------------------------
    
    PS > Pop-Window -Monitor 1 -Maximize
    # Pops the last window, moves it to the first monitor, and maximizes it.
    
    
    
    
    
    
    -------------------------- EXAMPLE 5 --------------------------
    
    PS > Pop-Window -Monitor -2 -Fullscreen
    # Pops the last window, moves it to the secondary monitor, and makes it fullscreen.
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Push-Window
    
SYNOPSIS
    Pushes the current window onto the window stack with optional modifications.
    
    
SYNTAX
    Push-Window [-Maximize] [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <Byte>] [-Focus] [-FadeOut] [-PassThru] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-Monitor <Int32>] [<CommonParameters>]
    
    Push-Window [-Maximize] [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <Byte>] -Width <Int32> -Height <Int32> [-Focus] [-FadeOut] [-PassThru] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-Monitor <Int32>] [<CommonParameters>]
    
    Push-Window [-Maximize] [-Minimize] [-Restore] [-Hide] [-Show] [-NoBorders] [-AlwaysOnTop] [-Opacity <Byte>] -X <Int32> -Y <Int32> [-Focus] [-FadeOut] [-PassThru] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-Monitor <Int32>] [<CommonParameters>]
    
    
DESCRIPTION
    Pushes a window helper for the currently focused window onto the stack.
    Allows applying various window transformations before or after pushing.
    This function captures the current window and stores it for later retrieval
    with Pop-Window, while optionally applying positioning, sizing, and visual
    effects.
    

PARAMETERS
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
        
    -Fullscreen [<SwitchParameter>]
        Fills window to entire screen before pushing it onto the stack.
        
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Push-Window -Maximize -AlwaysOnTop
    # Maximizes the current window, sets it to be always on top, and pushes it onto the stack.
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > Push-Window -X 100 -Y 100 -Width 800 -Height 600 -NoBorders
    # Positions and resizes the current window, removes its borders, and pushes it onto the stack.
    
    
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS > pushw -Left
    # Positions the current window on the left half of the screen and pushes it
    # onto the stack using the alias.
    
    
    
    
    
    
    -------------------------- EXAMPLE 4 --------------------------
    
    PS > Push-Window -Monitor 1 -Maximize
    # Moves the current window to the first monitor, maximizes it, and pushes it onto the stack.
    
    
    
    
    
    
    -------------------------- EXAMPLE 5 --------------------------
    
    PS > Push-Window -Monitor -2 -Fullscreen
    # Moves the current window to the secondary monitor, makes it fullscreen,
    # and pushes it onto the stack.
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Send-Key
    
SYNOPSIS
    Sends simulated keystrokes to a window or process.
    
    
SYNTAX
    Send-Key [-KeysToSend] <String[]> [-Escape] [-ProcessName <String>] [-HoldKeyboardFocus] [-ShiftEnter] [-DelayMilliSeconds <Int32>] [<CommonParameters>]
    
    Send-Key [-KeysToSend] <String[]> [-Escape] [-ProcessId <Int32>] [-HoldKeyboardFocus] [-ShiftEnter] [-DelayMilliSeconds <Int32>] [<CommonParameters>]
    
    Send-Key [-KeysToSend] <String[]> [-Escape] [-WindowHandle <Int64>] [-HoldKeyboardFocus] [-ShiftEnter] [-DelayMilliSeconds <Int32>] [<CommonParameters>]
    
    
DESCRIPTION
    Sends keystrokes to either the active window or a specified process window as if
    typed by a user. Supports special keys and keyboard modifiers through control
    sequences like {F11}, {ENTER}, etc. Can target specific processes and maintain
    keyboard focus.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Send-Key -KeysToSend "Hello World{ENTER}" -Process (Get-Process notepad)
    Sends text to Notepad followed by Enter key
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > Send-Key "Special {F11} key" -Escape
    Sends literal "{F11}" rather than F11 key
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Set-ForegroundWindow
    
SYNOPSIS
    Brings the specified window to the foreground and makes it the active window.
    
    
SYNTAX
    Set-ForegroundWindow [-WindowHandle] <IntPtr> [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
DESCRIPTION
    Makes a window the foreground window using multiple Win32 API methods for maximum
    reliability. First attempts using SwitchToThisWindow API, then falls back to
    SetForegroundWindow if needed. This dual approach ensures consistent window
    activation across different Windows versions and scenarios.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > # Make Notepad the active window using full parameter name
    $hwnd = (Get-Process notepad).MainWindowHandle
    Set-ForegroundWindow -WindowHandle $hwnd -WhatIf
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > # Using positional parameter for simpler syntax
    $hwnd = (Get-Process notepad).MainWindowHandle
    Set-ForegroundWindow $hwnd
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Set-KnownFolderPath
    
SYNOPSIS
    Modifies the physical path of a Windows known folder.
    
    
SYNTAX
    Set-KnownFolderPath [-KnownFolder] <String> [-Path] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
DESCRIPTION
    Uses the Windows Shell32 API to relocate system folders like Documents,
    Downloads, Desktop, or other known Windows folders to a new location. The
    function validates the target path exists, looks up the folder's unique GUID
    from the comprehensive known folders registry, and uses the SHSetKnownFolderPath
    API to perform the relocation. Common use cases include moving user folders to
    a different drive for space management or organization. Exercise caution when
    moving system-critical folders as this may affect system stability.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Set-KnownFolderPath -KnownFolder 'Documents' -Path 'D:\UserDocs'
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > Set-KnownFolderPath Downloads 'E:\Downloads'
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Set-TaskbarAlignment
    
SYNOPSIS
    Configures Windows 11+ taskbar alignment between center and left positions.
    
    
SYNTAX
    Set-TaskbarAlignment [-Justify] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
DESCRIPTION
    Sets the taskbar alignment in Windows 11 and newer versions by modifying the
    registry key 'TaskbarAl' under HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\
    Explorer\Advanced. The alignment can be set to either center (value 1) or left
    (value 0).
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Set-TaskbarAlignment -Justify Left
    # Sets the Windows 11 taskbar to left alignment
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > Set-TaskAlign Center -WhatIf
    # Shows what would happen if taskbar was set to center alignment
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Set-WindowPosition
    
SYNOPSIS
    Positions and resizes windows on specified monitors with various layout options.
    
    
SYNTAX
    Set-WindowPosition [[-ProcessName] <String[]>] [-Monitor <Int32>] [-NoBorders] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-PassThru] [-SideBySide] [-WhatIf] [-Confirm] [<CommonParameters>]
    
    Set-WindowPosition [-Process <Process[]>] [-Monitor <Int32>] [-NoBorders] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-PassThru] [-SideBySide] [-WhatIf] [-Confirm] [<CommonParameters>]
    
    Set-WindowPosition [-WindowHelper <WindowObj[]>] [-Monitor <Int32>] [-NoBorders] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-PassThru] [-SideBySide] [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
DESCRIPTION
    Provides precise control over window positioning and sizing, supporting multiple
    monitors, border removal, and various preset positions like left/right split,
    top/bottom split, and center placement. Windows can be positioned by coordinates
    or using predefined layouts.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > # Position PowerShell window centered on primary monitor with no borders
    Set-WindowPosition -Centered -Monitor 0 -NoBorders
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > # Split notepad and calc side by side on second monitor using aliases
    Get-Process notepad,calc | wp -m 1 -l,-r
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Set-WindowPositionForSecondary
    
SYNOPSIS
    Positions a window on the secondary monitor with specified layout options.
    
    
SYNTAX
    Set-WindowPositionForSecondary [[-Process] <Process[]>] [[-Monitor] <Int32>] [-NoBorders] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-RestoreFocus] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
DESCRIPTION
    This function allows positioning windows on a configured secondary monitor using
    Set-WindowPosition with various layout options including alignment, size, and
    border settings. It handles monitor selection based on global configuration.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Set-WindowPositionForSecondary -Process "notepad" -Width 800 -Height 600 `
        -Centered -NoBorders
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > wps notepad -w 800 -h 600 -c -nb
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Start-ProcessWithPriority
    
SYNOPSIS
    Starts a process with a specified priority level.
    
    
SYNTAX
    Start-ProcessWithPriority [-FilePath] <String> [[-ArgumentList] <String[]>] [[-Priority] <String>] [-NoWait] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
DESCRIPTION
    Launches an executable with a customizable priority level and provides options for
    waiting and process handling. This function wraps Start-Process with additional
    functionality to control process priority and execution behavior.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Start-ProcessWithPriority -FilePath "notepad.exe" -Priority "Low" -NoWait
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > nice notepad.exe -Priority High
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Test-PathUsingWindowsDefender
    
SYNOPSIS
    Scans files or directories for malware using Windows Defender.
    
    
SYNTAX
    Test-PathUsingWindowsDefender [-FilePath] <String> [-EnableRemediation] [<CommonParameters>]
    
    
DESCRIPTION
    Performs a targeted scan of specified files or directories using Windows
    Defender's command-line interface (MpCmdRun.exe). The function can either scan
    in detection-only mode or with automatic threat remediation enabled. Returns
    true if no threats are detected, false if threats are found or scan fails.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    System.Boolean
    
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Test-PathUsingWindowsDefender -FilePath "C:\Downloads\file.exe" -Verbose
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > virusscan "C:\Downloads\file.exe" -EnableRemediation
    
    
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS > "C:\Downloads\file.exe" | HasNoVirus
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Windows.WireGuard<hr/> 
NAME
    Add-WireGuardPeer
    
SYNTAX
    Add-WireGuardPeer [-PeerName] <string> [[-AllowedIPs] <string>] [[-DNS] <string>] [[-OutputPath] <string>] [[-ContainerName] <string>] [[-VolumeName] <string>] [[-ServicePort] <int>] [[-HealthCheckTimeout] <int>] [[-HealthCheckInterval] <int>] [[-ImageName] <string>] [[-PUID] <string>] [[-PGID] <string>] [[-TimeZone] <string>] [-SaveConfig] [-ShowQRCode] [-NoDockerInitialize] [-Force] [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
PARAMETERS
    -AllowedIPs <string>
        The IP ranges that will be routed through the VPN
        
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
        
    -ImageName <string>
        Custom Docker image name to use
        
        Required?                    false
        Position?                    9
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
        
    -OutputPath <string>
        The path where the peer configuration file should be saved
        
        Required?                    false
        Position?                    3
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
        
    -SaveConfig
        Save the peer configuration to a file
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
        
    -ShowQRCode
        Show QR code in the console for easy mobile setup
        
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
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
    
INPUTS
    None
    
    
OUTPUTS
    System.Object
    
ALIASES
    None
    

REMARKS
    None 

<br/><hr/><hr/><br/>
 
NAME
    EnsureWireGuard
    
SYNOPSIS
    Ensures WireGuard VPN service is installed and running via Docker container.
    
    
SYNTAX
    EnsureWireGuard [[-ContainerName] <String>] [[-VolumeName] <String>] [[-ServicePort] <Int32>] [[-HealthCheckTimeout] <Int32>] [[-HealthCheckInterval] <Int32>] [[-ImageName] <String>] [[-PUID] <String>] [[-PGID] <String>] [[-TimeZone] <String>] [-Force] [<CommonParameters>]
    
    
DESCRIPTION
    This function sets up and manages the WireGuard VPN service using Docker
    Desktop. It automatically ensures Docker Desktop is running, pulls the latest
    WireGuard Docker image, creates persistent storage volumes, and manages the
    container lifecycle including health monitoring and restart capabilities.
    
    WireGuard is a simple, fast, and modern VPN that utilizes state-of-the-art
    cryptography. It offers superior performance and simplicity compared to
    traditional VPN solutions like OpenVPN, with minimal configuration overhead
    and excellent cross-platform support.
    

PARAMETERS
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
        1-65535. Default: 51820
        
        Required?                    false
        Position?                    3
        Default value                51820
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    System.Boolean
    
    
NOTES
    
    
        To generate client configurations after setup:
        - Run: docker exec -it wireguard /app/show-peer 1
        
        For Android 10 and above:
        - Install the official WireGuard app from Google Play Store
        - Scan the QR code or import the config file to connect
        
        For more information, see: https://www.wireguard.com/
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > EnsureWireGuard
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > EnsureWireGuard -ContainerName "my_wireguard" -ServicePort 51821
    
    
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS > EnsureWireGuard -VolumeName "custom_vpn_data" -HealthCheckTimeout 120
    
    
    
    
    
    
    -------------------------- EXAMPLE 4 --------------------------
    
    PS > EnsureWireGuard -PUID 1001 -PGID 1001 -TimeZone "America/New_York"
    
    
    
    
    
    
    -------------------------- EXAMPLE 5 --------------------------
    
    PS > EnsureWireGuard -Force
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Get-WireGuardPeerQRCode
    
SYNOPSIS
    Generates a QR code for a WireGuard VPN peer configuration.
    
    
SYNTAX
    Get-WireGuardPeerQRCode [-PeerName] <String> [-NoDockerInitialize] [-Force] [-ContainerName <String>] [-VolumeName <String>] [-ServicePort <Int32>] [-HealthCheckTimeout <Int32>] [-HealthCheckInterval <Int32>] [-ImageName <String>] [-PUID <String>] [-PGID <String>] [-TimeZone <String>] [<CommonParameters>]
    
    
DESCRIPTION
    This function generates a QR code for a WireGuard VPN peer configuration that
    can be scanned by mobile devices for easy setup. The QR code is displayed in
    the console and can be used to quickly configure WireGuard clients on
    smartphones and tablets. The function interacts with the linuxserver/wireguard
    Docker container to generate QR codes for peer configurations.
    

PARAMETERS
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
        Default value                51820
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        This function requires the container to be running (use EnsureWireGuard first)
        and the peer to exist (use Add-WireGuardPeer to create peers).
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Get-WireGuardPeerQRCode -PeerName "MyPhone"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > Get-WireGuardPeerQRCode -PeerName "Tablet" -NoDockerInitialize
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Get-WireGuardPeers
    
SYNOPSIS
    Gets information about all WireGuard VPN peers configured on the system.
    
    
SYNTAX
    Get-WireGuardPeers [-NoDockerInitialize] [-Force] [[-ContainerName] <String>] [[-VolumeName] <String>] [[-ServicePort] <Int32>] [[-HealthCheckTimeout] <Int32>] [[-HealthCheckInterval] <Int32>] [[-ImageName] <String>] [[-PUID] <String>] [[-PGID] <String>] [[-TimeZone] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    This function retrieves comprehensive information about all WireGuard VPN peers
    configured on the server running in a Docker container. It provides detailed
    information including peer names, public keys, allowed IP addresses, connection
    endpoints, handshake status, data transfer statistics, and current connection
    status. The function can operate in conjunction with parent functions or
    independently manage Docker container initialization.
    

PARAMETERS
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
        Default value                51820
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
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        This function interacts with the linuxserver/wireguard Docker container to
        retrieve information about configured WireGuard peers. The container must be
        running and accessible. Use EnsureWireGuard function first if container setup
        is required.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Get-WireGuardPeers
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > Get-WireGuardPeers -NoDockerInitialize -ContainerName "custom_wireguard" `
                       -ServicePort 55555
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Get-WireGuardStatus
    
SYNOPSIS
    Gets detailed status information about the WireGuard VPN server.
    
    
SYNTAX
    Get-WireGuardStatus [-NoDockerInitialize] [-Force] [[-ContainerName] <String>] [[-VolumeName] <String>] [[-ServicePort] <Int32>] [[-HealthCheckTimeout] <Int32>] [[-HealthCheckInterval] <Int32>] [[-ImageName] <String>] [[-PUID] <String>] [[-PGID] <String>] [[-TimeZone] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    This function retrieves detailed status information about the WireGuard VPN
    server running in a Docker container, including interface details, listening
    port, connected peers, and server health. It provides comprehensive information
    about the WireGuard service including server status, peer counts, uptime, and
    network configuration details.
    

PARAMETERS
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
        Default value                51820
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
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        This function interacts with the linuxserver/wireguard Docker container to
        retrieve status information about the WireGuard server. It requires the
        container to be running (use EnsureWireGuard first).
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Get-WireGuardStatus
    
    Returns the status of the WireGuard server with default settings.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > Get-WireGuardStatus -NoDockerInitialize -ContainerName "custom_wireguard"
    
    Retrieves status for a custom container without initializing Docker.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Remove-WireGuardPeer
    
SYNOPSIS
    Removes a WireGuard VPN peer configuration.
    
    
SYNTAX
    Remove-WireGuardPeer [-PeerName] <String> [-ContainerName <String>] [-VolumeName <String>] [-ServicePort <Int32>] [-HealthCheckTimeout <Int32>] [-HealthCheckInterval <Int32>] [-ImageName <String>] [-PUID <String>] [-PGID <String>] [-TimeZone <String>] [-Force] [-NoDockerInitialize] [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
DESCRIPTION
    This function removes a WireGuard VPN peer configuration from the server running
    in a Docker container. It deletes the peer's configuration files and updates the
    WireGuard server to stop accepting connections from this peer. The function
    validates peer existence before removal and provides confirmation prompts unless
    the Force parameter is specified.
    

PARAMETERS
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
        Default value                51820
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        This function interacts with the linuxserver/wireguard Docker container to manage
        WireGuard peers. It requires the container to be running (use EnsureWireGuard
        first). The function will validate peer existence before attempting removal and
        provides detailed error handling for failed operations.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Remove-WireGuardPeer -PeerName "MyPhone"
    
    Removes the peer named "MyPhone" with confirmation prompt.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > Remove-WireGuardPeer -PeerName "Tablet" -Force
    
    Removes the peer named "Tablet" without confirmation prompt.
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS > Remove-WireGuardPeer "WorkLaptop"
    
    Removes the peer using positional parameter syntax.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Reset-WireGuardConfiguration
    
SYNOPSIS
    Resets the WireGuard VPN server configuration, removing all peers.
    
    
SYNTAX
    Reset-WireGuardConfiguration [[-ContainerName] <String>] [[-VolumeName] <String>] [[-ServicePort] <Int32>] [[-HealthCheckTimeout] <Int32>] [[-HealthCheckInterval] <Int32>] [[-ImageName] <String>] [[-PUID] <String>] [[-PGID] <String>] [[-TimeZone] <String>] [-NoDockerInitialize] [-Force] [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
DESCRIPTION
    This function resets the WireGuard VPN server configuration running in a Docker
    container by removing all peers and generating a fresh server configuration.
    This is a destructive operation that cannot be undone and will permanently
    remove all peer configurations. The function stops the WireGuard service,
    removes all peer directories and configuration files, removes server keys,
    restarts the container, and verifies that a new configuration is generated.
    

PARAMETERS
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
        Defaults to 51820. This is the UDP port WireGuard will listen on.
        
        Required?                    false
        Position?                    3
        Default value                51820
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        This function interacts with the linuxserver/wireguard Docker container to reset
        the WireGuard server configuration. It requires the container to be running
        (use EnsureWireGuard first). This operation will remove all peer configurations
        and cannot be undone. The function will restart the container to regenerate
        a fresh configuration.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Reset-WireGuardConfiguration
    
    Resets the WireGuard configuration with default settings and prompts for
    confirmation before proceeding.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > Reset-WireGuardConfiguration -Force -ContainerName "my-wireguard"
    
    Resets the WireGuard configuration for a custom container name without
    confirmation prompts.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
