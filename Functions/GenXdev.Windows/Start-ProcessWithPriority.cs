// ################################################################################
// Part of PowerShell module : GenXdev.Windows
// Original cmdlet filename  : Start-ProcessWithPriority.cs
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



using System.Diagnostics;
using System.Management.Automation;

namespace GenXdev.Windows
{
    /// <summary>
    /// <para type="synopsis">
    /// Starts a process with a specified priority level.
    /// </para>
    ///
    /// <para type="description">
    /// Launches an executable with a customizable priority level and provides options for
    /// waiting and process handling. This cmdlet wraps Start-Process with additional
    /// functionality to control process priority and execution behavior.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -FilePath &lt;string&gt;<br/>
    /// The path to the executable file to run. This parameter is mandatory and must
    /// contain a valid path to an executable file.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Default</b>: None<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -ArgumentList &lt;string[]&gt;<br/>
    /// Arguments to pass to the executable. Multiple arguments can be provided as an
    /// array of strings.<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>Default</b>: @()<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Priority &lt;string&gt;<br/>
    /// Sets the process priority level. Valid values are: Idle, BelowNormal, Low,
    /// Normal, AboveNormal, High, RealTime. Defaults to BelowNormal. Higher priorities
    /// may impact system performance.<br/>
    /// - <b>Position</b>: 2<br/>
    /// - <b>Default</b>: "BelowNormal"<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -NoWait &lt;SwitchParameter&gt;<br/>
    /// Switch to determine if the cmdlet should wait for process completion. When
    /// specified, the cmdlet returns immediately after starting the process.<br/>
    /// - <b>Default</b>: False<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -PassThru &lt;SwitchParameter&gt;<br/>
    /// Switch to return the process object after creation. Useful when you need to
    /// manipulate the process after it starts.<br/>
    /// - <b>Default</b>: False<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Start Notepad with low priority without waiting</para>
    /// <para>This example starts Notepad with low priority and returns immediately without waiting for it to close.</para>
    /// <code>
    /// Start-ProcessWithPriority -FilePath "notepad.exe" -Priority "Low" -NoWait
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Use the 'nice' alias to start Notepad with high priority</para>
    /// <para>This example demonstrates using the 'nice' alias to start a process with high priority.</para>
    /// <code>
    /// nice notepad.exe -Priority High
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsLifecycle.Start, "ProcessWithPriority")]
    [Alias("nice")]
    [OutputType(typeof(System.Diagnostics.Process))]
    public class StartProcessWithPriorityCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The path to the executable file to run
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            HelpMessage = "Path to the executable to run")]
        [ValidateNotNullOrEmpty]
        public string FilePath { get; set; }

        /// <summary>
        /// Arguments to pass to the executable
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 1,
            HelpMessage = "Arguments to pass to the executable")]
        public string[] ArgumentList { get; set; } = new string[0];

        /// <summary>
        /// Process priority level
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 2,
            HelpMessage = "Process priority level")]
        [ValidateSet(
            "Idle",
            "BelowNormal",
            "Low",
            "Normal",
            "AboveNormal",
            "High",
            "RealTime")]
        public string Priority { get; set; } = "BelowNormal";

        /// <summary>
        /// Don't wait for process completion
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Don't wait for process completion")]
        public SwitchParameter NoWait { get; set; }

        /// <summary>
        /// Return the process object
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Return the process object")]
        public SwitchParameter PassThru { get; set; }

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            // Log the start of process execution with priority level
            WriteVerbose($"Starting process '{FilePath}' with priority '{Priority}'");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Check if the user wants to proceed with starting the process
            string processDescription = $"Start process '{FilePath}' with priority '{Priority}'";
            if (!ShouldProcess(processDescription))
            {
                return;
            }

            // Launch the process with specified parameters and capture its handle
            var startProcessScript = ScriptBlock.Create("param($FilePath, $ArgumentList) Start-Process -FilePath $FilePath -ArgumentList $ArgumentList -PassThru -NoNewWindow");
            var result = startProcessScript.Invoke(FilePath, ArgumentList);
            var process = (Process)((PSObject)result[0]).BaseObject;

            // Ensure the process started successfully
            if (process == null)
            {
                WriteWarning($"Failed to start process '{FilePath}'");
                return;
            }

            // Apply the requested priority level to the running process
            process.PriorityClass = (ProcessPriorityClass)System.Enum.Parse(typeof(ProcessPriorityClass), Priority);
            WriteVerbose($"Process started with ID: {process.Id}");

            // Return early if immediate execution is requested
            if (NoWait.ToBool())
            {
                WriteVerbose("Not waiting for process completion");
                if (PassThru.ToBool())
                {
                    WriteObject(process);
                }
                return;
            }

            // Block execution until the process completes
            WriteVerbose("Waiting for process to complete");
            process.WaitForExit();

            // Return process information if requested
            if (PassThru.ToBool())
            {
                WriteVerbose("Returning process object");
                WriteObject(process);
            }
        }

        /// <summary>
        /// End processing - cleanup logic
        /// </summary>
        protected override void EndProcessing()
        {
            // No cleanup needed
        }
    }
}