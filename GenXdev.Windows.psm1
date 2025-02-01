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

    [CmdletBinding(DefaultParameterSetName = "byprocessname")]
    [Alias()]

    param (
        [parameter(Mandatory, ParameterSetName = "byprocessname")]
        [string] $ProcessName,

        [parameter(Mandatory, ParameterSetName = "bywindowhandle")]
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
        [Parameter(Mandatory)]
        [ValidateSet('3DObjects', 'AddNewPrograms', 'AdminTools', 'AppUpdates', 'CDBurning', 'ChangeRemovePrograms', 'CommonAdminTools', 'CommonOEMLinks', 'CommonPrograms', 'CommonStartMenu', 'CommonStartup', 'CommonTemplates', 'ComputerFolder', 'ConflictFolder', 'ConnectionsFolder', 'Contacts', 'ControlPanelFolder', 'Cookies', 'Desktop', 'Documents', 'Downloads', 'Favorites', 'Fonts', 'Games', 'GameTasks', 'History', 'InternetCache', 'InternetFolder', 'Links', 'LocalAppData', 'LocalAppDataLow', 'LocalizedResourcesDir', 'Music', 'NetHood', 'NetworkFolder', 'OriginalImages', 'PhotoAlbums', 'Pictures', 'Playlists', 'PrintersFolder', 'PrintHood', 'Profile', 'ProgramData', 'ProgramFiles', 'ProgramFilesX64', 'ProgramFilesX86', 'ProgramFilesCommon', 'ProgramFilesCommonX64', 'ProgramFilesCommonX86', 'Programs', 'Public', 'PublicDesktop', 'PublicDocuments', 'PublicDownloads', 'PublicGameTasks', 'PublicMusic', 'PublicPictures', 'PublicVideos', 'QuickLaunch', 'Recent', 'RecycleBinFolder', 'ResourceDir', 'RoamingAppData', 'SampleMusic', 'SamplePictures', 'SamplePlaylists', 'SampleVideos', 'SavedGames', 'SavedSearches', 'SEARCH_CSC', 'SEARCH_MAPI', 'SearchHome', 'SendTo', 'SidebarDefaultParts', 'SidebarParts', 'StartMenu', 'Startup', 'SyncManagerFolder', 'SyncResultsFolder', 'SyncSetupFolder', 'System', 'SystemX86', 'Templates', 'TreeProperties', 'UserProfiles', 'UsersFiles', 'Videos', 'Windows')]
        [string]$KnownFolder,

        [Parameter(Mandatory)]
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
    [Alias("folder")]

    param (
        [Parameter(Mandatory)]
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
        [Parameter(Mandatory)]
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
    $PProcess = $PowershellProcess;

    while (($PProcess.MainWindowHandle -eq 0) -and ($null -ne $PProcess.Parent)) {

        $PProcess = $PProcess.Parent;
    }

    if ($PProcess.MainWindowHandle -ne 0) {

        Write-Verbose "Parent has mainwindow"

        $PowershellProcess = $PProcess;
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

.PARAMETER RestoreFocus
Restore PowerShell window focus --> -bg

.PARAMETER NewWindow
Don't re-use existing window, instead, create a new one -> nw

.PARAMETER PassThru
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
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
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

        [parameter(
            Mandatory = $false,
            HelpMessage = "Maximize the window"
        )]
        [switch] $Fullscreen,
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
        [switch] $PassThru

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

        $Screen = [WpfScreenHelper.Screen]::PrimaryScreen;
        $AllScreens = @([WpfScreenHelper.Screen]::AllScreens | ForEach-Object { $PSItem });
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

            # have a handle to the mainwindow of the browser?
            if ($window.Length -eq 1) {

                Write-Verbose "Restoring and positioning window"

                $window.Move($X, $Y, $Width, $Height) | Out-Null;
                $window.Move($X, $Y, $Width, $Height) | Out-Null;

                # needs to be set NoBorders manually?
                if ($NoBorders -eq $true) {

                    Write-Verbose "Setting NoBorders"

                    $window[0].RemoveBorder();
                }
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

                Write-Verbose "Choosing primary monitor, because default monitor requested using -Monitor 0"
            }
            else {
                if ($Monitor -eq -2 -and $Global:DefaultSecondaryMonitor -is [int] -and $Global:DefaultSecondaryMonitor -ge 0) {

                    Write-Verbose "Picking monitor #$((($Global:DefaultSecondaryMonitor-1) % $AllScreens.Length)) as secondary (requested with -monitor -2) set by `$Global:DefaultSecondaryMonitor"
                    $Screen = $AllScreens[($Global:DefaultSecondaryMonitor - 1) % $AllScreens.Length];
                }
                elseif ($Monitor -eq -2 -and (-not ($Global:DefaultSecondaryMonitor -is [int] -and $Global:DefaultSecondaryMonitor -ge 0)) -and ((Get-MonitorCount) -gt 1)) {

                    Write-Verbose "Picking monitor #1 as default secondary (requested with -monitor -2), because `$Global:DefaultSecondaryMonitor not set"
                    $Screen = $AllScreens[1];
                }
                elseif ($Monitor -ge 1) {

                    Write-Verbose "Picking monitor #$(($Monitor - 1) % $AllScreens.Length) as requested by the -Monitor parameter"
                    $Screen = $AllScreens[($Monitor - 1) % $AllScreens.Length]
                }
                elseif ($Monitor -eq 0) {

                    Write-Verbose "Picking monitor #1 (same as PowerShell), because no monitor specified"
                    $Screen = [WpfScreenHelper.Screen]::FromPoint(@{X = $window[0].Position().X; Y = $window[0].Position().Y });
                }
            }

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

            if ($Fullscreen -eq $true) {

                $Width = $Screen.WorkingArea.Width;
                $Height = $Screen.WorkingArea.Height;
            }

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

        if ($PassThru -eq $true) {

            $currentProcess
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

.PARAMETER RestoreFocus
Restore PowerShell window focus --> -bg

.PARAMETER NewWindow
Don't re-use existing window, instead, create a new one -> nw

.PARAMETER PassThru
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

            $AllScreens = @([WpfScreenHelper.Screen]::AllScreens | ForEach-Object { $PSItem });

            if ([int]::TryParse($Global:DefaultSecondaryMonitor, [ref] $defaultMonitor)) {

                $Monitor = $defaultMonitor % $AllScreens.Length;
            }
            else {

                $Monitor = 1 % $AllScreens.Length;
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
            Mandatory
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
        [switch] $NoWait,

        [parameter(
            Mandatory = $false
        )]
        [switch] $PassThru
    )

    $process = Start-Process -FilePath $FilePath -ArgumentList $ArgumentList -PassThru -NoNewWindow
    if ($null -eq $process) { return; }

    $process.PriorityClass = $Priority

    if ($NoWait -eq $true) { return; }

    $process.WaitForExit();

    if ($PassThru -eq $true) { return $process; }
}

###############################################################################

function Get-MpCmdRunPath {

    # Construct the path to MpCmdRun.exe
    $mpCmdRunPath = "$($Env:ProgramFiles)\Windows Defender\MpCmdRun.exe"

    # Check if the file exists
    if (Test-Path -Path $mpCmdRunPath) {

        return $mpCmdRunPath

    }
    else {

        Write-Error "MpCmdRun.exe not found at the expected location: $mpCmdRunPath"
    }
}

###############################################################################
<#
.SYNOPSIS
Executes a Windows Defender virusscan on a specified file or directory.

.DESCRIPTION
Executes a Windows Defender virusscan on a specified file or directory using the MpCmdRun.exe command-line utility.
The function returns a boolean success result, when $true it indicates no threats where find in the file.

.PARAMETER FilePath
The path to the file or directory to be scanned.

.PARAMETER EnableRemediation
Instructs Windows Defender to take action when the provided FilePath contains a threat.

.EXAMPLE
Test-PathUsingWindowsDefender -FilePath "C:\Path\to\File.txt" -Verbose
#>

function Test-PathUsingWindowsDefender {

    [Alias("virusscan")]
    [Alias("HasNoVirus")]

    [CmdletBinding()]
    param (
        [parameter(
            Mandatory,
            Position = 0,
            HelpMessage = "The path to the file or directory to be scanned."
        )]
        [string] $FilePath,

        [parameter(
            Mandatory = $false,
            HelpMessage = "Instructs Windows Defender to take action when the provided FilePath contains a threat."
        )]
        [switch] $EnableRemediation
    )

    $FilePath = Expand-Path $FilePath
    $MpCmdRunPath = Get-MpCmdRunPath

    if (-not [IO.File]::Exists($filePath)) {

        throw "The file '$FilePath' was not found";
    }

    if ($null -eq $MpCmdRunPath) {

        throw "Windows defender CLI not found";
    }

    $scriptBlock = $EnableRemediation ? {

        & "$MpCmdrunPath" -Scan -ScanType 3 -File "$FilePath" |
        ForEach-Object {

            Write-Verbose $PSItem
        }
    } : {

        & "$MpCmdrunPath" -Scan -ScanType 3 -File "$FilePath" -DisableRemediation |
        ForEach-Object {

            Write-Verbose $PSItem
        }
    }

    Invoke-Command -ScriptBlock $scriptBlock

    return ($LASTEXITCODE -eq 0)
}

###############################################################################
<#
.SYNOPSIS
Retrieves the [Process] object of the window that has keyboard focus on Windows.

.DESCRIPTION
    This function retrieves the [Process] object of the window that currently has keyboard focus on Windows.

.EXAMPLE
    Get-CurrentFocusedProcess
#>

function Get-CurrentFocusedProcess {
    [CmdletBinding()]
    param()

    Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;

    public class User32 {
        [DllImport("user32.dll")]
        public static extern IntPtr GetForegroundWindow();

        [DllImport("user32.dll")]
        public static extern int GetWindowThreadProcessId(IntPtr hWnd, out int processId);
    }
"@

    $foregroundWindow = [User32]::GetForegroundWindow()
    $processId = 0
    [User32]::GetWindowThreadProcessId($foregroundWindow, [ref]$processId)

    if ($processId -ne 0) {
        $process = Get-Process -Id $processId -ErrorAction SilentlyContinue
        if ($process) {
            return $process
        }
    }

    Write-Warning "Failed to retrieve the process of the current focused window."
}

###############################################################################

function Set-ForegroundWindow {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [IntPtr] $WindowHandle
    )

    try {

        [void] [GenXdev.Helpers.WindowObj]::SwitchToThisWindow($WindowHandle, $false);
    }
    catch {

    }
    try {

        [void] [GenXdev.Helpers.WindowObj]::SetForegroundWindow($WindowHandle)
    }
    catch {

    }
}

###############################################################################
<#
.SYNOPSIS
Creates daily and hourly PowerShell scripts and their corresponding scheduled task

.DESCRIPTION
Creates daily and hourly PowerShell scripts and their corresponding scheduled task that will run as system

.PARAMETER FilePath
The path of the directory where the scripts will reside

.PARAMETER Prefix
A Prefix for the Scheduled-Task names

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

    # $Principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -RunLevel Highest
    $Credential = Get-Credential -UserName ([System.Security.Principal.WindowsIdentity]::GetCurrent().Name)
    # $Credential = Get-Credential

    # define function
    function CheckTask {

        param([string]$TaskName, [string] $Description, $Trigger)

        # Define the path to the PowerShell script for this task
        $ScriptPath = Expand-Path -CreateDirectory -FilePath "$FilePath\$TaskName.ps1"

        # Create the PowerShell script file if it doesn't already exist
        if (-not (Test-Path $ScriptPath -ErrorAction SilentlyContinue)) {
            # "# $Description`r`n`r`n" | Out-File -FilePath $ScriptPath -Force
            "# $Description`r`n`r`n$($Description | ConvertTo-Json) | Out-File '$Global:WorkspaceFolder\scheduledtasks.log.txt' -Append`r`n" | Out-File -FilePath $ScriptPath -Force

            # "Invoke-Command -Credential (`r`n`tGet-Credential -UserName `"$([System.Security.Principal.WindowsIdentity]::GetCurrent().Name)`"`r`n) -ScriptBlock {`r`n`r`n`t# Scripts in this block are using the profile of $([System.Security.Principal.WindowsIdentity]::GetCurrent().Name)`r`n`r`n}" | Out-File -FilePath $ScriptPath -Append
            # "Invoke-Command -Credential (`r`n`tGet-Credential -UserName `"$([System.Security.Principal.WindowsIdentity]::GetCurrent().Name)`"`r`n) -ScriptBlock {`r`n`r`n`t# Scripts in this block are using the profile of $([System.Security.Principal.WindowsIdentity]::GetCurrent().Name)`r`n`r`n`tSendAutomateCloudMessage `"$($Description.Replace('"', '``"'))`"`r`n}" | Out-File -FilePath $ScriptPath -Append
        }

        # Check if the task already exists
        if (-not (Get-ScheduledTask -TaskName $TaskName -TaskPath "\$Prefix\" -ErrorAction SilentlyContinue)) {

            Write-Verbose "Creating task \$Prefix\ '$Description'"

            # Define the arguments for the New-ScheduledTaskAction cmdlet
            $ActionArguments = "-ExecutionPolicy Bypass -NoLogo -Command & `"'$ScriptPath'`"";

            # Create the scheduled task action
            $Action = New-ScheduledTaskAction -Execute ((Get-Command "pwsh.exe").source) -Argument $ActionArguments -Id "Exec $TaskName".Replace(" ", "_") -WorkingDirectory $Global:WorkspaceFolder

            # Create the scheduled task settings
            $Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -Hidden -StartWhenAvailable
            $Settings.AllowHardTerminate = $True
            # $Settings.DeleteExpiredTaskAfter = 'PT0S'
            $Settings.ExecutionTimeLimit = 'PT1H'
            $Settings.Volatile = $False

            # $Trigger.StartBoundary = $Now.ToString("yyyy-MM-dd'T'HH:mm:ss")
            $Trigger.EndBoundary = $Now.AddYears(99).ToString("yyyy-MM-dd'T'HH:mm:ss")

            $Ptr = [System.Runtime.InteropServices.Marshal]::SecureStringToGlobalAllocUnicode($Credential.Password)
            $PlainPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringUni($Ptr)
            [System.Runtime.InteropServices.Marshal]::ZeroFreeGlobalAllocUnicode($Ptr)

            # Combine all parameters
            $Parameters = @{
                "TaskName"    = $TaskName
                # "Principal"   = $Principal
                "User"        = $Credential.UserName
                "Password"    = $PlainPassword
                "RunLevel"    = "Highest"
                "Action"      = $Action
                "Description"	= $Description
                "Settings"    = $Settings
                "Trigger"     = $Trigger
                "TaskPath"    = $Prefix
                "Force"       = $true
            }

            Register-ScheduledTask @Parameters -Force
        }
    }

    # Define the name of the scheduled task for daily execution at this time
    $TaskName = $Prefix + "_at_startup"
    $Description = "Scheduled-task executed at startup";
    # Create the scheduled task trigger
    $Trigger = New-ScheduledTaskTrigger -AtStartup
    # delegate
    CheckTask $TaskName $Description $Trigger
    #-------------------------------------------------------
    # Define the name of the scheduled task for daily execution at this time
    $TaskName = $Prefix + "_at_logon"
    $Description = "Scheduled-task executed at logon";
    # Create the scheduled task trigger
    $Trigger = New-ScheduledTaskTrigger -AtLogOn
    # delegate
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

            # delegate
            CheckTask $TaskName $Description $Trigger
        }
    }

    # Loop through each hour of the day (0-23)
    for ($Hour = 0; $Hour -lt 24; $Hour++) {

        # Define the name of the scheduled task for daily execution at this time
        $TaskName = $Prefix + "_daily_" + $Hour.ToString("D2") + "00h_utc"
        $Description = "Scheduled-task executed Daily at $($Hour.ToString('D2')):00h";

        # Create the scheduled task trigger
        $DayDiff = ([int]$Now.DayOfWeek) - $DaysOfWeek.IndexOf($Day);
        $At = $Now.Date.AddDays($DayDiff).AddHours($Hour);
        if ($At -lt $Now) { $At = $At.AddDays(7) }
        $Trigger = New-ScheduledTaskTrigger -Daily -At $At

        # delegate
        CheckTask $TaskName $Description $Trigger
    }
}

###############################################################################

function Get-MonitorCount {

    @([WpfScreenHelper.Screen]::AllScreens).Count
}

###############################################################################

<#
.SYNOPSIS
Retrieves child processes whose parent chain includes the current PowerShell process.

.DESCRIPTION
Returns processes that are children of the current PowerShell process by examining their parent process chain.

#>
function Get-ChildProcesses {
    $currentPID = $PID
    $processes = Get-Process;
    $processes | Where-Object {
        $process = $PSItem
        while ($null -ne $process.Parent) {

            if ($process.Parent.Id -eq $currentPID) {

                return $true
            }

            $process = $process.Parent
        }
        return $false
    }
}

################################################################################
function CurrentUserHasElivatedRights() {

    $id = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $p = New-Object System.Security.Principal.WindowsPrincipal($id)

    if ($p.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator) -or
        $p.IsInRole([System.Security.Principal.WindowsBuiltInRole]::BackupOperator)) {

        return $true;
    }

    return $false;
}

################################################################################
<#
.SYNOPSIS
    Sends keys to a window as if typed by user

.DESCRIPTION
    Sends keys to the active window or to the window of a specified process
    as if typed by the user.

    The text strings can contain control characters like {F11} or {ENTER}
    they will press the corresponding keys, unless -Escape is specified.

    Line feeds will automatically be converted to {ENTER} control codes.
    and Tabs to {TAB}.

.PARAMETER Keys
    The text to send

.PARAMETER Escape
    Escape control characters like {F11} or {ENTER} or modifiers like +(meaning shift), ^(meaning control), %(meaning alt)

.PARAMETER Process
    The process to send the keys to

.PARAMETER HoldKeyboardFocus
    Hold the keyboard focus to the target process main window when complete

.EXAMPLE
    Send-Keys -Keys "Hello World" -Escape

.EXAMPLE
    Send-Keys -Keys "Hello World" -Process (Get-Process code | Select -First 1)
#>
function Send-Keys {

    [CmdletBinding()]
    param (
        [Parameter(
            Position = 0,
            Mandatory,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            ValueFromRemainingArguments,
            HelpMessage = "The text to send"
        )]
        [Alias("q", "Value", "Name", "Text", "Query", "Queries")]
        [string[]] $Keys,

        [Parameter(
            Mandatory = $false,
            HelpMessage = "Escape control characters like {F11} or {ENTER} or modifiers like +(meaning shift), ^(meaning control), %(meaning alt)"
        )]
        [switch] $Escape,

        [Parameter(
            Mandatory = $false,
            HelpMessage = "The process to send the keys to"
        )]
        [System.Diagnostics.Process] $Process,

        [Parameter(
            Mandatory = $false,
            HelpMessage = "Hold the keyboard focus to the target process main window when complete"
        )]
        [switch] $HoldKeyboardFocus,

        [Parameter(
            Mandatory = $false,
            HelpMessage = "Convert line feeds into Shift-Enter instead of just Enter"
        )]
        [switch] $ShiftEnter
    )

    begin {

        $windowProcess = $Process;
        $helper = New-Object -ComObject WScript.Shell;

        if ($null -ne $Process) {

            if ($windowProcess.MainWindowHandle -eq 0) {

                Start-Sleep 2 | Out-Null
            }

            while (($null -ne $windowProcess) -and ($windowProcess.MainWindowHandle -eq 0)) {

                $windowProcess = $windowProcess.Parent
            }

            if ($null -eq $windowProcess) {

                $windowProcess = (
                    Get-Process "$([IO.Path]::GetFileNameWithoutExtension($process.Path))" |
                    Where-Object {
                        ($PSItem.Id -ne $Process.Id) -and ($PSItem.MainWindowHandle -ne 0)
                    } |
                    Sort-Object -Property StartTime -Descending |
                    Select-Object -First 1
                );

                if ($null -eq $windowProcess) {

                    throw "could not find a window process to send the keys to"
                    return;
                }
            }

            try {
                $w = [GenXdev.Helpers.WindowObj]::new($windowProcess, $windowProcess.MainWindowTitle);
                $w.Show() | Out-Null;
                $w.SetForeground() | Out-Null
            }
            catch {

            }

            Set-ForegroundWindow -WindowHandle ($windowProcess.MainWindowHandle) | Out-Null

            [System.Threading.Thread]::Sleep(500);
        }
    }

    process {

        try {
            foreach ($key in $Keys) {

                $escapedQuery = $key -join " "

                if ($Escape -eq $true) {

                    $escapedQuery = $escapedQuery -replace '(\{)', '{{}'
                    $escapedQuery = $escapedQuery -replace '(\})', '{}}'
                }

                $escapedQuery = $escapedQuery -replace '`r', '`n'
                $escapedQuery = $escapedQuery -replace '`n`n', '`n'

                if ($ShiftEnter -eq $true) {

                    $escapedQuery = $escapedQuery -replace '`n', '+{ENTER}'
                }
                else {

                    $escapedQuery = $escapedQuery -replace '`n', '{ENTER}'
                }

                Write-Verbose "Sending keys: $escapedQuery"

                $helper.sendKeys($escapedQuery) | Out-Null
            }
        }
        finally {
            if ($null -ne $windowProcess) {

                [System.Threading.Thread]::Sleep(1500);

                if (-not $HoldKeyboardFocus) {

                    try {
                        $psw = Get-PowershellMainWindow
                        $psw.SetForeground() | Out-Null
                        Set-ForegroundWindow -WindowHandle ($psw.Handle)
                    }
                    catch {}
                }
            }
        }
    }

}