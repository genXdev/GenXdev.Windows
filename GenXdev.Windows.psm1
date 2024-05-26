
<#
.SYNOPSIS
Returns a window helper for the main window of the specified process

.DESCRIPTION
Returns a window helper for the main window of the specified process

.PARAMETER ProcessName
The process to get the window helper for

.PARAMETER WindowHandle
The window handle to get the window helper for
#>
function Get-Window {

    [CmdletBinding(DefaultParameterSetName="byprocessname")]
    [Alias()]

    param (
        [parameter(Mandatory = $true, ParameterSetName="byprocessname")]
        [string] $ProcessName,

        [parameter(Mandatory = $true, ParameterSetName="bywindowhandle")]
        [long] $WindowHandle
    )

    ###############################################################################

    ###############################################################################
    if ($WindowHandle -gt 0) {

        [GenXdev.Helpers.WindowObj]::GetMainWindow($WindowHandle)
        return;
    }

    Get-Process "*$ProcessName*" -ErrorAction SilentlyContinue | Where-Object -Property MainWindowHandle -NE 0 | ForEach-Object -Process {

        [GenXdev.Helpers.WindowObj]::GetMainWindow($PSItem)
    }
}

###############################################################################

# Define known folder GUIDs
$KnownFolders = @{
    '3DObjects'             = '31C0DD25-9439-4F12-BF41-7FF4EDA38722';
    'AddNewPrograms'        = 'de61d971-5ebc-4f02-a3a9-6c82895e5c04';
    'AdminTools'            = '724EF170-A42D-4FEF-9F26-B60E846FBA4F';
    'AppUpdates'            = 'a305ce99-f527-492b-8b1a-7e76fa98d6e4';
    'CDBurning'             = '9E52AB10-F80D-49DF-ACB8-4330F5687855';
    'ChangeRemovePrograms'  = 'df7266ac-9274-4867-8d55-3bd661de872d';
    'CommonAdminTools'      = 'D0384E7D-BAC3-4797-8F14-CBA229B392B5';
    'CommonOEMLinks'        = 'C1BAE2D0-10DF-4334-BEDD-7AA20B227A9D';
    'CommonPrograms'        = '0139D44E-6AFE-49F2-8690-3DAFCAE6FFB8';
    'CommonStartMenu'       = 'A4115719-D62E-491D-AA7C-E74B8BE3B067';
    'CommonStartup'         = '82A5EA35-D9CD-47C5-9629-E15D2F714E6E';
    'CommonTemplates'       = 'B94237E7-57AC-4347-9151-B08C6C32D1F7';
    'ComputerFolder'        = '0AC0837C-BBF8-452A-850D-79D08E667CA7';
    'ConflictFolder'        = '4bfefb45-347d-4006-a5be-ac0cb0567192';
    'ConnectionsFolder'     = '6F0CD92B-2E97-45D1-88FF-B0D186B8DEDD';
    'Contacts'              = '56784854-C6CB-462b-8169-88E350ACB882';
    'ControlPanelFolder'    = '82A74AEB-AEB4-465C-A014-D097EE346D63';
    'Cookies'               = '2B0F765D-C0E9-4171-908E-08A611B84FF6';
    'Desktop'               = 'B4BFCC3A-DB2C-424C-B029-7FE99A87C641';
    'Documents'             = 'FDD39AD0-238F-46AF-ADB4-6C85480369C7';
    'Downloads'             = '374DE290-123F-4565-9164-39C4925E467B';
    'Favorites'             = '1777F761-68AD-4D8A-87BD-30B759FA33DD';
    'Fonts'                 = 'FD228CB7-AE11-4AE3-864C-16F3910AB8FE';
    'Games'                 = 'CAC52C1A-B53D-4edc-92D7-6B2E8AC19434';
    'GameTasks'             = '054FAE61-4DD8-4787-80B6-090220C4B700';
    'History'               = 'D9DC8A3B-B784-432E-A781-5A1130A75963';
    'InternetCache'         = '352481E8-33BE-4251-BA85-6007CAEDCF9D';
    'InternetFolder'        = '4D9F7874-4E0C-4904-967B-40B0D20C3E4B';
    'Links'                 = 'bfb9d5e0-c6a9-404c-b2b2-ae6db6af4968';
    'LocalAppData'          = 'F1B32785-6FBA-4FCF-9D55-7B8E7F157091';
    'LocalAppDataLow'       = 'A520A1A4-1780-4FF6-BD18-167343C5AF16';
    'LocalizedResourcesDir' = '2A00375E-224C-49DE-B8D1-440DF7EF3DDC';
    'Music'                 = '4BD8D571-6D19-48D3-BE97-422220080E43';
    'NetHood'               = 'C5ABBF53-E17F-4121-8900-86626FC2C973';
    'NetworkFolder'         = 'D20BEEC4-5CA8-4905-AE3B-BF251EA09B53';
    'OriginalImages'        = '2C36C0AA-5812-4b87-BFD0-4CD0DFB19B39';
    'PhotoAlbums'           = '69D2CF90-FC33-4FB7-9A0C-EBB0F0FCB43C';
    'Pictures'              = '33E28130-4E1E-4676-835A-98395C3BC3BB';
    'Playlists'             = 'DE92C1C7-837F-4F69-A3BB-86E631204A23';
    'PrintersFolder'        = '76FC4E2D-D6AD-4519-A663-37BD56068185';
    'PrintHood'             = '9274BD8D-CFD1-41C3-B35E-B13F55A758F4';
    'Profile'               = '5E6C858F-0E22-4760-9AFE-EA3317B67173';
    'ProgramData'           = '62AB5D82-FDC1-4DC3-A9DD-070D1D495D97';
    'ProgramFiles'          = '905e63b6-c1bf-494e-b29c-65b732d3d21a';
    'ProgramFilesX64'       = '6D809377-6AF0-444b-8957-A3773F02200E';
    'ProgramFilesX86'       = '7C5A40EF-A0FB-4BFC-874A-C0F2E0B9FA8E';
    'ProgramFilesCommon'    = 'F7F1ED05-9F6D-47A2-AAAE-29D317C6F066';
    'ProgramFilesCommonX64' = '6365D5A7-0F0D-45E5-87F6-0DA56B6A4F7D';
    'ProgramFilesCommonX86' = 'DE974D24-D9C6-4D3E-BF91-F4455120B917';
    'Programs'              = 'A77F5D77-2E2B-44C3-A6A2-ABA601054A51';
    'Public'                = 'DFDF76A2-C82A-4D63-906A-5644AC457385';
    'PublicDesktop'         = 'C4AA340D-F20F-4863-AFEF-F87EF2E6BA25';
    'PublicDocuments'       = 'ED4824AF-DCE4-45A8-81E2-FC7965083634';
    'PublicDownloads'       = '3D644C9B-1FB8-4f30-9B45-F670235F79C0';
    'PublicGameTasks'       = 'DEBF2536-E1A8-4c59-B6A2-414586476AEA';
    'PublicMusic'           = '3214FAB5-9757-4298-BB61-92A9DEAA44FF';
    'PublicPictures'        = 'B6EBFB86-6907-413C-9AF7-4FC2ABF07CC5';
    'PublicVideos'          = '2400183A-6185-49FB-A2D8-4A392A602BA3';
    'QuickLaunch'           = '52a4f021-7b75-48a9-9f6b-4b87a210bc8f';
    'Recent'                = 'AE50C081-EBD2-438A-8655-8A092E34987A';
    'RecycleBinFolder'      = 'B7534046-3ECB-4C18-BE4E-64CD4CB7D6AC';
    'ResourceDir'           = '8AD10C31-2ADB-4296-A8F7-E4701232C972';
    'RoamingAppData'        = '3EB685DB-65F9-4CF6-A03A-E3EF65729F3D';
    'SampleMusic'           = 'B250C668-F57D-4EE1-A63C-290EE7D1AA1F';
    'SamplePictures'        = 'C4900540-2379-4C75-844B-64E6FAF8716B';
    'SamplePlaylists'       = '15CA69B3-30EE-49C1-ACE1-6B5EC372AFB5';
    'SampleVideos'          = '859EAD94-2E85-48AD-A71A-0969CB56A6CD';
    'SavedGames'            = '4C5C32FF-BB9D-43b0-B5B4-2D72E54EAAA4';
    'SavedSearches'         = '7d1d3a04-debb-4115-95cf-2f29da2920da';
    'SEARCH_CSC'            = 'ee32e446-31ca-4aba-814f-a5ebd2fd6d5e';
    'SEARCH_MAPI'           = '98ec0e18-2098-4d44-8644-66979315a281';
    'SearchHome'            = '190337d1-b8ca-4121-a639-6d472d16972a';
    'SendTo'                = '8983036C-27C0-404B-8F08-102D10DCFD74';
    'SidebarDefaultParts'   = '7B396E54-9EC5-4300-BE0A-2482EBAE1A26';
    'SidebarParts'          = 'A75D362E-50FC-4fb7-AC2C-A8BEAA314493';
    'StartMenu'             = '625B53C3-AB48-4EC1-BA1F-A1EF4146FC19';
    'Startup'               = 'B97D20BB-F46A-4C97-BA10-5E3608430854';
    'SyncManagerFolder'     = '43668BF8-C14E-49B2-97C9-747784D784B7';
    'SyncResultsFolder'     = '289a9a43-be44-4057-a41b-587a76d7e7f9';
    'SyncSetupFolder'       = '0F214138-B1D3-4a90-BBA9-27CBC0C5389A';
    'System'                = '1AC14E77-02E7-4E5D-B744-2EB1AE5198B7';
    'SystemX86'             = 'D65231B0-B2F1-4857-A4CE-A8E7C6EA7D27';
    'Templates'             = 'A63293E8-664E-48DB-A079-DF759E0509F7';
    'TreeProperties'        = '5b3749ad-b49f-49c1-83eb-15370fbd4882';
    'UserProfiles'          = '0762D272-C50A-4BB0-A382-697DCD729B80';
    'UsersFiles'            = 'f3ce0f7c-4901-4acc-8648-d5d44b04ef8f';
    'Videos'                = '18989B1D-99B5-455B-841C-AB7C74E4DDFC';
    'Windows'               = 'F38BF404-1D43-42F2-9305-67DE0B28FC23';
}

