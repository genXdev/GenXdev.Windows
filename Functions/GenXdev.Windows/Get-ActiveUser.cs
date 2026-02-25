// ################################################################################
// Part of PowerShell module : GenXdev.Windows
// Original cmdlet filename  : Get-ActiveUser.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 3.3.2026
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
    /// Retrieves a list of unique usernames from currently active system processes.
    /// </para>
    ///
    /// <para type="description">
    /// Queries all running processes on the system, extracts the associated username for
    /// each process, and returns a deduplicated list of users who have active processes.
    /// This is useful for system administration and security monitoring.
    /// </para>
    ///
    /// <example>
    /// <para>Get-ActiveUser</para>
    /// <para>Returns a list of all unique usernames with active processes.</para>
    /// <code>
    /// Get-ActiveUser
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>gusers</para>
    /// <para>Uses the alias to get the same results.</para>
    /// <code>
    /// gusers
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "ActiveUser")]
    [Alias("gusers")]
    [OutputType(typeof(string))]
    public class GetActiveUserCommand : PSGenXdevCmdlet
    {
        private HashSet<string> users;

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            // store original error preferences for restoration
            // Note: In C#, we handle errors directly, but maintain verbose output

            // inform about the start of process enumeration
            WriteVerbose("Starting to enumerate all system processes...");

            users = new HashSet<string>();
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            try
            {
                // get all processes
                Process[] processes = Process.GetProcesses();

                // extract and deduplicate usernames from process list
                foreach (Process process in processes)
                {
                    try
                    {
                        // Use WMI to get process owner
                        using (ManagementObjectSearcher searcher = new ManagementObjectSearcher(
                            $"SELECT * FROM Win32_Process WHERE ProcessId = {process.Id}"))
                        {
                            foreach (ManagementObject obj in searcher.Get())
                            {
                                // Invoke GetOwner method
                                ManagementBaseObject owner = obj.InvokeMethod("GetOwner", null, null) as ManagementBaseObject;
                                if (owner != null)
                                {
                                    string domain = owner["Domain"] as string;
                                    string user = owner["User"] as string;
                                    if (!string.IsNullOrEmpty(user))
                                    {
                                        string fullUser = string.IsNullOrEmpty(domain) ? user : $"{domain}\\{user}";
                                        users.Add(fullUser);
                                    }
                                }
                                break; // Only need first result
                            }
                        }
                    }
                    catch (ManagementException ex) when (ex.ErrorCode == ManagementStatus.AccessDenied)
                    {
                        // Skip processes we can't access, similar to PowerShell behavior
                        continue;
                    }
                    catch
                    {
                        // Skip other errors for individual processes
                        continue;
                    }
                }
            }
            catch (UnauthorizedAccessException)
            {
                WriteError(new ErrorRecord(
                    new UnauthorizedAccessException("Access denied while retrieving processes. Run with elevated privileges."),
                    "ActiveUserAccessDenied",
                    ErrorCategory.PermissionDenied,
                    null));
                throw;
            }
            catch (ArgumentException ex)
            {
                WriteError(new ErrorRecord(
                    ex,
                    "ActiveUserInvalidArgument",
                    ErrorCategory.InvalidArgument,
                    null));
                throw;
            }
            catch (Exception ex)
            {
                WriteError(new ErrorRecord(
                    ex,
                    "ActiveUserUnexpectedError",
                    ErrorCategory.OperationStopped,
                    null));
                throw;
            }
        }

        /// <summary>
        /// End processing - cleanup logic
        /// </summary>
        protected override void EndProcessing()
        {
            // output the filtered list
            foreach (string user in users)
            {
                WriteObject(user);
            }

            // output completion status if users were found
            if (users.Count > 0)
            {
                WriteVerbose($"Process completed. Found {users.Count} unique active users.");
            }
            else
            {
                WriteVerbose("Process completed. No active users found or an error occurred.");
            }
        }
    }
}