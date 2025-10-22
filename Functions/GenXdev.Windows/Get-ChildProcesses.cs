// ################################################################################
// Part of PowerShell module : GenXdev.Windows
// Original cmdlet filename  : Get-ChildProcesses.cs
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
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Management;
using System.Management.Automation;

namespace GenXdev.Windows
{
    /// <summary>
    /// <para type="synopsis">
    /// Retrieves all processes that are descendants of the current PowerShell process.
    /// </para>
    ///
    /// <para type="description">
    /// Examines all running processes and identifies those that have the current
    /// PowerShell process as an ancestor in their parent process chain. This includes
    /// both direct child processes and their descendants (grandchildren, etc.).
    /// </para>
    ///
    /// <example>
    /// <para>Get all child processes of the current PowerShell session</para>
    /// <para>Demonstrates basic usage of the cmdlet to retrieve child processes.</para>
    /// <code>
    /// Get-ChildProcesses
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get child processes and display verbose output</para>
    /// <para>Shows how to use the cmdlet with verbose output to see detailed information about the process detection.</para>
    /// <code>
    /// Get-ChildProcesses -Verbose
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "ChildProcesses")]
    [OutputType(typeof(Process))]
    public class GetChildProcessesCommand : PSGenXdevCmdlet
    {
        private int currentProcessId;
        private Dictionary<int, int> parentMap;

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            // log start of process detection
            WriteVerbose("Starting child process detection...");

            // store current powershell process id for parent chain comparison
            currentProcessId = Process.GetCurrentProcess().Id;
            WriteVerbose($"Current process ID: {currentProcessId}");

            // build parent process map for efficient lookups
            parentMap = new Dictionary<int, int>();
            ManagementObjectSearcher searcher = new ManagementObjectSearcher("SELECT ProcessId, ParentProcessId FROM Win32_Process");
            foreach (ManagementObject obj in searcher.Get())
            {
                int pid = Convert.ToInt32(obj["ProcessId"]);
                int parentId = Convert.ToInt32(obj["ParentProcessId"]);
                parentMap[pid] = parentId;
            }
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // get all processes currently running on the system
            Process[] allProcesses = Process.GetProcesses();
            WriteVerbose($"Retrieved {allProcesses.Length} total processes");

            // filter processes by checking if current process is in their parent chain
            foreach (Process process in allProcesses)
            {
                if (IsDescendant(process.Id, currentProcessId))
                {
                    WriteVerbose($"Found child process: {process.ProcessName} ID: {process.Id}");
                    WriteObject(process);
                }
            }
        }

        /// <summary>
        /// End processing - cleanup logic
        /// </summary>
        protected override void EndProcessing()
        {
            WriteVerbose("Completed child process detection");
        }

        /// <summary>
        /// Check if a process is a descendant of the specified ancestor by traversing the parent chain
        /// </summary>
        /// <param name="processId">The process ID to check</param>
        /// <param name="ancestorId">The ancestor process ID to look for</param>
        /// <returns>True if the process is a descendant, false otherwise</returns>
        private bool IsDescendant(int processId, int ancestorId)
        {
            // traverse up the parent chain until we find our process or hit top
            while (processId != 0 && parentMap.ContainsKey(processId))
            {
                if (processId == ancestorId)
                {
                    return true;
                }
                processId = parentMap[processId];
            }
            return false;
        }
    }
}