<#
.SYNOPSIS
Sets a known folder's path using SHSetKnownFolderPath.

.DESCRIPTION
Sets a known folder's path using SHSetKnownFolderPath.

.PARAMETER KnownFolder
The known folder whose path to set.

.PARAMETER Path
The path.

.INPUTS
None. You cannot pipe objects to Set-KnownFolderPath.

.OUTPUTS
Int. Set-KnownFolderPath returns an int with the return code of SHSetKnownFolderPath

.EXAMPLE
PS> Set-KnownFolderPath Desktop $ENV:USERPROFILE/Desktop

0
.EXAMPLE

PS> Set-KnownFolderPath -KnownFolder Desktop -Path $ENV:USERPROFILE/Desktop
0

.LINK
https://docs.microsoft.com/en-us/windows/win32/api/shlobj_core/nf-shlobj_core-shsetknownfolderpath

.LINK
https://stackoverflow.com/questions/25709398/set-location-of-special-folders-with-powershell

#>
function Set-KnownFolderPath {

    [CmdletBinding(ConfirmImpact = "high")]

    Param (
        [Parameter(Mandatory = $true)]
        [ValidateSet('3DObjects', 'AddNewPrograms', 'AdminTools', 'AppUpdates', 'CDBurning', 'ChangeRemovePrograms', 'CommonAdminTools', 'CommonOEMLinks', 'CommonPrograms', 'CommonStartMenu', 'CommonStartup', 'CommonTemplates', 'ComputerFolder', 'ConflictFolder', 'ConnectionsFolder', 'Contacts', 'ControlPanelFolder', 'Cookies', 'Desktop', 'Documents', 'Downloads', 'Favorites', 'Fonts', 'Games', 'GameTasks', 'History', 'InternetCache', 'InternetFolder', 'Links', 'LocalAppData', 'LocalAppDataLow', 'LocalizedResourcesDir', 'Music', 'NetHood', 'NetworkFolder', 'OriginalImages', 'PhotoAlbums', 'Pictures', 'Playlists', 'PrintersFolder', 'PrintHood', 'Profile', 'ProgramData', 'ProgramFiles', 'ProgramFilesX64', 'ProgramFilesX86', 'ProgramFilesCommon', 'ProgramFilesCommonX64', 'ProgramFilesCommonX86', 'Programs', 'Public', 'PublicDesktop', 'PublicDocuments', 'PublicDownloads', 'PublicGameTasks', 'PublicMusic', 'PublicPictures', 'PublicVideos', 'QuickLaunch', 'Recent', 'RecycleBinFolder', 'ResourceDir', 'RoamingAppData', 'SampleMusic', 'SamplePictures', 'SamplePlaylists', 'SampleVideos', 'SavedGames', 'SavedSearches', 'SEARCH_CSC', 'SEARCH_MAPI', 'SearchHome', 'SendTo', 'SidebarDefaultParts', 'SidebarParts', 'StartMenu', 'Startup', 'SyncManagerFolder', 'SyncResultsFolder', 'SyncSetupFolder', 'System', 'SystemX86', 'Templates', 'TreeProperties', 'UserProfiles', 'UsersFiles', 'Videos', 'Windows')]
        [string]$KnownFolder,

        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    # Define SHSetKnownFolderPath if it hasn't been defined already
    $Type = ([System.Management.Automation.PSTypeName]'KnownFolders.SHSetKnownFolderPathPS').Type
    if (-not $Type) {
        # http://www.pinvoke.net/default.aspx/shell32/SHSetKnownFolderPath.html
        $Signature = @'
[DllImport("shell32.dll")]
public extern static int SHSetKnownFolderPath(ref Guid folderId, uint flags, IntPtr token, [MarshalAs(UnmanagedType.LPWStr)] string path);
'@
        $Type = Add-Type -MemberDefinition $Signature -Namespace 'KnownFolders' -Name 'SHSetKnownFolderPathPS' -PassThru
    }

    # Validate the path
    if (Test-Path $Path -PathType Container) {
        # Call SHSetKnownFolderPath
        return $Type::SHSetKnownFolderPath([ref]$KnownFolders[$KnownFolder], 0, 0, $Path)
    }
    else {
        throw New-Object System.IO.DirectoryNotFoundException "Could not find part of the path $Path."
    }
}
<#
.SYNOPSIS
Gets a known folder's path using SHGetKnownFolderPath.

.DESCRIPTION
Gets a known folder's path using SHGetKnownFolderPath.

.PARAMETER KnownFolder
The known folder whose path to get.

.INPUTS
None. You cannot pipe objects to Get-KnownFolderPath.

.OUTPUTS
Int. Get-KnownFolderPath returns an int with the return code of SHGetKnownFolderPath

.LINK
https://docs.microsoft.com/en-us/windows/win32/api/shlobj_core/nf-shlobj_core-shgetknownfolderpath

.LINK
https://stackoverflow.com/questions/25709398/set-location-of-special-folders-with-powershell

#>
function Get-KnownFolderPath {

    [CmdletBinding()]

    param (
        [Parameter(Mandatory = $true)]
        [ValidateSet('3DObjects', 'AddNewPrograms', 'AdminTools', 'AppUpdates', 'CDBurning', 'ChangeRemovePrograms', 'CommonAdminTools', 'CommonOEMLinks', 'CommonPrograms', 'CommonStartMenu', 'CommonStartup', 'CommonTemplates', 'ComputerFolder', 'ConflictFolder', 'ConnectionsFolder', 'Contacts', 'ControlPanelFolder', 'Cookies', 'Desktop', 'Documents', 'Downloads', 'Favorites', 'Fonts', 'Games', 'GameTasks', 'History', 'InternetCache', 'InternetFolder', 'Links', 'LocalAppData', 'LocalAppDataLow', 'LocalizedResourcesDir', 'Music', 'NetHood', 'NetworkFolder', 'OriginalImages', 'PhotoAlbums', 'Pictures', 'Playlists', 'PrintersFolder', 'PrintHood', 'Profile', 'ProgramData', 'ProgramFiles', 'ProgramFilesX64', 'ProgramFilesX86', 'ProgramFilesCommon', 'ProgramFilesCommonX64', 'ProgramFilesCommonX86', 'Programs', 'Public', 'PublicDesktop', 'PublicDocuments', 'PublicDownloads', 'PublicGameTasks', 'PublicMusic', 'PublicPictures', 'PublicVideos', 'QuickLaunch', 'Recent', 'RecycleBinFolder', 'ResourceDir', 'RoamingAppData', 'SampleMusic', 'SamplePictures', 'SamplePlaylists', 'SampleVideos', 'SavedGames', 'SavedSearches', 'SEARCH_CSC', 'SEARCH_MAPI', 'SearchHome', 'SendTo', 'SidebarDefaultParts', 'SidebarParts', 'StartMenu', 'Startup', 'SyncManagerFolder', 'SyncResultsFolder', 'SyncSetupFolder', 'System', 'SystemX86', 'Templates', 'TreeProperties', 'UserProfiles', 'UsersFiles', 'Videos', 'Windows')]
        [string]$KnownFolder
    )
    # Define SHGetKnownFolderPathif it hasn't been defined already
    $Type = ([System.Management.Automation.PSTypeName]'KnownFolders.SHGetKnownFolderPathPS').Type
    if (-not $Type) {
        # http://www.pinvoke.net/default.aspx/shell32/SHGetKnownFolderPath.html
        $Signature = @'
[DllImport("shell32.dll")]
public extern static int SHGetKnownFolderPath(ref Guid folderId, uint flags, IntPtr token,[MarshalAs(UnmanagedType.LPWStr)] out string pszPath);
'@
        $Type = Add-Type -MemberDefinition $Signature -Namespace 'KnownFolders' -Name 'SHGetKnownFolderPathPS' -PassThru
    }
    $Path = @{value = $null; }
    $code = $Type::SHGetKnownFolderPath([ref]$KnownFolders[$KnownFolder], 0, 0, [ref]$Path)
    if ($code -eq 0) {

        return $Path;
    }
    return $null
}

<#
.SYNOPSIS
Returns the scaling factor that is configured for a monitor

.DESCRIPTION
Returns the scaling factor that is configured for a monitor

.PARAMETER monitor
The monitor to return the scaling factor for, or if not supplied the primary monitor is used
#>
function Get-DesktopScalingFactor {

    [CmdletBinding()]

    param(
        [parameter(Mandatory = $false, Position = 0)]
        [int] $monitor = 0
    )

    [GenXdev.Helpers.DesktopInfo]::getScalingFactor($monitor)
}

###############################################################################

<#
.SYNOPSIS
Sets the alignment for the Windows 11+ Taskbar

.DESCRIPTION
Sets the alignment for the Windows 11+ Taskbar

.PARAMETER Justify
The new alignment
#>
function Set-TaskbarAlignment() {

    [CmdletBinding()]

    param(
        [Parameter(Mandatory = $True)]
        [ValidateSet(
            "Center",
            "Left"
        )]
        $Justify
    )

    $RegPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"

    if ($Justify -eq "Left") {
        Set-ItemProperty -Path $RegPath -Name TaskbarAl -Value 0
    }
    elseif ($Justify -eq "Center") {
        Set-ItemProperty -Path $RegPath -Name TaskbarAl -Value 1
    }
}

###############################################################################

<#
.SYNOPSIS
Returns the process of the window responsible for hosting the Powershell terminal

.DESCRIPTION
Returns the process of the window responsible for hosting the Powershell terminal
#>
function Get-PowershellMainWindowProcess {

    [CmdletBinding()]
    param()

    $PowershellProcess = [System.Diagnostics.Process]::GetCurrentProcess();

    if (($PowershellProcess.MainWindowHandle -eq 0) -and ($null -ne $PowershellProcess.Parent)) {

        if ($PowershellProcess.Parent.MainWindowHandle -ne 0) {

            Write-Verbose "Parent has mainwindow"

            $PowershellProcess = $PowershellProcess.Parent;
        }
        else {

            $PProcess = Get-Process -Name $PowershellProcess.Parent.ProcessName | Where-Object { 0 -ne $PSItem.MainWindowHandle } | Select-Object -First 1;

            if ($null -ne $PProcess) {

                Write-Verbose "Found simular process that has mainwindow"
                $PowershellProcess = $PProcess
            }
            else {
                Write-Verbose "No simular parent process found with main window"
            }
        }
    }
    else {
        Write-Verbose "No parent found, no main window"
    }

    $PowershellProcess
}

###############################################################################

<#
.SYNOPSIS
Returns a window helper object for the mainwindow of the process responsible for hosting the Powershell terminal

.DESCRIPTION
Returns a window helper object for the mainwindow of the process responsible for hosting the Powershell terminal
#>
function Get-PowershellMainWindow {

    [CmdletBinding()]

    param()

    [GenXdev.Helpers.WindowObj]::GetMainWindow((Get-PowershellMainWindowProcess))[0];
}

###############################################################################

<#
.SYNOPSIS
Positions a window

.DESCRIPTION
Positions a window in a configurable manner, using commandline switches

.PARAMETER Process
The process of the window to position

.PARAMETER Monitor
The monitor to use, 0 = default, 1 = secondary, -1 is discard

.PARAMETER NoBorders
Open in NoBorders mode --> -nb

.PARAMETER Width
The initial width of the window

.PARAMETER Height
The initial height of the window

.PARAMETER X
The initial X position of the window

.PARAMETER Y
The initial Y position of the window

.PARAMETER Left
Place window on the left side of the screen

.PARAMETER Right
Place window on the right side of the screen

.PARAMETER Top
Place window on the top side of the screen

.PARAMETER Bottom
Place window on the bottom side of the screen

.PARAMETER Centered
Place window in the center of the screen

.PARAMETER ApplicationMode
Hide the browser controls --> -a, -app, -appmode

.PARAMETER NoBrowserExtensions
Prevent loading of browser extensions --> -de, -ne

.PARAMETER RestoreFocus
Restore PowerShell window focus --> -bg

.PARAMETER NewWindow
Don't re-use existing window, instead, create a new one -> nw

.PARAMETER PassThrough
Returns a [System.Diagnostics.Process] object of the browserprocess

#>
function Set-WindowPosition {

    [CmdletBinding()]
    [Alias("wp")]

    param(
        ###############################################################################

        [parameter(
            Mandatory = $false,
            Position = 0,
            HelpMessage = "The process of the window to position",
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            ValueFromRemainingArguments = $false
        )]
        [System.Diagnostics.Process[]] $Process,
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard"
        )]
        [int] $Monitor = -1,
        ###############################################################################

        [Alias("nb")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Removes the borders of the window"
        )]
        [switch] $NoBorders,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "The initial width of the window"
        )]
        [int] $Width = -1,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "The initial height of the window"
        )]
        [int] $Height = -1,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "The initial X position of the window"
        )]
        [int] $X = -1,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "The initial Y position of the window"
        )]
        [int] $Y = -1,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "Place window on the left side of the screen"
        )]
        [switch] $Left,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "Place window on the right side of the screen"
        )]
        [switch] $Right,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "Place window on the top side of the screen"
        )]
        [switch] $Top,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "Place window on the bottom side of the screen"
        )]
        [switch] $Bottom,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "Place window in the center of the screen"
        )]
        [switch] $Centered,
        ###############################################################################

        [Alias("bg")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Restore PowerShell window focus"
        )]
        [switch] $RestoreFocus,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "Returns the [System.Diagnostics.Process] object of the browserprocess"
        )]
        [switch] $PassThrough
    )

    Begin {

        # reference powershell main window
        $PowerShellWindow = Get-PowershellMainWindow

        # what if no process is specified?
        if (($null -eq $Process) -or ($Process.Length -lt 1)) {

            $Process = @((Get-PowershellMainWindowProcess))
        }
    }

    Process {

        function refocusTab() {

            # '-RestoreFocus' parameter supplied'?
            if ($RestoreFocus -eq $true) {

                # Get handle to current foreground window
                $CurrentActiveWindow = [GenXdev.Helpers.WindowObj]::GetFocusedWindow();

                # Is it different then the one at the start of this command?
                if (($null -ne $PowerShellWindow) -and ($PowerShellWindow.Handle -ne $CurrentActiveWindow.Handle)) {

                    # restore it
                    $PowershellWindow.SetForeground();

                    # wait
                    [System.Threading.Thread]::Sleep(250);

                    # did it not work?
                    $CurrentActiveWindow = [GenXdev.Helpers.WindowObj]::GetFocusedWindow();
                    if ($PowershellWindow.Handle -ne $CurrentActiveWindow.Handle) {

                        try {
                            # Sending Alt-Tab
                            $helper = New-Object -ComObject WScript.Shell;
                            $helper.sendKeys("%{TAB}");
                            Write-Verbose "Sending Alt-Tab"

                            # wait
                            [System.Threading.Thread]::Sleep(500);
                        }
                        catch {

                        }
                    }
                }
            }
        }

        function position($process, $window, $X, $Y, $Width, $Height) {
            try {
                # have a handle to the mainwindow of the browser?
                if ($window.Length -eq 1) {

                    Write-Verbose "Restoring and positioning window"

                    $window.Move($X, $Y, $Width, $Height) | Out-Null;
                    $window.Move($X, $Y, $Width, $Height) | Out-Null;

                    # # if maximized, restore window style
                    # 1..3 | ForEach-Object {
                    #     $window[0].Show() | Out-Null

                    #     if (($X -is [int]) -and ($X -gt -999999) -and ($Y -is [int]) -and ($Y -gt -999999)) {

                    #         Write-Verbose "Moving to $X x $Y"
                    #         $window[0].Move($X, $Y)  | Out-Null
                    #     }
                    #     else {
                    #         if (($X -is [int]) -and ($X -gt -999999)) {

                    #             Write-Verbose "Moving X to $X"
                    #             $window[0].Left = $X;
                    #         }
                    #         else {
                    #             if (($Y -is [int]) -and ($Y -gt -999999)) {

                    #                 Write-Verbose "Moving Y to $Y"
                    #                 $window[0].Top = $Y;
                    #             }
                    #         }
                    #     }
                    #     if (($Width -is [int]) -and ($Width -gt 0) -and ($Height -is [int]) -and ($Height -gt 0)) {

                    #         Write-Verbose "Resizing to $Width x $Height"
                    #         $window[0].Resize($Width, $Height)  | Out-Null
                    #     }
                    #     else {
                    #         if (($Width -is [int]) -and ($Width -gt 0)) {

                    #             Write-Verbose "Resizing width to $Width"
                    #             $window[0].Width = $Width;
                    #         }
                    #         else {
                    #             if (($Height -is [int]) -and ($Height -gt 0)) {

                    #                 Write-Verbose "Resizing height to $Height"
                    #                 $window[0].Height = $Height;
                    #             }
                    #         }
                    #     }

                    # }

                    # needs to be set NoBorders manually?
                    if ($NoBorders -eq $true) {

                        Write-Verbose "Setting NoBorders"

                        $window[0].RemoveBorder();
                    }
                }
            }
            finally {

                # if needed, restore the focus to the PowerShell terminal
                refocusTab $process $window
            }
        }

        ###############################################################################

        # start processing the Urls that we need to open
        foreach ($currentProcess in $Process) {

            # get window handle
            $window = [GenXdev.Helpers.WindowObj]::GetMainWindow($currentProcess);
            if ($window.Count -eq 0) { continue }

            # reference the requested monitor
            if ($Monitor -eq 0) {

                Write-Verbose "Chosen primary screen"
                $Screen = [System.Windows.Forms.Screen]::PrimaryScreen;
            }
            else {
                if (($Monitor -ge 1) -and ($Monitor -le [System.Windows.Forms.Screen]::AllScreens.Length)) {

                    Write-Verbose "Chosen screen $($monitor-1)"

                    $Screen = [System.Windows.Forms.Screen]::AllScreens[$Monitor - 1]
                }
                else {

                    $Screen = [System.Windows.Forms.Screen]::FromPoint($window[0].Position());
                    Write-Verbose "Chosen screen $([System.Windows.Forms.Screen]::AllScreens.indexOf($Screen))"
                }
            }

            Write-Verbose $Screen

            # remember
            [bool] $HavePositioning = ($Monitor -ge 0) -or ($Left -or $Right -or $Top -or $Bottom -or $Centered -or (($X -is [int]) -and ($X -ge 0)) -or (($Y -is [int]) -and ($Y -ge 0)));

            # init window position
            # '-X' parameter not supplied?
            if (($X -le 0) -or ($X -isnot [int])) {

                $X = $Screen.WorkingArea.X;
            }
            else {

                if ($Monitor -ge 0) {

                    $X = $Screen.WorkingArea.X + $X;
                }
            }
            Write-Verbose "X determined to be $X"

            # '-Y' parameter not supplied?
            if (($Y -le 0) -or ($Y -isnot [int])) {

                $Y = $Screen.WorkingArea.Y;
            }
            else {

                if ($Monitor -ge 0) {

                    $Y = $Screen.WorkingArea.Y + $Y;
                }
            }
            Write-Verbose "Y determined to be $Y"

            if ($HavePositioning) {

                Write-Verbose "Have positioning parameters set"

                $WidthProvided = ($Width -ge 0) -and ($Width -is [int]);
                $heightProvided = ($Height -ge 0) -and ($Height -is [int]);

                # '-Width' parameter not supplied?
                if ($WidthProvided -eq $false) {

                    $Width = $Screen.WorkingArea.Width;

                    Write-Verbose "Width not provided resetted to $Width"
                }

                # '-Height' parameter not supplied?
                if ($heightProvided -eq $false) {

                    $Height = $Screen.WorkingArea.Height;

                    Write-Verbose "Height not provided resetted to $Height"
                }

                # setup exact window position and size
                if ($Left -eq $true) {

                    $X = $Screen.WorkingArea.X;

                    if ($WidthProvided -eq $false) {

                        $Width = [Math]::Min($Screen.WorkingArea.Width / 2, $Width);
                    }

                    Write-Verbose "Left chosen, X = $X, Width = $Width"
                }
                else {
                    if ($Right -eq $true) {

                        if ($WidthProvided -eq $false) {

                            $Width = [Math]::Min($Screen.WorkingArea.Width / 2, $Width);
                        }

                        $X = $Screen.WorkingArea.X + $Screen.WorkingArea.Width - $Width;

                        Write-Verbose "Right chosen, X = $X, Width = $Width"
                    }
                }

                if ($Top -eq $true) {

                    $Y = $Screen.WorkingArea.Y;

                    if ($HeightProvided -eq $false) {

                        $Height = [Math]::Min($Screen.WorkingArea.Height / 2, $Height);
                    }

                    Write-Verbose "Top chosen, Y = $Y, Height = $Height"
                }
                else {
                    if ($Bottom -eq $true) {

                        if ($HeightProvided -eq $false) {

                            $Height = [Math]::Min($Screen.WorkingArea.Height / 2, $Height);
                        }
                        $Y = $Screen.WorkingArea.Y + $Screen.WorkingArea.Height - $Height;

                        Write-Verbose "Bottom chosen, Y = $Y, Height = $Height"
                    }
                }

                if ($Centered -eq $true) {

                    if ($HeightProvided -eq $false) {

                        $Height = [Math]::Round([Math]::Min($Screen.WorkingArea.Height * 0.8, $Height), 0);
                    }

                    if ($WidthProvided -eq $false) {

                        $Width = [Math]::Round([Math]::Min($Screen.WorkingArea.Width * 0.8, $Width), 0);
                    }

                    $X = $Screen.WorkingArea.X + [Math]::Round(($screen.WorkingArea.Width - $Width) / 2, 0);
                    $Y = $Screen.WorkingArea.Y + [Math]::Round(($screen.WorkingArea.Height - $Height) / 2, 0);

                    Write-Verbose "Centered chosen, X = $X, Width = $Width, Y = $Y, Height = $Height"
                }
            }

            position $currentProcess $window $X $Y $Width $Height

            if ($PassThrough -eq $true) {

                $currentProcess
            }
        }
    }
}

