// ################################################################################
// Part of PowerShell module : GenXdev.Windows
// Original cmdlet filename  : Get-ForegroundWindow.cs
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
using System.Runtime.InteropServices;
using System.Management.Automation;

namespace GenXdev.Windows
{
    /// <summary>
    /// <para type="synopsis">
    /// Gets the handle of the currently active foreground window.
    /// </para>
    ///
    /// <para type="description">
    /// This cmdlet retrieves the window handle (HWND) of the window that is
    /// currently in the foreground and has keyboard focus. It uses Windows API
    /// functions through P/Invoke to interact with the User32.dll library.
    /// </para>
    ///
    /// <example>
    /// <para>Get the handle of the currently active window</para>
    /// <para>This example retrieves and returns the IntPtr handle of the currently active window.</para>
    /// <code>
    /// Get-ForegroundWindow
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Store the foreground window handle in a variable</para>
    /// <para>This example stores the foreground window handle in a variable and displays it.</para>
    /// <code>
    /// $windowHandle = Get-ForegroundWindow
    /// Write-Host "Active window handle: $windowHandle"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "ForegroundWindow")]
    [OutputType(typeof(IntPtr))]
    public class GetForegroundWindowCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// P/Invoke declaration for GetForegroundWindow from user32.dll
        /// </summary>
        [DllImport("user32.dll")]
        private static extern IntPtr GetForegroundWindow();

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
            // Output verbose information about the operation being performed
            WriteVerbose("Attempting to get foreground window handle");

            // Call the Windows API to get the handle of the currently active window
            WriteObject(GetForegroundWindow());
        }

        /// <summary>
        /// End processing - cleanup logic
        /// </summary>
        protected override void EndProcessing()
        {
        }
    }
}