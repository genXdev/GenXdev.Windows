#
# Module manifest for module 'GenXdev.Windows'
@{

  # Script module or binary module file associated with this manifest.
  RootModule           = 'GenXdev.Windows.psm1'

  # Version number of this module.
  ModuleVersion        = '1.98.2025'
  # Supported PSEditions
  # CompatiblePSEditions = @()

  # ID used to uniquely identify this module
  GUID                 = '2f62080f-0483-4421-8437-c3d433b65175'

  # Author of this module
  Author               = 'René Vaessen'

  # Company or vendor of this module
  CompanyName          = 'GenXdev'

  # Copyright statement for this module
  Copyright            = 'Copyright 2021-2025 GenXdev'

  # Description of the functionality provided by this module
  Description          = 'A Windows PowerShell module that provides ui Windows manipulation helpers'

  # Minimum version of the PowerShell engine required by this module
  PowerShellVersion    = '7.5.0'

  # # Intended for PowerShell Core
  CompatiblePSEditions = 'Core'

  # # Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
  ClrVersion           = '9.0.1'

  # Processor architecture (None, X86, Amd64) required by this module
  # ProcessorArchitecture = ''

  # Modules that must be imported into the global environment prior to importing this module
  RequiredModules      = @(@{ModuleName = 'GenXdev.Data'; ModuleVersion = '1.98.2025' }, @{ModuleName = 'GenXdev.Helpers'; ModuleVersion = '1.98.2025' }, @{ModuleName = 'GenXdev.FileSystem'; ModuleVersion = '1.98.2025' });

  # Assemblies that must be loaded prior to importing this module
  RequiredAssemblies   = @()

  # Script files (.ps1) that are run in the caller's environment prior to importing this module.
  # ScriptsToProcess = @()

  # Type files (.ps1xml) to be loaded when importing this module
  # TypesToProcess = @()

  # Format files (.ps1xml) to be loaded when importing this module
  # FormatsToProcess = @()

  # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
  # NestedModules = @()

  # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
  FunctionsToExport    = '*' # @("*")

  # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no Cmdlets to export.
  CmdletsToExport      = '*' # = @("*")

  # Variables to export from this module
  VariablesToExport    = '*'

  # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
  AliasesToExport      = '*'

  # DSC resources to export from this module
  # DscResourcesToExport = @()

  # List of all modules packaged with this module
  ModuleList           = @("GenXdev.Windows")

  # List of all files packaged with this module
  FileList             = @(


  ".\\Functions\\GenXdev.Windows\\Copy-SetWindowPositionParameters.ps1",
  ".\\Functions\\GenXdev.Windows\\CurrentUserHasElivatedRights.ps1",
  ".\\Functions\\GenXdev.Windows\\Get-ActiveUsers.ps1",
  ".\\Functions\\GenXdev.Windows\\Get-ChildProcesses.ps1",
  ".\\Functions\\GenXdev.Windows\\Get-CurrentFocusedProcess.ps1",
  ".\\Functions\\GenXdev.Windows\\Get-DesktopScalingFactor.ps1",
  ".\\Functions\\GenXdev.Windows\\Get-KnownFolderPath.ps1",
  ".\\Functions\\GenXdev.Windows\\Get-MonitorCount.ps1",
  ".\\Functions\\GenXdev.Windows\\Get-MpCmdRunPath.ps1",
  ".\\Functions\\GenXdev.Windows\\Get-PowershellMainWindow.ps1",
  ".\\Functions\\GenXdev.Windows\\Get-PowershellMainWindowProcess.ps1",
  ".\\Functions\\GenXdev.Windows\\Get-Window.ps1",
  ".\\Functions\\GenXdev.Windows\\Initialize-ScheduledTaskScripts.ps1",
  ".\\Functions\\GenXdev.Windows\\Send-Keys.ps1",
  ".\\Functions\\GenXdev.Windows\\Set-ForegroundWindow.ps1",
  ".\\Functions\\GenXdev.Windows\\Set-KnownFolderPath.ps1",
  ".\\Functions\\GenXdev.Windows\\Set-TaskbarAlignment.ps1",
  ".\\Functions\\GenXdev.Windows\\Set-WindowPosition.ps1",
  ".\\Functions\\GenXdev.Windows\\Set-WindowPositionForSecondary.ps1",
  ".\\Functions\\GenXdev.Windows\\Start-ProcessWithPriority.ps1",
  ".\\Functions\\GenXdev.Windows\\Test-PathUsingWindowsDefender.ps1",
  ".\\Tests\\TestResults.xml",
  ".\\GenXdev.Windows.psd1",
  ".\\GenXdev.Windows.psm1",
  ".\\LICENSE",
  ".\\license.txt",
  ".\\powershell.jpg",
  ".\\README.md"


)

  # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
  PrivateData          = @{

    PSData = @{

      # Tags applied to this module. These help with module discovery in online galleries.
      Tags                     = 'Console', 'Shell', 'GenXdev'

      # A URL to the license for this module.
      LicenseUri               = 'https://raw.githubusercontent.com/genXdev/GenXdev.Windows/main/LICENSE'

      # A URL to the main website for this project.
      ProjectUri               = 'https://github.com/genXdev/GenXdev.Windows'

      # A URL to an icon representing this module.
      IconUri                  = 'https://genxdev.net/favicon.ico'

      # ReleaseNotes of this module
      # ReleaseNotes = ''

      # Prerelease string of this module
      # Prerelease = ''

      # Flag to indicate whether the module requires explicit user acceptance for install/update/save
      RequireLicenseAcceptance = $true

      # External dependent modules of this module
      # ExternalModuleDependencies = @()

    } # End of PSData hashtable

  } # End of PrivateData hashtable

  # HelpInfo URI of this module
  # HelpInfoUri          = 'https://github.com/genXdev/GenXdev.Windows/blob/main/README.md#cmdlet-index'

  # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
  # DefaultCommandPrefix = ''
}

# PrivateData = @{
#     PSData = @{

#       # ...

#       # !! This field is *ancillary* to the more detailed 'RequiredModules' field and
#       # !! must reference the *same modules*, but by *names only*,
#       # !! in order to automatically install other modules
#       # !! *from the same repository* that this module depends on.
#       # !! To be safe, specify even a *single* name as an *array*
#       # !! (While this is not a general requirement in manifests,
#       # !!  it may be necessary here due to a bug.)
#       ExternalModuleDependencies = @('GenXdev.Helpers')
#   }
# }
