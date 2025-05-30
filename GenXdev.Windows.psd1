#
# Module manifest for module 'GenXdev.Windows'
#
# Generated by: genXdev
#
# Generated on: 09/05/2025
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'GenXdev.Windows.psm1'

# Version number of this module.
ModuleVersion = '1.174.2025'

# Supported PSEditions
CompatiblePSEditions = 'Core'

# ID used to uniquely identify this module
GUID = '2f62080f-0483-4421-8437-c3d433b65175'

# Author of this module
Author = 'genXdev'

# Company or vendor of this module
CompanyName = 'GenXdev'

# Copyright statement for this module
Copyright = 'Copyright 2021-2025 GenXdev'

# Description of the functionality provided by this module
Description = 'A Windows PowerShell module that provides ui Windows manipulation helpers'

# Minimum version of the PowerShell engine required by this module
PowerShellVersion = '7.5.1'

# Name of the PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
ClrVersion = '9.0.4'

# Processor architecture (None, X86, Amd64) required by this module
ProcessorArchitecture = 'Amd64'

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @(@{ModuleName = 'GenXdev.Data'; ModuleVersion = '1.174.2025'; })

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'CurrentUserHasElevatedRights', 'Get-ActiveUser', 
               'Get-ChildProcesses', 'Get-CurrentFocusedProcess', 
               'Get-DesktopScalingFactor', 'Get-KnownFolderPath', 'Get-MonitorCount', 
               'Get-MpCmdRunPath', 'Get-PowershellMainWindow', 
               'Get-PowershellMainWindowProcess', 'Get-Window', 
               'Initialize-ScheduledTaskScripts', 'Pop-Window', 'Push-Window', 
               'Send-Key', 'Set-ForegroundWindow', 'Set-KnownFolderPath', 
               'Set-TaskbarAlignment', 'Set-WindowPosition', 
               'Set-WindowPositionForSecondary', 'Start-ProcessWithPriority', 
               'Test-PathUsingWindowsDefender'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = 'folder', 'gusers', 'gwin', 'HasNoVirus', 'invokekeys', 'nice', 'popw', 'pushw', 
               'sendkeys', 'Set-TaskAlign', 'virusscan', 'window', 'wp', 'wps'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
ModuleList = @('GenXdev.Windows')

# List of all files packaged with this module
FileList = 'GenXdev.Windows.psd1', 'GenXdev.Windows.psm1', 'LICENSE', 
               'license.txt', 'powershell.jpg', 'README.md', 
               'Tests\GenXdev.Windows\CurrentUserHasElevatedRights.Tests.ps1', 
               'Tests\GenXdev.Windows\Get-ActiveUser.Tests.ps1', 
               'Tests\GenXdev.Windows\Get-ChildProcesses.Tests.ps1', 
               'Tests\GenXdev.Windows\Get-CurrentFocusedProcess.Tests.ps1', 
               'Tests\GenXdev.Windows\Get-DesktopScalingFactor.Tests.ps1', 
               'Tests\GenXdev.Windows\Get-KnownFolderPath.Tests.ps1', 
               'Tests\GenXdev.Windows\Get-MonitorCount.Tests.ps1', 
               'Tests\GenXdev.Windows\Get-MpCmdRunPath.Tests.ps1', 
               'Tests\GenXdev.Windows\Get-PowershellMainWindow.Tests.ps1', 
               'Tests\GenXdev.Windows\Get-PowershellMainWindowProcess.Tests.ps1', 
               'Tests\GenXdev.Windows\Get-Window.Tests.ps1', 
               'Tests\GenXdev.Windows\Initialize-ScheduledTaskScripts.Tests.ps1', 
               'Tests\GenXdev.Windows\Pop-Window.Tests.ps1', 
               'Tests\GenXdev.Windows\Push-Window.Tests.ps1', 
               'Tests\GenXdev.Windows\Send-Key.Tests.ps1', 
               'Tests\GenXdev.Windows\Set-ForegroundWindow.Tests.ps1', 
               'Tests\GenXdev.Windows\Set-KnownFolderPath.Tests.ps1', 
               'Tests\GenXdev.Windows\Set-TaskbarAlignment.Tests.ps1', 
               'Tests\GenXdev.Windows\Set-WindowPosition.Tests.ps1', 
               'Tests\GenXdev.Windows\Set-WindowPositionForSecondary.Tests.ps1', 
               'Tests\GenXdev.Windows\Start-ProcessWithPriority.Tests.ps1', 
               'Tests\GenXdev.Windows\Test-PathUsingWindowsDefender.Tests.ps1', 
               'Functions\GenXdev.Windows\CurrentUserHasElevatedRights.ps1', 
               'Functions\GenXdev.Windows\Get-ActiveUser.ps1', 
               'Functions\GenXdev.Windows\Get-ChildProcesses.ps1', 
               'Functions\GenXdev.Windows\Get-CurrentFocusedProcess.ps1', 
               'Functions\GenXdev.Windows\Get-DesktopScalingFactor.ps1', 
               'Functions\GenXdev.Windows\Get-KnownFolderPath.ps1', 
               'Functions\GenXdev.Windows\Get-MonitorCount.ps1', 
               'Functions\GenXdev.Windows\Get-MpCmdRunPath.ps1', 
               'Functions\GenXdev.Windows\Get-PowershellMainWindow.ps1', 
               'Functions\GenXdev.Windows\Get-PowershellMainWindowProcess.ps1', 
               'Functions\GenXdev.Windows\Get-Window.ps1', 
               'Functions\GenXdev.Windows\Initialize-ScheduledTaskScripts.ps1', 
               'Functions\GenXdev.Windows\Pop-Window.ps1', 
               'Functions\GenXdev.Windows\Push-Window.ps1', 
               'Functions\GenXdev.Windows\Send-Key.ps1', 
               'Functions\GenXdev.Windows\Set-ForegroundWindow.ps1', 
               'Functions\GenXdev.Windows\Set-KnownFolderPath.ps1', 
               'Functions\GenXdev.Windows\Set-TaskbarAlignment.ps1', 
               'Functions\GenXdev.Windows\Set-WindowPosition.ps1', 
               'Functions\GenXdev.Windows\Set-WindowPositionForSecondary.ps1', 
               'Functions\GenXdev.Windows\Start-ProcessWithPriority.ps1', 
               'Functions\GenXdev.Windows\Test-PathUsingWindowsDefender.ps1'

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'Console','Shell','GenXdev'

        # A URL to the license for this module.
        LicenseUri = 'https://raw.githubusercontent.com/genXdev/GenXdev.Windows/main/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://powershell.genxdev.net/#GenXdev.Windows'

        # A URL to an icon representing this module.
        IconUri = 'https://genxdev.net/favicon.ico'

        # ReleaseNotes of this module
        # ReleaseNotes = ''

        # Prerelease string of this module
        # Prerelease = ''

        # Flag to indicate whether the module requires explicit user acceptance for install/update/save
        # RequireLicenseAcceptance = $false

        # External dependent modules of this module
        # ExternalModuleDependencies = @()

    } # End of PSData hashtable

 } # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

