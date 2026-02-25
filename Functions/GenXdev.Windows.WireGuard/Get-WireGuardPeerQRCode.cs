// ################################################################################
// Part of PowerShell module : GenXdev.Windows.WireGuard
// Original cmdlet filename  : Get-WireGuardPeerQRCode.cs
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



using System.Management.Automation;

namespace GenXdev.Windows.WireGuard
{
    /// <summary>
    /// <para type="synopsis">
    /// Generates a QR code for a WireGuard VPN peer configuration.
    /// </para>
    ///
    /// <para type="description">
    /// This function generates a QR code for a WireGuard VPN peer configuration that
    /// can be scanned by mobile devices for easy setup. The QR code is displayed in
    /// the console and can be used to quickly configure WireGuard clients on
    /// smartphones and tablets. The function interacts with the linuxserver/wireguard
    /// Docker container to generate QR codes for peer configurations.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -PeerName &lt;String&gt;<br/>
    /// The name of the peer to generate a QR code for.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -NoDockerInitialize &lt;SwitchParameter&gt;<br/>
    /// Skip Docker initialization (used when already called by parent function).<br/>
    /// - <b>Mandatory</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Force &lt;SwitchParameter&gt;<br/>
    /// Force rebuild of Docker container and remove existing data.<br/>
    /// - <b>Aliases</b>: ForceRebuild<br/>
    /// - <b>Mandatory</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -ContainerName &lt;String&gt;<br/>
    /// The name for the Docker container.<br/>
    /// - <b>Default</b>: "wireguard"<br/>
    /// - <b>Mandatory</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -VolumeName &lt;String&gt;<br/>
    /// The name for the Docker volume for persistent storage.<br/>
    /// - <b>Default</b>: "wireguard_data"<br/>
    /// - <b>Mandatory</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -ServicePort &lt;Int32&gt;<br/>
    /// The port number for the WireGuard service.<br/>
    /// - <b>Default</b>: 51839<br/>
    /// - <b>Mandatory</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -HealthCheckTimeout &lt;Int32&gt;<br/>
    /// Maximum time in seconds to wait for service health check.<br/>
    /// - <b>Default</b>: 60<br/>
    /// - <b>Mandatory</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -HealthCheckInterval &lt;Int32&gt;<br/>
    /// Interval in seconds between health check attempts.<br/>
    /// - <b>Default</b>: 3<br/>
    /// - <b>Mandatory</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -ImageName &lt;String&gt;<br/>
    /// Custom Docker image name to use.<br/>
    /// - <b>Default</b>: "linuxserver/wireguard"<br/>
    /// - <b>Mandatory</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -PUID &lt;String&gt;<br/>
    /// User ID for permissions in the container.<br/>
    /// - <b>Default</b>: "1000"<br/>
    /// - <b>Mandatory</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -PGID &lt;String&gt;<br/>
    /// Group ID for permissions in the container.<br/>
    /// - <b>Default</b>: "1000"<br/>
    /// - <b>Mandatory</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -TimeZone &lt;String&gt;<br/>
    /// Timezone to use for the container.<br/>
    /// - <b>Default</b>: "Etc/UTC"<br/>
    /// - <b>Mandatory</b>: false<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get-WireGuardPeerQRCode -PeerName "MyPhone"</para>
    /// <para>Generates a QR code for the peer named "MyPhone".</para>
    /// <code>
    /// Get-WireGuardPeerQRCode -PeerName "MyPhone"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get-WireGuardPeerQRCode -PeerName "Tablet" -NoDockerInitialize</para>
    /// <para>Generates a QR code for the peer named "Tablet" without initializing Docker.</para>
    /// <code>
    /// Get-WireGuardPeerQRCode -PeerName "Tablet" -NoDockerInitialize
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "WireGuardPeerQRCode")]
    [OutputType(typeof(void))]
    public class GetWireGuardPeerQRCodeCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The name of the peer to generate a QR code for
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            HelpMessage = "The name of the peer to generate a QR code for")]
        [ValidateNotNullOrEmpty]
        public string PeerName { get; set; }

        /// <summary>
        /// Skip Docker initialization (used when already called by parent function)
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Skip Docker initialization (used when already called by parent function)")]
        public SwitchParameter NoDockerInitialize { get; set; }

        /// <summary>
        /// Force rebuild of Docker container and remove existing data
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Force rebuild of Docker container and remove existing data")]
        [Alias("ForceRebuild")]
        public SwitchParameter Force { get; set; }

        /// <summary>
        /// The name for the Docker container
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "The name for the Docker container")]
        [ValidateNotNullOrEmpty]
        public string ContainerName { get; set; } = "wireguard";

        /// <summary>
        /// The name for the Docker volume for persistent storage
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "The name for the Docker volume for persistent storage")]
        [ValidateNotNullOrEmpty]
        public string VolumeName { get; set; } = "wireguard_data";

        /// <summary>
        /// The port number for the WireGuard service
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "The port number for the WireGuard service")]
        [ValidateRange(1, 65535)]
        public int ServicePort { get; set; } = 51839;

        /// <summary>
        /// Maximum time in seconds to wait for service health check
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Maximum time in seconds to wait for service health check")]
        [ValidateRange(10, 300)]
        public int HealthCheckTimeout { get; set; } = 60;

        /// <summary>
        /// Interval in seconds between health check attempts
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Interval in seconds between health check attempts")]
        [ValidateRange(1, 10)]
        public int HealthCheckInterval { get; set; } = 3;

        /// <summary>
        /// Custom Docker image name to use
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Custom Docker image name to use")]
        [ValidateNotNullOrEmpty]
        public string ImageName { get; set; } = "linuxserver/wireguard";

        /// <summary>
        /// User ID for permissions in the container
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "User ID for permissions in the container")]
        [ValidateNotNullOrEmpty]
        public string PUID { get; set; } = "1000";

        /// <summary>
        /// Group ID for permissions in the container
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Group ID for permissions in the container")]
        [ValidateNotNullOrEmpty]
        public string PGID { get; set; } = "1000";

        /// <summary>
        /// Timezone to use for the container
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Timezone to use for the container")]
        [ValidateNotNullOrEmpty]
        public string TimeZone { get; set; } = "Etc/UTC";

        /// <summary>
        /// Begin processing - ensure WireGuard service is available if needed
        /// </summary>
        protected override void BeginProcessing()
        {
            // Ensure the WireGuard service is running
            if (!NoDockerInitialize.ToBool())
            {
                WriteVerbose("Ensuring WireGuard service is available");

                // Copy matching parameters to pass to EnsureWireGuard function
                var paramsDict = CopyIdenticalParamValues("GenXdev.Windows\\EnsureWireGuard");

                // Initialize WireGuard service with specified parameters
                var invokeScript = ScriptBlock.Create("param($params) GenXdev.Windows\\EnsureWireGuard @params");
                foreach (var line in invokeScript.Invoke(paramsDict))
                {
                    System.Console.WriteLine(line.ToString().Trim());
                }
            }
            else
            {
                WriteVerbose("Skipping Docker initialization as requested");
            }
        }

        /// <summary>
        /// Process record - display QR code for the peer
        /// </summary>
        protected override void ProcessRecord()
        {
            try
            {
                WriteVerbose($"Displaying QR code for peer: {PeerName}");

                // Use the container's built-in QR code display
                var dockerScript = ScriptBlock.Create(@"
                    param($ContainerName, $PeerName)
                    docker exec $ContainerName /app/show-peer $PeerName
                    $LASTEXITCODE
                ");
                var result = dockerScript.Invoke(ContainerName, PeerName);
                int exitCode = (int)((PSObject)result[0]).BaseObject;

                if (exitCode != 0)
                {
                    throw new Exception($"Failed to display QR code for peer '{PeerName}'");
                }

                // Write success message in green
                Host.UI.WriteLine(ConsoleColor.Green, Host.UI.RawUI.BackgroundColor, $"QR code displayed for peer '{PeerName}'");
            }
            catch (Exception ex)
            {
                WriteError(new ErrorRecord(
                    ex,
                    "WireGuardPeerQRCodeError",
                    ErrorCategory.OperationStopped,
                    PeerName));
                throw;
            }
        }
    }
}