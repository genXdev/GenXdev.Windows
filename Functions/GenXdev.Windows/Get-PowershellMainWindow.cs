// ################################################################################
// Part of PowerShell module : GenXdev.Windows
// Original cmdlet filename  : Get-PowershellMainWindow.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 1.308.2025
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



using System;
using System.Linq;
using System.Management.Automation;

namespace GenXdev.Windows
{
    /// <summary>
    /// <para type="synopsis">
    /// Returns a window helper object for the PowerShell terminal's main window.
    /// </para>
    ///
    /// <para type="description">
    /// Retrieves a WindowObj helper object that represents the main window of the current
    /// PowerShell host process. This allows manipulation and interaction with the
    /// terminal window itself.
    /// </para>
    ///
    /// <para type="description">
    /// OUTPUTS
    /// </para>
    ///
    /// <para type="description">
    /// GenXdev.Helpers.WindowObj<br/>
    /// Represents the main window of the PowerShell host process with properties and
    /// methods for window manipulation.<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get the main window of the current PowerShell host</para>
    /// <para>This example retrieves the WindowObj for the current PowerShell terminal window.</para>
    /// <code>
    /// Get-PowershellMainWindow
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "PowershellMainWindow")]
    [OutputType(typeof(GenXdev.Helpers.WindowObj))]
    public class GetPowershellMainWindowCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            WriteVerbose("Starting to locate PowerShell main window...");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            WriteVerbose("Retrieving PowerShell host process...");

            var processResult = InvokeCommand.InvokeScript("GenXdev.Windows\\Get-PowershellMainWindowProcess");

            var process = processResult.Count > 0 ? processResult[0] : null;

            if (process == null || ((dynamic)process).MainWindowHandle == IntPtr.Zero)
            {
                WriteError(new ErrorRecord(
                    new Exception("Failed to retrieve a valid PowerShell process with a main window"),
                    "ProcessNotFound",
                    ErrorCategory.ObjectNotFound,
                    null));

                processResult = InvokeCommand.InvokeScript($"Microsoft.PowerShell.Management\\Get-Process -Id {System.Diagnostics.Process.GetCurrentProcess().Id}");

                process = processResult.Count > 0 ? processResult[0] : null;
            }

            WriteVerbose($"Found PowerShell host process with ID: {((dynamic)process).Id} ({((dynamic)process).ProcessName})");

            WriteVerbose("Attempting to get main window handle...");

            var realProcess = process?.BaseObject as System.Diagnostics.Process;
            GenXdev.Helpers.WindowObj mainWindow = null;

            if (realProcess != null)
            {
                var mainWindows = GenXdev.Helpers.WindowObj.GetMainWindow(realProcess);
                mainWindow = mainWindows.FirstOrDefault();
            }

            if (mainWindow == null)
            {
                return;
            }

            WriteVerbose($"Successfully retrieved main window handle: {((dynamic)mainWindow).Handle}\r\nTitle: {((dynamic)mainWindow).Title}");

            WriteObject(mainWindow);
        }

        /// <summary>
        /// End processing - cleanup logic
        /// </summary>
        protected override void EndProcessing()
        {
        }
    }
}