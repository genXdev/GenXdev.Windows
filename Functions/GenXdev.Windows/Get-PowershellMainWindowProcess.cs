// ################################################################################
// Part of PowerShell module : GenXdev.Windows
// Original cmdlet filename  : Get-PowershellMainWindowProcess.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 2.3.2026
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



using System.Diagnostics;
using System.Management;
using System.Management.Automation;

namespace GenXdev.Windows
{
    /// <summary>
    /// <para type="synopsis">
    /// Returns the process object for the window hosting the PowerShell terminal.
    /// </para>
    ///
    /// <para type="description">
    /// Traverses up the process tree starting from the current PowerShell process to
    /// locate the parent window responsible for hosting the terminal. If the immediate
    /// parent process doesn't have a main window handle, it searches for similar
    /// processes that do have main windows. This is useful for identifying the actual
    /// terminal window process (like Windows Terminal, ConHost, etc.) that contains
    /// the PowerShell session.
    /// </para>
    ///
    /// <example>
    /// <para>$hostProcess = Get-PowershellMainWindowProcess</para>
    /// <para>Write-Host "PowerShell is hosted in: $($hostProcess.ProcessName)"</para>
    /// <para>Returns the process hosting the current PowerShell session and displays its name.</para>
    /// <code>
    /// $hostProcess = Get-PowershellMainWindowProcess
    /// Write-Host "PowerShell is hosted in: $($hostProcess.ProcessName)"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "PowershellMainWindowProcess")]
    [OutputType(typeof(System.Diagnostics.Process))]
    public class GetPowershellMainWindowProcessCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Get reference to the powershell process currently executing this code
            Process currentProcess = Process.GetCurrentProcess();

            // Initialize parent tracking, starting with current process
            Process parentProcess = GetParentProcess(currentProcess);

            // Log the starting point of our search
            WriteVerbose($"Starting process tree traversal from: {currentProcess.ProcessName}");

            // Traverse up process tree until we find a window or hit the root
            while ((parentProcess != null) && (parentProcess.MainWindowHandle == IntPtr.Zero) &&
                (GetParentProcess(parentProcess) != null))
            {
                parentProcess = GetParentProcess(parentProcess);
                WriteVerbose($"Examining parent process: {parentProcess.ProcessName}");
            }

            // If parent has a main window, use that process
            if ((parentProcess != null) && (parentProcess.MainWindowHandle != IntPtr.Zero))
            {
                WriteVerbose($"Found parent with main window: {parentProcess.ProcessName}");
                WriteObject(parentProcess);
            }
            else
            {
                WriteObject(currentProcess);
            }
        }

        /// <summary>
        /// End processing - cleanup logic
        /// </summary>
        protected override void EndProcessing()
        {
        }

        /// <summary>
        /// Gets the parent process of the specified process using WMI
        /// </summary>
        /// <param name="process">The process to find the parent of</param>
        /// <returns>The parent process, or null if not found</returns>
        private Process GetParentProcess(Process process)
        {
            try
            {
                using (var searcher = new ManagementObjectSearcher(
                    $"SELECT ParentProcessId FROM Win32_Process WHERE ProcessId = {process.Id}"))
                {
                    foreach (ManagementObject obj in searcher.Get())
                    {
                        int parentId = (int)(uint)obj["ParentProcessId"];
                        return Process.GetProcessById(parentId);
                    }
                }
            }
            catch
            {
                // Ignore exceptions to maintain compatibility
            }
            return null;
        }
    }
}