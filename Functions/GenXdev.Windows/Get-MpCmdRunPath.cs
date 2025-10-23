// ################################################################################
// Part of PowerShell module : GenXdev.Windows
// Original cmdlet filename  : Get-MpCmdRunPath.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 2.1.2025
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



using System.IO;
using System.Management.Automation;

namespace GenXdev.Windows
{
    /// <summary>
    /// <para type="synopsis">
    /// Gets the path to the Windows Defender MpCmdRun.exe executable.
    /// </para>
    ///
    /// <para type="description">
    /// Locates and returns the full path to the Windows Defender command-line utility
    /// (MpCmdRun.exe). The cmdlet checks the standard installation location in
    /// Program Files and provides appropriate error handling if the file is not found.
    /// </para>
    ///
    /// <para type="description">
    /// OUTPUTS
    /// </para>
    ///
    /// <para type="description">
    /// System.String<br/>
    /// Returns the full path to MpCmdRun.exe if found.
    /// </para>
    ///
    /// <example>
    /// <para>Get the path to Windows Defender MpCmdRun.exe</para>
    /// <para>This example retrieves the full path to the Windows Defender command-line tool.</para>
    /// <code>
    /// $defenderPath = Get-MpCmdRunPath
    /// </code>
    /// <para>This returns a path similar to: "${env:ProgramFiles}\Windows Defender\MpCmdRun.exe"</para>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "MpCmdRunPath")]
    [OutputType(typeof(string))]
    public class GetMpCmdRunPathCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// Begin processing - construct the expected path for the Windows Defender command-line tool
        /// </summary>
        protected override void BeginProcessing()
        {
            // Construct the expected path for the Windows Defender command-line tool
            string mpCmdRunPath = Path.Combine(
                System.Environment.GetEnvironmentVariable("ProgramFiles"),
                "Windows Defender",
                "MpCmdRun.exe");

            // Log the path we're checking
            WriteVerbose($"Attempting to locate MpCmdRun.exe at: {mpCmdRunPath}");

            // Store the path for use in ProcessRecord
            this.mpCmdRunPath = mpCmdRunPath;
        }

        /// <summary>
        /// Process record - verify file existence and return path or error
        /// </summary>
        protected override void ProcessRecord()
        {
            // Verify file existence using optimized IO.File method
            if (File.Exists(this.mpCmdRunPath))
            {
                WriteVerbose("Successfully located MpCmdRun.exe");

                WriteObject(this.mpCmdRunPath);
            }
            else
            {
                // If executable not found, throw descriptive error
                string errorMsg = $"Windows Defender executable not found at: {this.mpCmdRunPath}";

                ErrorRecord errorRecord = new ErrorRecord(
                    new FileNotFoundException(errorMsg),
                    "MpCmdRunNotFound",
                    ErrorCategory.ObjectNotFound,
                    this.mpCmdRunPath);

                WriteError(errorRecord);
            }
        }

        /// <summary>
        /// End processing - no cleanup needed
        /// </summary>
        protected override void EndProcessing()
        {
        }

        /// <summary>
        /// Private field to store the constructed path
        /// </summary>
        private string mpCmdRunPath;
    }
}