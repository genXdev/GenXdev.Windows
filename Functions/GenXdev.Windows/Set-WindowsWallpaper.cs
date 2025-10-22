// ################################################################################
// Part of PowerShell module : GenXdev.Windows
// Original cmdlet filename  : Set-WindowsWallpaper.cs
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
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Management.Automation;
using System.Runtime.InteropServices;
using Microsoft.Win32;

namespace GenXdev.Windows
{
    /// <summary>
    /// <para type="synopsis">
    /// Sets a random wallpaper from a specified directory.
    /// </para>
    ///
    /// <para type="description">
    /// Selects a random image file from the specified directory and sets it as the
    /// Windows desktop wallpaper. Supports JPG/JPEG image formats and configures the
    /// wallpaper to "fit" the screen by default.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -InputObject &lt;Object&gt;<br/>
    /// The file path pattern to search for wallpaper images. Supports wildcards and<br/>
    /// recursive search. This is the path to the directory containing the wallpaper<br/>
    /// images. When multiple images are found, one is selected at random.<br/>
    /// - <b>Aliases</b>: Path, FullName, FilePath, Input<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Default</b>: ".\"<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -AllDrives &lt;SwitchParameter&gt;<br/>
    /// Search across all available drives.<br/>
    /// - <b>Position</b>: named<br/>
    /// - <b>Default</b>: False<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -NoRecurse &lt;SwitchParameter&gt;<br/>
    /// Do not recurse into subdirectories.<br/>
    /// - <b>Position</b>: named<br/>
    /// - <b>Default</b>: False<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Set a random wallpaper from the specified directory.</para>
    /// <para>This example sets a random wallpaper from the C:\Wallpapers directory.</para>
    /// <code>
    /// Set-WindowsWallpaper -InputObject "C:\Wallpapers\*.jpg"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Set a random wallpaper from the default wallpaper directory.</para>
    /// <para>This example sets a random wallpaper from the default directory.</para>
    /// <code>
    /// nextbg
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Set, "WindowsWallpaper")]
    [OutputType(typeof(void))]
    public class SetWindowsWallpaperCommand : PSGenXdevCmdlet
    {
        private List<string> fileNames = new List<string>();

        /// <summary>
        /// The file path pattern to search for wallpaper images. Supports wildcards and
        /// recursive search. This is the path to the directory containing the wallpaper
        /// images. When multiple images are found, one is selected at random.
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = false,
            HelpMessage = "Path to the directory containing the wallpaper images",
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true
        )]
        [Alias("Path", "FullName", "FilePath", "Input")]
        public object InputObject { get; set; } = ".\\";

        /// <summary>
        /// Search across all available drives.
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Search across all available drives"
        )]
        public SwitchParameter AllDrives { get; set; }

        /// <summary>
        /// Do not recurse into subdirectories.
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Do not recurse into subdirectories"
        )]
        public SwitchParameter NoRecurse { get; set; }

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            // Copy parameters using base method
            var paramsDict = CopyIdenticalParamValues("GenXdev.FileSystem\\ResolveInputObjectFileNames");

            // Call ResolveInputObjectFileNames
            var resolveScript = ScriptBlock.Create("param($params) GenXdev.FileSystem\\ResolveInputObjectFileNames @params");
            var resolveResult = resolveScript.Invoke(paramsDict);

            // Collect file names
            foreach (var item in resolveResult)
            {
                var psObj = item as PSObject;
                if (psObj != null)
                {
                    fileNames.Add(psObj.BaseObject.ToString());
                }
                else
                {
                    fileNames.Add(item.ToString());
                }
            }
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // No processing per record, all done in EndProcessing
        }

        /// <summary>
        /// End processing - cleanup logic
        /// </summary>
        protected override void EndProcessing()
        {
            // Select a random file and set wallpaper
            if (fileNames.Count > 0)
            {
                var random = new Random();
                var selectedFile = fileNames[random.Next(fileNames.Count)];

                // Expand the path
                string file = ExpandPath(selectedFile);

                // Write verbose message
                WriteVerbose($"Selected wallpaper: {file}");

                // Check if should process
                if (ShouldProcess(file, "Set Windows wallpaper"))
                {
                    // Set registry values
                    using (var key = Registry.CurrentUser.OpenSubKey("Control Panel\\Desktop", true))
                    {
                        if (key != null)
                        {
                            key.SetValue("Wallpaper", file);
                            key.SetValue("WallpaperStyle", "10");
                            key.SetValue("TileWallpaper", "0");
                        }
                    }

                    // Update wallpaper using SystemParametersInfo
                    SystemParametersInfo(20, 0, file, 0x1 | 0x2);

                    // Write verbose message
                    WriteVerbose("Wallpaper has been updated successfully");
                }
            }
        }

        // P/Invoke declaration for SystemParametersInfo
        [DllImport("user32.dll", CharSet = CharSet.Auto)]
        private static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
    }
}