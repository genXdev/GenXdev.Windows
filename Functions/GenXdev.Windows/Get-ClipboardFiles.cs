// ################################################################################
// Part of PowerShell module : GenXdev.Windows
// Original cmdlet filename  : Get-ClipboardFiles.cs
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
using System.Management.Automation;
using System.Windows.Forms;

namespace GenXdev.Windows
{
    /// <summary>
    /// <para type="synopsis">
    /// Gets files from the Windows clipboard that were set for file operations like copy/paste.
    /// </para>
    ///
    /// <para type="description">
    /// This function retrieves file paths from the Windows clipboard that were previously
    /// set for file operations. It handles both STA and MTA threading modes automatically,
    /// ensuring compatibility across different PowerShell execution contexts. The function
    /// validates file existence and returns only existing files/directories as objects
    /// similar to Get-ChildItem or Get-Item output.
    /// </para>
    ///
    /// <example>
    /// <para>Get all files currently in the clipboard and returns them as file system objects.</para>
    /// <code>
    /// Get-ClipboardFiles
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get clipboard files and displays their full paths.</para>
    /// <code>
    /// $clipboardFiles = Get-ClipboardFiles
    /// $clipboardFiles | ForEach-Object { Write-Host $_.FullName }
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get only text files from the clipboard.</para>
    /// <code>
    /// Get-ClipboardFiles | Where-Object { $_.Extension -eq '.txt' }
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get all files from the clipboard and lists them in a detailed format.</para>
    /// <code>
    /// Get-ClipboardFiles | Get-ChildItem
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "ClipboardFiles")]
    [Alias("getclipfiles", "gcbf")]
    [OutputType(typeof(PSObject))]
    public class GetClipboardFilesCommand : PSGenXdevCmdlet
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
            // Get current thread apartment state for clipboard compatibility
            var apartmentState = System.Threading.Thread.CurrentThread.GetApartmentState();

            // Initialize collection for file paths
            var clipboardFilePaths = new List<string>();

            // Check if running in single-threaded apartment mode
            if (apartmentState == System.Threading.ApartmentState.STA)
            {
                // Output verbose information about direct clipboard operation
                WriteVerbose("Getting clipboard files directly in STA mode");

                try
                {
                    // Get file drop list from clipboard in STA mode
                    var fileDropList = Clipboard.GetFileDropList();

                    if (fileDropList != null)
                    {
                        foreach (string file in fileDropList)
                        {
                            clipboardFilePaths.Add(file);
                        }
                    }
                }
                catch
                {
                    // Output verbose information if clipboard doesn't contain files
                    WriteVerbose("No file drop list found in clipboard or clipboard access failed");
                    return;
                }
            }
            else
            {
                // Output verbose information about STA subprocess requirement
                WriteVerbose("Current thread is MTA mode, launching STA subprocess for clipboard operation");

                // Create a temporary file to receive the JSON data
                var tempFile = Path.GetTempFileName();

                // Define the PowerShell command to execute in STA mode
                var command = "Add-Type -AssemblyName System.Windows.Forms;" +
                              "try {" +
                              "$fileDropList = [System.Windows.Forms.Clipboard]::GetFileDropList();" +
                              "if ($null -ne $fileDropList) {" +
                              "$paths = $fileDropList | ForEach-Object { $_ };" +
                              "$paths | ConvertTo-Json -Compress | Out-File '" + tempFile.Replace("'", "''") + "';" +
                              "} else { '[]' | Out-File '" + tempFile.Replace("'", "''") + "'; }" +
                              "} catch { '[]' | Out-File '" + tempFile.Replace("'", "''") + "'; }";

                try
                {
                    // Output verbose information about subprocess execution
                    WriteVerbose("Executing STA subprocess for clipboard operation");

                    // Prepare arguments for PowerShell subprocess
                    var pwshArgs = new[]
                    {
                        "-STA",
                        "-NoProfile",
                        "-Command",
                        command
                    };

                    // Start PowerShell subprocess in STA mode and wait for completion
                    var process = Process.Start(new ProcessStartInfo
                    {
                        FileName = "pwsh",
                        Arguments = string.Join(" ", pwshArgs),
                        UseShellExecute = false,
                        CreateNoWindow = true
                    });
                    process.WaitForExit();

                    // Read the result from temp file
                    if (File.Exists(tempFile))
                    {
                        var jsonContent = File.ReadAllText(tempFile);
                        if (!string.IsNullOrWhiteSpace(jsonContent))
                        {
                            var paths = System.Text.Json.JsonSerializer.Deserialize<string[]>(jsonContent);
                            if (paths != null)
                            {
                                clipboardFilePaths.AddRange(paths);
                            }
                        }
                        File.Delete(tempFile);
                    }
                }
                catch
                {
                    // Cleanup temp file in case of error
                    if (File.Exists(tempFile))
                    {
                        File.Delete(tempFile);
                    }

                    // Output error if subprocess execution fails
                    WriteError(new ErrorRecord(
                        new Exception("Error invoking pwsh"),
                        "ClipboardAccessError",
                        ErrorCategory.NotSpecified,
                        null));
                    return;
                }
            }

            // Exit early if no file paths retrieved
            if (clipboardFilePaths == null || clipboardFilePaths.Count == 0)
            {
                return;
            }

            var done = new HashSet<string>();
            // Validate each file path and collect only existing files/directories
            foreach (var filePath in clipboardFilePaths)
            {
                // Expand the file path to absolute path
                string path = ExpandPath(filePath);

                if (done.Contains(path))
                {
                    // Skip if this path has already been processed
                    continue;
                }

                // Mark this path as processed
                done.Add(path);

                // Check if file exists and return as file system object
                if (File.Exists(path))
                {
                    // Return file object similar to Get-Item
                    var getItemScript = ScriptBlock.Create("param($p) Get-Item -LiteralPath $p");
                    var result = getItemScript.Invoke(path);
                    WriteObject(result[0]);
                    continue;
                }

                if (Directory.Exists(path))
                {
                    // Return directory object similar to Get-Item
                    var getItemScript = ScriptBlock.Create("param($p) Get-Item -LiteralPath $p");
                    var result = getItemScript.Invoke(path);
                    WriteObject(result[0]);
                    continue;
                }
            }

            // Output verbose information about results
            if (clipboardFilePaths.Count > 0)
            {
                WriteVerbose($"Retrieved {clipboardFilePaths.Count} valid file/directory objects from clipboard");
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