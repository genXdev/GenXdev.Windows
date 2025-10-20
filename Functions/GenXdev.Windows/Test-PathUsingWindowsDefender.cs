// ################################################################################
// Part of PowerShell module : GenXdev.Windows
// Original cmdlet filename  : Test-PathUsingWindowsDefender.cs
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



using System;
using System.Collections.Generic;
using System.IO;
using System.Management.Automation;

namespace GenXdev.Windows
{
    /// <summary>
    /// <para type="synopsis">
    /// Scans files or directories for malware using Windows Defender.
    /// </para>
    ///
    /// <para type="description">
    /// Performs a targeted scan of specified files or directories using Windows
    /// Defender's command-line interface (MpCmdRun.exe). The function can either scan
    /// in detection-only mode or with automatic threat remediation enabled. Returns
    /// true if no threats are detected, false if threats are found or scan fails.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -FilePath &lt;String&gt;<br/>
    /// The full or relative path to the file or directory to be scanned. The path will
    /// be expanded to its full form before scanning. Accepts pipeline input and
    /// supports both individual files and directories.<br/>
    /// - <b>Required</b>: true<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Default value</b>: None<br/>
    /// - <b>Accept pipeline input</b>: true (ByValue, ByPropertyName)<br/>
    /// - <b>Accept wildcard characters</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -EnableRemediation &lt;SwitchParameter&gt;<br/>
    /// When specified, allows Windows Defender to automatically remove or quarantine
    /// any detected threats. If omitted, the scan will only detect and report threats
    /// without taking any remediation action.<br/>
    /// - <b>Required</b>: false<br/>
    /// - <b>Position</b>: named<br/>
    /// - <b>Default value</b>: False<br/>
    /// - <b>Accept pipeline input</b>: false<br/>
    /// - <b>Accept wildcard characters</b>: false<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Test-PathUsingWindowsDefender -FilePath "C:\Downloads\file.exe" -Verbose</para>
    /// <para>Scans the specified file and displays verbose output.</para>
    /// <code>
    /// Test-PathUsingWindowsDefender -FilePath "C:\Downloads\file.exe" -Verbose
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>virusscan "C:\Downloads\file.exe" -EnableRemediation</para>
    /// <para>Scans the file using the alias and enables remediation.</para>
    /// <code>
    /// virusscan "C:\Downloads\file.exe" -EnableRemediation
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>"C:\Downloads\file.exe" | HasNoVirus</para>
    /// <para>Pipes the file path to the cmdlet using an alias.</para>
    /// <code>
    /// "C:\Downloads\file.exe" | HasNoVirus
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsDiagnostic.Test, "PathUsingWindowsDefender")]
    [Alias("virusscan", "HasNoVirus")]
    [OutputType(typeof(bool))]
    public class TestPathUsingWindowsDefenderCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The full or relative path to the file or directory to be scanned
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true,
            HelpMessage = "The path to the file or directory to be scanned")]
        [ValidateNotNullOrEmpty]
        public string FilePath { get; set; }

        /// <summary>
        /// Instructs Windows Defender to take action on threats
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Instructs Windows Defender to take action on threats")]
        public SwitchParameter EnableRemediation { get; set; }

        private string mpCmdRunPath;

        /// <summary>
        /// Begin processing - locate Windows Defender CLI
        /// </summary>
        protected override void BeginProcessing()
        {
            // Locate the windows defender command line utility
            var scriptBlock = ScriptBlock.Create("GenXdev.Windows\\Get-MpCmdRunPath");
            var results = InvokeCommand.InvokeScript(SessionState, scriptBlock);
            mpCmdRunPath = results[0]?.ToString();

            // Ensure the windows defender cli is available
            if (string.IsNullOrEmpty(mpCmdRunPath))
            {
                throw new InvalidOperationException("Windows Defender CLI (MpCmdRun.exe) not found");
            }
        }

        /// <summary>
        /// Process record - perform the scan
        /// </summary>
        protected override void ProcessRecord()
        {
            // Convert relative or shortened paths to full filesystem paths
            string expandedPath = ExpandPath(FilePath);

            // Verify the target exists before attempting to scan
            if (!File.Exists(expandedPath))
            {
                WriteError(new ErrorRecord(
                    new FileNotFoundException($"File or directory not found: {expandedPath}"),
                    "FileNotFound",
                    ErrorCategory.ObjectNotFound,
                    expandedPath));
                WriteObject(false);
                return;
            }

            // Log the initiation of the scan operation
            WriteVerbose($"Initiating Windows Defender scan of: {expandedPath}");

            // Construct the scan command parameters array
            var scanParamsList = new List<string>
            {
                "-Scan",
                "-ScanType",
                "3",
                "-File",
                $"\"{expandedPath}\""
            };

            // Add remediation flag based on user preference
            if (!EnableRemediation)
            {
                scanParamsList.Add("-DisableRemediation");
            }

            var scanParams = scanParamsList.ToArray();

            // Log the complete command being executed
            WriteVerbose($"Executing scan with parameters: {string.Join(" ", scanParams)}");

            // Execute the windows defender scan and capture output for verbose logging
            var scriptBlockScan = ScriptBlock.Create(@"
param($mpCmdRunPath, $scanParams)
& $mpCmdRunPath $scanParams | ForEach-Object { Write-Verbose $_ }
$LASTEXITCODE
");
            var scanResult = InvokeCommand.InvokeScript(SessionState, scriptBlockScan, mpCmdRunPath, scanParams);

            // Return scan result based on exit code: true = no threats, false = threats found
            WriteObject(scanResult[0]?.Equals(0) ?? false);
        }

        /// <summary>
        /// End processing - cleanup if needed
        /// </summary>
        protected override void EndProcessing()
        {
        }
    }
}