// ################################################################################
// Part of PowerShell module : GenXdev.Windows
// Original cmdlet filename  : Get-OpenedFileHandleProcesses.cs
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



using System.Management.Automation;
using System.Text.RegularExpressions;

namespace GenXdev.Windows
{
    /// <summary>
    /// <para type="synopsis">
    /// Retrieves processes that have open file handles to specified files.
    /// </para>
    ///
    /// <para type="description">
    /// Uses the Sysinternals handle.exe tool to identify processes that currently have
    /// open handles to one or more specified files. This is useful for determining
    /// which processes are preventing file operations like deletion or modification.
    ///
    /// The function requires handle.exe from the Sysinternals suite to be installed
    /// and available in the system path. It parses the output from handle.exe to
    /// identify processes with open handles to the specified files and returns
    /// detailed information about those processes.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -FilePath &lt;String[]&gt;<br/>
    /// The path to the file(s) to check for open handles. Supports pipeline input.
    /// Multiple file paths can be provided to check multiple files at once.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// - <b>ValueFromPipeline</b>: true<br/>
    /// - <b>ValueFromPipelineByPropertyName</b>: true<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get-OpenedFileHandleProcesses -FilePath "C:\temp\example.txt"</para>
    /// <para>Identifies all processes that have open handles to the specified file</para>
    /// <code>
    /// Get-OpenedFileHandleProcesses -FilePath "C:\temp\example.txt"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>"file1.txt", "file2.txt" | Get-OpenedFileHandleProcesses</para>
    /// <para>Checks multiple files via pipeline input for processes with open handles</para>
    /// <code>
    /// "file1.txt", "file2.txt" | Get-OpenedFileHandleProcesses
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "OpenedFileHandleProcesses")]
    [OutputType(typeof(FileHandleProcessInfo))]
    public class GetOpenedFileHandleProcessesCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The path to the file(s) to check for open handles
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true,
            HelpMessage = "The path to the file(s) to check for open handles"
        )]
        [ValidateNotNullOrEmpty]
        public string[] FilePath { get; set; }

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            // log start of process detection for user visibility
            WriteVerbose("Starting file handle process detection...");

            // ensure handle.exe from sysinternals is available before proceeding
            InvokeCommand.InvokeScript("GenXdev.Windows\\EnsurePSTools -PSExeName 'handle.exe'");

            // log the path to handle.exe to help with troubleshooting
            WriteVerbose("Using handle.exe at: handle.exe");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // process each file path provided by the user
            foreach (string file in FilePath)
            {
                // log which file we are currently checking
                WriteVerbose($"Checking file handles for: {file}");

                try
                {
                    // execute handle.exe to get file handle information
                    // -accepteula: automatically accept the eula
                    // -a: show all information about file handles
                    // -u: show paths in unicode format
                    var handleScript = ScriptBlock.Create(@"
                        param($file)
                        $handleOutput = & handle.exe -accepteula -a -u $file 2>$null
                        [PSCustomObject]@{ Output = $handleOutput; ExitCode = $LASTEXITCODE }
                    ");
                    var handleResult = handleScript.Invoke(file);
                    var handleObj = (PSObject)handleResult[0].BaseObject;
                    var handleOutput = (string[])handleObj.Properties["Output"].Value;
                    var exitCode = (int)handleObj.Properties["ExitCode"].Value;

                    // check if handle.exe executed successfully
                    if (exitCode != 0)
                    {
                        WriteWarning(
                            $"Handle.exe returned exit code {exitCode} " +
                            $"for file: {file}"
                        );
                        continue;
                    }

                    // parse output to find processes with file handles
                    // first filter for lines containing "pid:" which indicate a process handle
                    var processes = new List<FileHandleProcessInfo>();
                    foreach (string line in handleOutput)
                    {
                        if (line.Contains("pid:"))
                        {
                            // match the pattern for pid and ensure it's the correct file
                            var regex = new Regex(
                                $"pid:\\s*(\\d+)\\s+type:\\s*File\\s+.*{Regex.Escape(file)}",
                                RegexOptions.IgnoreCase
                            );
                            var match = regex.Match(line);
                            if (match.Success)
                            {
                                // extract the process id from the regex match
                                int processId = int.Parse(match.Groups[1].Value);
                                WriteVerbose(
                                    $"Found process with PID {processId} accessing file: {file}"
                                );

                                try
                                {
                                    // get detailed information about the process
                                    var getProcessScript = ScriptBlock.Create(
                                        "param($id) Get-Process -Id $id -ErrorAction Stop"
                                    );
                                    var processResult = getProcessScript.Invoke(processId);
                                    var process = (PSObject)processResult[0].BaseObject;
                                    string processName = process.Properties["ProcessName"].Value.ToString();
                                    string processPath = process.Properties["Path"]?.Value?.ToString();

                                    // create and return a custom object with process details
                                    processes.Add(new FileHandleProcessInfo
                                    {
                                        ProcessName = processName,
                                        PID = processId,
                                        FilePath = file,
                                        ProcessPath = processPath
                                    });
                                }
                                catch
                                {
                                    // handle case where process info can't be retrieved
                                    WriteWarning(
                                        $"Could not retrieve process details for PID {processId}"
                                    );

                                    // return object with available information
                                    processes.Add(new FileHandleProcessInfo
                                    {
                                        ProcessName = "Unknown",
                                        PID = processId,
                                        FilePath = file,
                                        ProcessPath = null
                                    });
                                }
                            }
                        }
                    }

                    // return the results or log that none were found
                    if (processes.Count > 0)
                    {
                        WriteVerbose(
                            $"Found {processes.Count} process(es) with handles to: {file}"
                        );
                        foreach (var process in processes)
                        {
                            WriteObject(process);
                        }
                    }
                    else
                    {
                        WriteVerbose($"No processes found with handles to: {file}");
                    }
                }
                catch (Exception ex)
                {
                    // handle any errors that occur during processing
                    WriteError(new ErrorRecord(
                        ex,
                        "HandleExecutionError",
                        ErrorCategory.OperationStopped,
                        file
                    ));
                }
            }
        }

        /// <summary>
        /// End processing - cleanup logic
        /// </summary>
        protected override void EndProcessing()
        {
            // log completion of the function
            WriteVerbose("Completed file handle process detection");
        }
    }

    /// <summary>
    /// Represents information about a process that has an open file handle
    /// </summary>
    public class FileHandleProcessInfo
    {
        /// <summary>
        /// The name of the process
        /// </summary>
        public string ProcessName { get; set; }

        /// <summary>
        /// The process ID
        /// </summary>
        public int PID { get; set; }

        /// <summary>
        /// The file path being accessed
        /// </summary>
        public string FilePath { get; set; }

        /// <summary>
        /// The full path to the process executable
        /// </summary>
        public string ProcessPath { get; set; }
    }
}