// ################################################################################
// Part of PowerShell module : GenXdev.Windows
// Original cmdlet filename  : Set-ForegroundWindow.cs
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



using System.Runtime.InteropServices;
using System.Management.Automation;

namespace GenXdev.Windows
{
    /// <summary>
    /// <para type="synopsis">
    /// Brings the specified window to the foreground and makes it the active window.
    /// </para>
    ///
    /// <para type="description">
    /// Makes a window the foreground window using multiple Win32 API methods for maximum
    /// reliability. First attempts using SwitchToThisWindow API, then falls back to
    /// SetForegroundWindow if needed. This dual approach ensures consistent window
    /// activation across different Windows versions and scenarios.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -WindowHandle &lt;IntPtr&gt;<br/>
    /// An IntPtr handle to the target window. This handle can be obtained from Windows
    /// API calls or PowerShell window management functions like Get-Process
    /// MainWindowHandle.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Make Notepad the active window using full parameter name</para>
    /// <para>This example demonstrates how to bring a Notepad window to the foreground using the window handle.</para>
    /// <code>
    /// $hwnd = (Get-Process notepad).MainWindowHandle
    /// Set-ForegroundWindow -WindowHandle $hwnd
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Using positional parameter for simpler syntax</para>
    /// <para>This example shows using the positional parameter for concise syntax.</para>
    /// <code>
    /// $hwnd = (Get-Process notepad).MainWindowHandle
    /// Set-ForegroundWindow $hwnd
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Set, "ForegroundWindow")]
    public class SetForegroundWindowCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// An IntPtr handle to the target window. This handle can be obtained from Windows
        /// API calls or PowerShell window management functions like Get-Process
        /// MainWindowHandle.
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            HelpMessage = "Window handle to set as foreground window")]
        public IntPtr WindowHandle { get; set; }

        /// <summary>
        /// P/Invoke declaration for SwitchToThisWindow API
        /// </summary>
        [DllImport("user32.dll")]
        private static extern void SwitchToThisWindow(IntPtr hWnd, bool fAltTab);

        /// <summary>
        /// P/Invoke declaration for SetForegroundWindow API
        /// </summary>
        [DllImport("user32.dll")]
        private static extern bool SetForegroundWindow(IntPtr hWnd);

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            // Log the activation attempt with the window handle
            WriteVerbose($"Attempting to set foreground window for handle: {WindowHandle}");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            if (ShouldProcess($"Window {WindowHandle}", "Set as foreground window"))
            {
                try
                {
                    // Try the preferred SwitchToThisWindow API first as it's more reliable
                    WriteVerbose("Attempting primary method: SwitchToThisWindow...");
                    SwitchToThisWindow(WindowHandle, false);
                }
                catch (Exception ex)
                {
                    // Log failure of primary activation method
                    WriteVerbose($"SwitchToThisWindow failed: {ex.Message}");
                }

                try
                {
                    // Attempt SetForegroundWindow as fallback if first method failed
                    WriteVerbose("Attempting fallback method: SetForegroundWindow...");
                    SetForegroundWindow(WindowHandle);
                }
                catch (Exception ex)
                {
                    // Log failure of backup activation method
                    WriteVerbose($"SetForegroundWindow failed: {ex.Message}");
                }
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