// ################################################################################
// Part of PowerShell module : GenXdev.Windows
// Original cmdlet filename  : Set-TaskbarAlignment.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 1.304.2025
// ################################################################################
// Copyright (c)  René Vaessen / GenXdev
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ################################################################################



using System.Management.Automation;

namespace GenXdev.Windows
{
    /// <summary>
    /// <para type="synopsis">
    /// Configures Windows 11+ taskbar alignment between center and left positions.
    /// </para>
    ///
    /// <para type="description">
    /// Sets the taskbar alignment in Windows 11 and newer versions by modifying the
    /// registry key 'TaskbarAl' under HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\
    /// Explorer\Advanced. The alignment can be set to either center (value 1) or left
    /// (value 0).
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -Justify &lt;String&gt;<br/>
    /// Specifies the desired taskbar alignment: 'Center' or 'Left'. This setting is<br/>
    /// converted to the appropriate registry value (1 for Center, 0 for Left).<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Sets the Windows 11 taskbar to left alignment</para>
    /// <para></para>
    /// <code>
    /// Set-TaskbarAlignment -Justify Left
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Shows what would happen if taskbar was set to center alignment</para>
    /// <para></para>
    /// <code>
    /// Set-TaskbarAlignment -Justify Center -WhatIf
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Set, "TaskbarAlignment")]
    [OutputType(typeof(void))]
    public class SetTaskbarAlignmentCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// Specifies the desired taskbar alignment: 'Center' or 'Left'. This setting is
        /// converted to the appropriate registry value (1 for Center, 0 for Left).
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            HelpMessage = "The taskbar alignment (Center or Left)"
        )]
        [ValidateSet("Center", "Left")]
        public string Justify { get; set; }

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            // Store the registry path for taskbar settings
            // Log the requested alignment change for troubleshooting
            WriteVerbose($"Setting taskbar alignment to: {Justify}");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Convert the alignment choice to its corresponding registry value
            int value = Justify == "Left" ? 0 : 1;

            // Check if we should proceed with the registry modification
            if (ShouldProcess(
                "Windows Taskbar Alignment",
                $"Set alignment to {Justify}"
            ))
            {
                // Update the registry key using PowerShell cmdlet for compatibility
                string script = $"Set-ItemProperty -Path 'HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced' -Name 'TaskbarAl' -Value {value}";
                InvokeCommand.InvokeScript(script);

                WriteVerbose($"Registry value 'TaskbarAl' set to: {value}");
            }
        }

        /// <summary>
        /// End processing - cleanup logic
        /// </summary>
        protected override void EndProcessing()
        {
        }
    }
}