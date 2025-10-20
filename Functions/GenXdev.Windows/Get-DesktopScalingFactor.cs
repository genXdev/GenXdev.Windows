// ################################################################################
// Part of PowerShell module : GenXdev.Windows
// Original cmdlet filename  : Get-DesktopScalingFactor.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 1.302.2025
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
    /// Retrieves the Windows display scaling factor (DPI setting) for a specified monitor.
    /// </para>
    ///
    /// <para type="description">
    /// Gets the current Windows display scaling factor configured for a monitor in the
    /// system. The scaling factor is expressed as a percentage where 100 represents
    /// standard scaling (96 DPI). Common values are 100, 125, 150, and 200.
    /// If no monitor is specified, returns the scaling factor for the primary display.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -Monitor &lt;int&gt;<br/>
    /// Specifies the zero-based index of the monitor to check. The primary monitor is
    /// index 0, secondary monitor is 1, and so on. Valid values range from 0 to 99.<br/>
    /// - <b>Aliases</b>: m, mon<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Default</b>: 0<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get-DesktopScalingFactor -Monitor 0</para>
    /// <para>Returns the scaling factor percentage for the primary monitor</para>
    /// <code>
    /// Get-DesktopScalingFactor -Monitor 0
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get-DesktopScalingFactor 1</para>
    /// <para>Returns the scaling factor percentage for the second monitor using positional parameter</para>
    /// <code>
    /// Get-DesktopScalingFactor 1
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "DesktopScalingFactor")]
    [OutputType(typeof(System.Single))]
    public class GetDesktopScalingFactorCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// Specifies the zero-based index of the monitor to check. The primary monitor is
        /// index 0, secondary monitor is 1, and so on. Valid values range from 0 to 99.
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = false,
            HelpMessage = "The monitor index to check (0 = primary monitor)")]
        [ValidateRange(0, 99)]
        [Alias("m", "mon")]
        public int Monitor { get; set; } = 0;

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            WriteVerbose("Getting scaling factor for monitor index: " + Monitor);
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // invoke the native method to retrieve the current scaling factor
            // uses the GenXdev.Helpers.DesktopInfo class's static method
            var result = GenXdev.Helpers.DesktopInfo.getScalingFactor(Monitor);

            WriteObject(result);
        }
    }
}