###############################################################################

<#
.SYNOPSIS
Positions a window and positions it by default on the secondairy monitor

.DESCRIPTION
Positions a window like Set-WindowPosition -> wp but defaults to the configured secondairy monitor

.PARAMETER Process
The process of the window to position

.PARAMETER Monitor
The monitor to use, 0 = default, 1 = secondary, -1 is discard
.PARAMETER NoBorders
Open in NoBorders mode --> -fs

.PARAMETER Width
The initial width of the window

.PARAMETER Height
The initial height of the window

.PARAMETER X
The initial X position of the window

.PARAMETER Y
The initial Y position of the window

.PARAMETER Left
Place window on the left side of the screen

.PARAMETER Right
Place window on the right side of the screen

.PARAMETER Top
Place window on the top side of the screen

.PARAMETER Bottom
Place window on the bottom side of the screen

.PARAMETER Centered
Place window in the center of the screen

.PARAMETER ApplicationMode
Hide the browser controls --> -a, -app, -appmode

.PARAMETER NoBrowserExtensions
Prevent loading of browser extensions --> -de, -ne

.PARAMETER RestoreFocus
Restore PowerShell window focus --> -bg

.PARAMETER NewWindow
Don't re-use existing window, instead, create a new one -> nw

.PARAMETER PassThrough
Returns a [System.Diagnostics.Process] object of the browserprocess

.EXAMPLE

#>
function Set-WindowPositionForSecondary {

    [CmdletBinding()]
    [Alias("wps")]

    param(
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = -2
    )

    DynamicParam {

        Copy-SetWindowPositionParameters -ParametersToSkip "Process", "Monitor"
    }

    begin {

        if ($Monitor -lt -1) {

            [int] $defaultMonitor = 1;

            if ([int]::TryParse($Global:DefaultSecondaryMonitor, [ref] $defaultMonitor)) {

                $Monitor = $defaultMonitor % [System.Windows.Forms.Screen]::AllScreens.Length;
            }
            else {

                $Monitor = 1 % [System.Windows.Forms.Screen]::AllScreens.Length;
            }
        }
    }

    process {

        Set-WindowPosition @PSBoundParameters
    }
}

###############################################################################

<#
.SYNOPSIS
    Proxy function dynamic parameter block for the Set-WindowPosition cmdlet
.DESCRIPTION
    The dynamic parameter block of a proxy function. This block can be used to copy a proxy function target's parameters .
#>
function Copy-SetWindowPositionParameters {

    [System.Diagnostics.DebuggerStepThrough()]

    param(
        [parameter(Mandatory = $false, Position = 0)]
        [string[]] $ParametersToSkip = @()
    )

    return (Copy-CommandParameters -CommandName "Set-WindowPosition" -ParametersToSkip $ParametersToSkip)
}

###############################################################################

function Start-ProcessWithPriority {

    [CmdletBinding()]
    [Alias("nice")]

    param (

        [parameter(
            Mandatory = $true
        )]
        [string]$FilePath,

        [parameter(
            Mandatory = $false
        )]

        [string[]]$ArgumentList = "",

        [ValidateSet("Idle", "BelowNormal", "Low", "Normal", "AboveNormal", "High", "RealTime")]

        [parameter(
            Mandatory = $false
        )]
        [string] $Priority = "BelowNormal",

        [parameter(
            Mandatory = $false
        )]
        [switch] $noWait
    )

    $process = Start-Process -FilePath $FilePath -ArgumentList $ArgumentList -PassThru -NoNewWindow

    $process.PriorityClass = $Priority

    if ($noWait -eq $true) { return; }

    $process.WaitForExit();

    return $process.ExitCode;
}

###############################################################################
<#
.SYNOPSIS
Creates daily and hourly PowerShell scripts and their corresponding scheduled tasks

.DESCRIPTION
Creates daily and hourly PowerShell scripts and their corresponding scheduled task that will run
as current-user and it's PowerShell profile

.PARAMETER FilePath
Optionally the path of the directory where the scripts will reside
Defaults to [ProfileDir]\ScheduledTasks

.PARAMETER Prefix
Optionally a unique prefix for the Scheduled-Task names
Defaults to 'PS'

#>
function Initialize-ScheduledTaskScripts {

    param(

        [parameter(
            Mandatory = $false
        )]
        [string] $FilePath = "",


        [parameter(
            Mandatory = $false
        )]
        [string] $Prefix = "PS"
    )

    # check parameters
    if ([string]::IsNullOrWhiteSpace($FilePath)) {

        $FilePath = Expand-Path -FilePath "$PSScriptRoot\..\..\..\ScheduledTasks"
    }
    else {

        $FilePath = Expand-Path -FilePath $FilePath
    }

    # Define an array with the names of the days of the week
    $DaysOfWeek = @("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
    $Now = [DateTime]::UtcNow;

    $Credential = Get-Credential

    # define function
    function CheckTask {

        param([string]$TaskName, [string] $Description, $Trigger)

        # Define the path to the PowerShell script for this task
        $ScriptPath = Expand-Path -CreateDirectory -FilePath "$FilePath\$TaskName.ps1"

        # Create the PowerShell script file if it doesn't already exist
        if (-not (Test-Path $ScriptPath -ErrorAction SilentlyContinue)) {

            Write-Verbose "Creating task script file for  \$Prefix\ '$Description'"

            "# $Description`r`n`r`n" | Out-File -FilePath $ScriptPath -Force
        }

        # Check if the task already exists
        if (-not (Get-ScheduledTask -TaskName $TaskName -TaskPath "\$Prefix\" -ErrorAction SilentlyContinue)) {

            Write-Verbose "Creating task \$Prefix\ '$Description'"

            # Define the arguments for the New-ScheduledTaskAction cmdlet
            $ActionArguments = "-ExecutionPolicy Bypass -File `"$ScriptPath`""

            # Create the scheduled task action
            $Action = New-ScheduledTaskAction -Execute "pwsh.exe" -Argument $ActionArguments

            # Create the scheduled task settings
            $Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -Hidden -StartWhenAvailable
            $Settings.AllowHardTerminate = $True
            $Settings.ExecutionTimeLimit = 'PT1H'

            $Settings.volatile = $False

            # $Trigger.StartBoundary = $Now.ToString("yyyy-MM-dd'T'HH:mm:ss")
            $Trigger.EndBoundary = $Now.AddYears(99).ToString("yyyy-MM-dd'T'HH:mm:ss")

            # Combine all parameters
            $Parameters = @{
                "TaskName"    = $TaskName
                "User"        = $Credential.UserName
                "Password"    = $Credential.GetNetworkCredential().Password
                "RunLevel"    = "Highest"
                "Action"      = $Action
                "Description"	= $Description
                "Settings"    = $Settings
                "Trigger"     = $Trigger
                "TaskPath"    = $Prefix
            }
            Register-ScheduledTask @Parameters -Force | Out-Null
        }
    }

    # Construct task descriptor
    $TaskName = $Prefix + "_at_startup"
    $Description = "Scheduled-task executed at startup";
    # Create the scheduled task trigger
    $Trigger = New-ScheduledTaskTrigger -AtStartup
    # Create the task if necessary
    CheckTask $TaskName $Description $Trigger
    #-------------------------------------------------------
    # Construct task descriptor
    $TaskName = $Prefix + "_at_logon"
    $Description = "Scheduled-task executed at logon";
    # Create the scheduled task trigger
    $Trigger = New-ScheduledTaskTrigger -AtLogOn
    # Create the task if necessary
    CheckTask $TaskName $Description $Trigger
    #-------------------------------------------------------

    # Loop through each day of the week
    foreach ($Day in $DaysOfWeek) {

        # Loop through each hour of the day (0-23)
        for ($Hour = 0; $Hour -lt 24; $Hour++) {

            # Define the name of the scheduled task for this hour on this day
            $TaskName = "$Prefix" + "_" + $Day.ToLower() + "_" + $Hour.ToString("D2") + "00h_utc"
            $Description = "Scheduled-task for $Day at $($Hour.ToString('D2')):00h";

            # Create the scheduled task trigger
            $DayDiff = ([int]$Now.DayOfWeek) - $DaysOfWeek.IndexOf($Day);
            $At = $Now.Date.AddDays($DayDiff).AddHours($Hour);
            if ($At -lt $Now) { $At = $At.AddDays(7) }
            $Trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek $Day -At $At

            # Create the task if necessary
            CheckTask $TaskName $Description $Trigger
        }
    }

    # Loop through each hour of the day (0-23)
    for ($Hour = 0; $Hour -lt 24; $Hour++) {

        # Construct task descriptor
        $TaskName = $Prefix + "_daily_" + $Hour.ToString("D2") + "00h_utc"
        $Description = "Scheduled-task executed Daily at $($Hour.ToString('D2')):00h";

        # Create the scheduled task trigger
        $DayDiff = 0;
        $At = $Now.Date.AddDays($DayDiff).AddHours($Hour);
        if ($At -lt $Now) { $At = $At.AddDays(1) }
        $Trigger = New-ScheduledTaskTrigger -Daily -At $At

        # Create the task if necessary
        CheckTask $TaskName $Description $Trigger
    }
}

###############################################################################
<#
.SYNOPSIS
 Creates a system restore point

.DESCRIPTION
Creates a system restore point with a description that includes the current date in ISO format

.PARAMETER Description
The description for the system restore point

.EXAMPLE
New-SystemRestorePoint "My Restore Point"
#>
function New-SystemRestorePoint {
    [Alias("crp")]

    param (
        [parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = "The description for the system restore point",
            ValueFromPipeline = $false
        )]
        [string] $Description
    )

    # Add the current date in ISO format to the description
    $Description += " - " + (Get-Date -Format "o")

    $RestorePointType = 0
    $EventType = 100

    # Load the necessary function
    Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;

    public class SR {
        [DllImport("Srclient.dll")]
        public static extern int SRSetRestorePointW(ref RESTOREPOINTINFO pRestorePtSpec, out STATEMGRSTATUS pSMgrStatus);

        public struct RESTOREPOINTINFO {
            public int dwEventType;
            public int dwRestorePtType;
            public Int64 llSequenceNumber;
            [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 256)]
            public string szDescription;
        }

        public struct STATEMGRSTATUS {
            public int nStatus;
            public Int64 llSequenceNumber;
        }
    }
"@;

    # Create the restore point
    $RestorePoint = New-Object SR+RESTOREPOINTINFO
    $RestorePoint.dwEventType = $EventType
    $RestorePoint.dwRestorePtType = $RestorePointType
    $RestorePoint.szDescription = $Description

    $StateMgrStatus = New-Object SR+STATEMGRSTATUS

    $Result = [SR]::SRSetRestorePointW([ref]$RestorePoint, [ref]$StateMgrStatus)

    if ($Result -eq 0) {
        Write-Host "System restore point created successfully."
    } else {
        Write-Host "Failed to create system restore point. Error code: $Result"
    }
}

################################################################################
################################################################################
################################################################################

# SIG # Begin signature block
# MIIbzgYJKoZIhvcNAQcCoIIbvzCCG7sCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBUD0ewFH6vv9+4
# 8r0MlDuICdIDWr3iNh9wJLTGwXNtoaCCFhswggMOMIIB9qADAgECAhBwxOfTiuon
# hU3SZf3YwpWAMA0GCSqGSIb3DQEBCwUAMB8xHTAbBgNVBAMMFEdlblhkZXYgQXV0
# aGVudGljb2RlMB4XDTI0MDUwNTIwMzEzOFoXDTM0MDUwNTE4NDEzOFowHzEdMBsG
# A1UEAwwUR2VuWGRldiBBdXRoZW50aWNvZGUwggEiMA0GCSqGSIb3DQEBAQUAA4IB
# DwAwggEKAoIBAQDAD4JXwna5uBAYw54JXXscQPSos9pMeeyV99hvQPs6IcQ/wIXs
# zQ0xdkMGlzo1Nvldyqwa6+OXMyHsZM2D6QA1WjRoTzjT432hlGJT3VrP3R9cvOfg
# sAnVLpZy+4uty2fh5o8NEk4tmULOXDPZBT6NOoRjRCyt+KwCL8yioCFWa/7pqpG0
# niyJka8rhOVQLg8sZ+n5DrSihs1o3PyN28mZLendSbL9Y06cbqadL0J6sn31sw6e
# tpLOToIj1DXQbID0ejeafONHYJ3cKBrQ0TG7aoK8dte4X+iQQuDgA/l7ATxCjC7V
# 18vKRQXzSjvBQvNuWSw6DX2b7sc7dzC9v2T1AgMBAAGjRjBEMA4GA1UdDwEB/wQE
# AwIHgDATBgNVHSUEDDAKBggrBgEFBQcDAzAdBgNVHQ4EFgQUf8ZHrsKtJB9RD6z2
# x2Txu7wQ1/4wDQYJKoZIhvcNAQELBQADggEBAK/GgNjLVhQkhbFMrJUt3nFfYa2a
# iP/+U2vapwtqeyNBreMiTYwtqkULEPotRlRCMZ+k8kwRhv1bsR82MXK1H74DKcTM
# 0gu62RxOMXz8ij0BjXW9axEWqYGAbbP0EoNyoBzqiLYqXkwCXqIFsywuDZO4QY3D
# 1c+NEKVnPnhf/gufOUrlugklExh9i4QagCSlUObYAa9yBhcoxOHzN0v6mN+I7EjM
# sVsydPsk3NshubldpNSavFUcF477l21eM5F1bFXGTJGgGq9k1/drpILe5e4oLy9w
# sxmdnqpyvbwtPe2+LZx0XSlR5vCfYFih6eV8fNcgvMmAKAcuIuKxKwJkAscwggWN
# MIIEdaADAgECAhAOmxiO+dAt5+/bUOIIQBhaMA0GCSqGSIb3DQEBDAUAMGUxCzAJ
# BgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5k
# aWdpY2VydC5jb20xJDAiBgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBD
# QTAeFw0yMjA4MDEwMDAwMDBaFw0zMTExMDkyMzU5NTlaMGIxCzAJBgNVBAYTAlVT
# MRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5j
# b20xITAfBgNVBAMTGERpZ2lDZXJ0IFRydXN0ZWQgUm9vdCBHNDCCAiIwDQYJKoZI
# hvcNAQEBBQADggIPADCCAgoCggIBAL/mkHNo3rvkXUo8MCIwaTPswqclLskhPfKK
# 2FnC4SmnPVirdprNrnsbhA3EMB/zG6Q4FutWxpdtHauyefLKEdLkX9YFPFIPUh/G
# nhWlfr6fqVcWWVVyr2iTcMKyunWZanMylNEQRBAu34LzB4TmdDttceItDBvuINXJ
# IB1jKS3O7F5OyJP4IWGbNOsFxl7sWxq868nPzaw0QF+xembud8hIqGZXV59UWI4M
# K7dPpzDZVu7Ke13jrclPXuU15zHL2pNe3I6PgNq2kZhAkHnDeMe2scS1ahg4AxCN
# 2NQ3pC4FfYj1gj4QkXCrVYJBMtfbBHMqbpEBfCFM1LyuGwN1XXhm2ToxRJozQL8I
# 11pJpMLmqaBn3aQnvKFPObURWBf3JFxGj2T3wWmIdph2PVldQnaHiZdpekjw4KIS
# G2aadMreSx7nDmOu5tTvkpI6nj3cAORFJYm2mkQZK37AlLTSYW3rM9nF30sEAMx9
# HJXDj/chsrIRt7t/8tWMcCxBYKqxYxhElRp2Yn72gLD76GSmM9GJB+G9t+ZDpBi4
# pncB4Q+UDCEdslQpJYls5Q5SUUd0viastkF13nqsX40/ybzTQRESW+UQUOsxxcpy
# FiIJ33xMdT9j7CFfxCBRa2+xq4aLT8LWRV+dIPyhHsXAj6KxfgommfXkaS+YHS31
# 2amyHeUbAgMBAAGjggE6MIIBNjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBTs
# 1+OC0nFdZEzfLmc/57qYrhwPTzAfBgNVHSMEGDAWgBRF66Kv9JLLgjEtUYunpyGd
# 823IDzAOBgNVHQ8BAf8EBAMCAYYweQYIKwYBBQUHAQEEbTBrMCQGCCsGAQUFBzAB
# hhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wQwYIKwYBBQUHMAKGN2h0dHA6Ly9j
# YWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRFJvb3RDQS5jcnQw
# RQYDVR0fBD4wPDA6oDigNoY0aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lD
# ZXJ0QXNzdXJlZElEUm9vdENBLmNybDARBgNVHSAECjAIMAYGBFUdIAAwDQYJKoZI
# hvcNAQEMBQADggEBAHCgv0NcVec4X6CjdBs9thbX979XB72arKGHLOyFXqkauyL4
# hxppVCLtpIh3bb0aFPQTSnovLbc47/T/gLn4offyct4kvFIDyE7QKt76LVbP+fT3
# rDB6mouyXtTP0UNEm0Mh65ZyoUi0mcudT6cGAxN3J0TU53/oWajwvy8LpunyNDzs
# 9wPHh6jSTEAZNUZqaVSwuKFWjuyk1T3osdz9HNj0d1pcVIxv76FQPfx2CWiEn2/K
# 2yCNNWAcAgPLILCsWKAOQGPFmCLBsln1VWvPJ6tsds5vIy30fnFqI2si/xK4VC0n
# ftg62fC2h5b9W9FcrBjDTZ9ztwGpn1eqXijiuZQwggauMIIElqADAgECAhAHNje3
# JFR82Ees/ShmKl5bMA0GCSqGSIb3DQEBCwUAMGIxCzAJBgNVBAYTAlVTMRUwEwYD
# VQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xITAf
# BgNVBAMTGERpZ2lDZXJ0IFRydXN0ZWQgUm9vdCBHNDAeFw0yMjAzMjMwMDAwMDBa
# Fw0zNzAzMjIyMzU5NTlaMGMxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2Vy
# dCwgSW5jLjE7MDkGA1UEAxMyRGlnaUNlcnQgVHJ1c3RlZCBHNCBSU0E0MDk2IFNI
# QTI1NiBUaW1lU3RhbXBpbmcgQ0EwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIK
# AoICAQDGhjUGSbPBPXJJUVXHJQPE8pE3qZdRodbSg9GeTKJtoLDMg/la9hGhRBVC
# X6SI82j6ffOciQt/nR+eDzMfUBMLJnOWbfhXqAJ9/UO0hNoR8XOxs+4rgISKIhjf
# 69o9xBd/qxkrPkLcZ47qUT3w1lbU5ygt69OxtXXnHwZljZQp09nsad/ZkIdGAHvb
# REGJ3HxqV3rwN3mfXazL6IRktFLydkf3YYMZ3V+0VAshaG43IbtArF+y3kp9zvU5
# EmfvDqVjbOSmxR3NNg1c1eYbqMFkdECnwHLFuk4fsbVYTXn+149zk6wsOeKlSNbw
# sDETqVcplicu9Yemj052FVUmcJgmf6AaRyBD40NjgHt1biclkJg6OBGz9vae5jtb
# 7IHeIhTZgirHkr+g3uM+onP65x9abJTyUpURK1h0QCirc0PO30qhHGs4xSnzyqqW
# c0Jon7ZGs506o9UD4L/wojzKQtwYSH8UNM/STKvvmz3+DrhkKvp1KCRB7UK/BZxm
# SVJQ9FHzNklNiyDSLFc1eSuo80VgvCONWPfcYd6T/jnA+bIwpUzX6ZhKWD7TA4j+
# s4/TXkt2ElGTyYwMO1uKIqjBJgj5FBASA31fI7tk42PgpuE+9sJ0sj8eCXbsq11G
# deJgo1gJASgADoRU7s7pXcheMBK9Rp6103a50g5rmQzSM7TNsQIDAQABo4IBXTCC
# AVkwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUuhbZbU2FL3MpdpovdYxq
# II+eyG8wHwYDVR0jBBgwFoAU7NfjgtJxXWRM3y5nP+e6mK4cD08wDgYDVR0PAQH/
# BAQDAgGGMBMGA1UdJQQMMAoGCCsGAQUFBwMIMHcGCCsGAQUFBwEBBGswaTAkBggr
# BgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEEGCCsGAQUFBzAChjVo
# dHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRUcnVzdGVkUm9vdEc0
# LmNydDBDBgNVHR8EPDA6MDigNqA0hjJodHRwOi8vY3JsMy5kaWdpY2VydC5jb20v
# RGlnaUNlcnRUcnVzdGVkUm9vdEc0LmNybDAgBgNVHSAEGTAXMAgGBmeBDAEEAjAL
# BglghkgBhv1sBwEwDQYJKoZIhvcNAQELBQADggIBAH1ZjsCTtm+YqUQiAX5m1tgh
# QuGwGC4QTRPPMFPOvxj7x1Bd4ksp+3CKDaopafxpwc8dB+k+YMjYC+VcW9dth/qE
# ICU0MWfNthKWb8RQTGIdDAiCqBa9qVbPFXONASIlzpVpP0d3+3J0FNf/q0+KLHqr
# hc1DX+1gtqpPkWaeLJ7giqzl/Yy8ZCaHbJK9nXzQcAp876i8dU+6WvepELJd6f8o
# VInw1YpxdmXazPByoyP6wCeCRK6ZJxurJB4mwbfeKuv2nrF5mYGjVoarCkXJ38SN
# oOeY+/umnXKvxMfBwWpx2cYTgAnEtp/Nh4cku0+jSbl3ZpHxcpzpSwJSpzd+k1Os
# Ox0ISQ+UzTl63f8lY5knLD0/a6fxZsNBzU+2QJshIUDQtxMkzdwdeDrknq3lNHGS
# 1yZr5Dhzq6YBT70/O3itTK37xJV77QpfMzmHQXh6OOmc4d0j/R0o08f56PGYX/sr
# 2H7yRp11LB4nLCbbbxV7HhmLNriT1ObyF5lZynDwN7+YAN8gFk8n+2BnFqFmut1V
# wDophrCYoCvtlUG3OtUVmDG0YgkPCr2B2RP+v6TR81fZvAT6gt4y3wSJ8ADNXcL5
# 0CN/AAvkdgIm2fBldkKmKYcJRyvmfxqkhQ/8mJb2VVQrH4D6wPIOK+XW+6kvRBVK
# 5xMOHds3OBqhK/bt1nz8MIIGwjCCBKqgAwIBAgIQBUSv85SdCDmmv9s/X+VhFjAN
# BgkqhkiG9w0BAQsFADBjMQswCQYDVQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQs
# IEluYy4xOzA5BgNVBAMTMkRpZ2lDZXJ0IFRydXN0ZWQgRzQgUlNBNDA5NiBTSEEy
# NTYgVGltZVN0YW1waW5nIENBMB4XDTIzMDcxNDAwMDAwMFoXDTM0MTAxMzIzNTk1
# OVowSDELMAkGA1UEBhMCVVMxFzAVBgNVBAoTDkRpZ2lDZXJ0LCBJbmMuMSAwHgYD
# VQQDExdEaWdpQ2VydCBUaW1lc3RhbXAgMjAyMzCCAiIwDQYJKoZIhvcNAQEBBQAD
# ggIPADCCAgoCggIBAKNTRYcdg45brD5UsyPgz5/X5dLnXaEOCdwvSKOXejsqnGfc
# YhVYwamTEafNqrJq3RApih5iY2nTWJw1cb86l+uUUI8cIOrHmjsvlmbjaedp/lvD
# 1isgHMGXlLSlUIHyz8sHpjBoyoNC2vx/CSSUpIIa2mq62DvKXd4ZGIX7ReoNYWyd
# /nFexAaaPPDFLnkPG2ZS48jWPl/aQ9OE9dDH9kgtXkV1lnX+3RChG4PBuOZSlbVH
# 13gpOWvgeFmX40QrStWVzu8IF+qCZE3/I+PKhu60pCFkcOvV5aDaY7Mu6QXuqvYk
# 9R28mxyyt1/f8O52fTGZZUdVnUokL6wrl76f5P17cz4y7lI0+9S769SgLDSb495u
# ZBkHNwGRDxy1Uc2qTGaDiGhiu7xBG3gZbeTZD+BYQfvYsSzhUa+0rRUGFOpiCBPT
# aR58ZE2dD9/O0V6MqqtQFcmzyrzXxDtoRKOlO0L9c33u3Qr/eTQQfqZcClhMAD6F
# aXXHg2TWdc2PEnZWpST618RrIbroHzSYLzrqawGw9/sqhux7UjipmAmhcbJsca8+
# uG+W1eEQE/5hRwqM/vC2x9XH3mwk8L9CgsqgcT2ckpMEtGlwJw1Pt7U20clfCKRw
# o+wK8REuZODLIivK8SgTIUlRfgZm0zu++uuRONhRB8qUt+JQofM604qDy0B7AgMB
# AAGjggGLMIIBhzAOBgNVHQ8BAf8EBAMCB4AwDAYDVR0TAQH/BAIwADAWBgNVHSUB
# Af8EDDAKBggrBgEFBQcDCDAgBgNVHSAEGTAXMAgGBmeBDAEEAjALBglghkgBhv1s
# BwEwHwYDVR0jBBgwFoAUuhbZbU2FL3MpdpovdYxqII+eyG8wHQYDVR0OBBYEFKW2
# 7xPn783QZKHVVqllMaPe1eNJMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwz
# LmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRHNFJTQTQwOTZTSEEyNTZUaW1l
# U3RhbXBpbmdDQS5jcmwwgZAGCCsGAQUFBwEBBIGDMIGAMCQGCCsGAQUFBzABhhho
# dHRwOi8vb2NzcC5kaWdpY2VydC5jb20wWAYIKwYBBQUHMAKGTGh0dHA6Ly9jYWNl
# cnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRHNFJTQTQwOTZTSEEyNTZU
# aW1lU3RhbXBpbmdDQS5jcnQwDQYJKoZIhvcNAQELBQADggIBAIEa1t6gqbWYF7xw
# jU+KPGic2CX/yyzkzepdIpLsjCICqbjPgKjZ5+PF7SaCinEvGN1Ott5s1+FgnCvt
# 7T1IjrhrunxdvcJhN2hJd6PrkKoS1yeF844ektrCQDifXcigLiV4JZ0qBXqEKZi2
# V3mP2yZWK7Dzp703DNiYdk9WuVLCtp04qYHnbUFcjGnRuSvExnvPnPp44pMadqJp
# ddNQ5EQSviANnqlE0PjlSXcIWiHFtM+YlRpUurm8wWkZus8W8oM3NG6wQSbd3lqX
# TzON1I13fXVFoaVYJmoDRd7ZULVQjK9WvUzF4UbFKNOt50MAcN7MmJ4ZiQPq1JE3
# 701S88lgIcRWR+3aEUuMMsOI5ljitts++V+wQtaP4xeR0arAVeOGv6wnLEHQmjNK
# qDbUuXKWfpd5OEhfysLcPTLfddY2Z1qJ+Panx+VPNTwAvb6cKmx5AdzaROY63jg7
# B145WPR8czFVoIARyxQMfq68/qTreWWqaNYiyjvrmoI1VygWy2nyMpqy0tg6uLFG
# hmu6F/3Ed2wVbK6rr3M66ElGt9V/zLY4wNjsHPW2obhDLN9OTH0eaHDAdwrUAuBc
# YLso/zjlUlrWrBciI0707NMX+1Br/wd3H3GXREHJuEbTbDJ8WC9nR2XlG3O2mflr
# LAZG70Ee8PBf4NvZrZCARK+AEEGKMYIFCTCCBQUCAQEwMzAfMR0wGwYDVQQDDBRH
# ZW5YZGV2IEF1dGhlbnRpY29kZQIQcMTn04rqJ4VN0mX92MKVgDANBglghkgBZQME
# AgEFAKCBhDAYBgorBgEEAYI3AgEMMQowCKACgAChAoAAMBkGCSqGSIb3DQEJAzEM
# BgorBgEEAYI3AgEEMBwGCisGAQQBgjcCAQsxDjAMBgorBgEEAYI3AgEVMC8GCSqG
# SIb3DQEJBDEiBCDAvKS2C5jETSv4aD/sX+jwhPvhfsSkkny0notxiBYbBTANBgkq
# hkiG9w0BAQEFAASCAQAFV8Eia5p7Z+4maNLDwhZ/wyM+j8hz3olS9vd1A2TsM0Sg
# pOmn0Uc9JT55EdHkqYSQ2DTxnQU9/Q8Y16OkukxV0DVnL0rJTbrS1tpaqIYNbB47
# ku72bYdv/DCn4Z8f88zYXaowdFAQ80O/0AAU+p+w+LLez1Mgwtw2Tq1Jih1F8fwH
# pDYpJ905/kvNJe6mgEvn8lS7psJMd1R0uBhNIXZJzHl8UzHDq8dVhpksvrtKUQo7
# 36QkL6kPLJqzc/YPKJ0rnIY/+KudoOdB2MxFD4u5YhJUKb6G57jQYfmLUjDnuqTi
# SMlK5bhjXV2knZeuOy5e7+saQfBLYxgEiWgjPqDtoYIDIDCCAxwGCSqGSIb3DQEJ
# BjGCAw0wggMJAgEBMHcwYzELMAkGA1UEBhMCVVMxFzAVBgNVBAoTDkRpZ2lDZXJ0
# LCBJbmMuMTswOQYDVQQDEzJEaWdpQ2VydCBUcnVzdGVkIEc0IFJTQTQwOTYgU0hB
# MjU2IFRpbWVTdGFtcGluZyBDQQIQBUSv85SdCDmmv9s/X+VhFjANBglghkgBZQME
# AgEFAKBpMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8X
# DTI0MDUyNjE2NTEyNVowLwYJKoZIhvcNAQkEMSIEIP4iZO7i38CF/zggGXJZndb1
# xy9bXkmxfnVwVJlM8lhJMA0GCSqGSIb3DQEBAQUABIICAGLdVKc3UOB4MIJoOzVQ
# 0cHjQj8IyHyVBgSeEddwMeeho4xgMO0Ji5ynCY9myYA1gzrXkAwVvV+7EVsmzETj
# QFc7ZKzp+bOuvnD/L8gs5s/n0+pQ/PJZ2knwPcsgYfusBhpG3GtX8ubv09LI4UXV
# Ciz/4zN6pT1IwAq9sateJ5Aw/9zOKKkHPhD16n6m6UvA7mD0XW9k8LJ07rs44nZM
# 0iHp97aorRnEDRAv34oquD63j1tgdqftM3a8RRd54oFz+yviWOjnPOzyggFjB5aH
# oBcFlYGoglNJo4Xk567Dg0yTrx+ycHD49pgLdmnczO4vh6tzTUw13nmjVwld/wli
# yT2F+OKBwGftyz6sUNZrA1GHk7ykElOFgoEqXa/ckK+UAKBYPcq1m4S0A7uXYqfu
# J05NLR8UQ3sg1vWcwiyxxxHMfUTptogzUjcOVoqztB9pU2zZAtF4pURwgPhUHIrf
# 62iJVXm/DT8eB5+J62Db6QLvjXdAcbJkWJs8ZzfWA1oojm1iv3RiAmksdrJcOaie
# 9V5asJtVs9F4b3dOXKoZbR9GDpMEv2tvyEd/JzjfxBun3CQdmDEIBdeuzwuAIRPq
# 1+N2gzxsUyc861kZenxa85XooWOgiS6ypgILAJS/WiQP7L1slAHjSKRNItil70y+
# N/t1m/6fgCyc+mxmzkyiApNd
# SIG # End signature block
