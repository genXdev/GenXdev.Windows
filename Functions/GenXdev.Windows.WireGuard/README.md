# WireGuard VPN Management Functions

![WireGuard Logo](https://www.wireguard.com/img/wireguard.svg)

## Overview

This module provides PowerShell functions to manage a WireGuard VPN server running in a Docker container. WireGuard is an extremely simple yet fast and modern VPN that utilizes state-of-the-art cryptography. It's designed to be faster, simpler, leaner, and more useful than IPsec while avoiding the massive headache.

## MIT License

```text
MIT License

Copyright (c) [year] [fullname]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
````

## Quick Start

```powershell
# Ensure the WireGuard server is running
EnsureWireGuard

# Add a new peer (client)
Add-WireGuardPeer -PeerName "MyPhone"

# Show QR code for a peer (for mobile device setup)
Get-WireGuardPeerQRCode -PeerNumber 1

# List all configured peers
Get-WireGuardPeers

# Remove a peer by name
Remove-WireGuardPeer -PeerName "MyPhone"
```

## Prerequisites

- Docker Desktop installed and running
- PowerShell 5.1 or later (PowerShell Core is also supported)
- Network port 51839/UDP available and forwarded (if used behind NAT)
- WireGuard client app installed on devices you want to connect

## WireGuard vs Traditional VPNs

WireGuard offers several advantages over traditional VPNs:

- **Simple**: The codebase is minimal (~4,000 lines vs. 400,000+ for OpenVPN)
- **Fast**: Significantly faster than OpenVPN and IPsec
- **Secure**: Uses modern cryptography protocols by default
- **Lightweight**: Minimal CPU usage and battery impact on mobile devices
- **Stable**: Connection remains stable during network changes or sleep

## Available Functions

| Function                       | Description                                       |
| ------------------------------ | ------------------------------------------------- |
| `EnsureWireGuard`              | Ensures the WireGuard server container is running |
| `Add-WireGuardPeer`            | Adds a new peer (client) configuration            |
| `Get-WireGuardPeerQRCode`      | Generates a QR code for easy mobile client setup  |
| `Get-WireGuardPeers`           | Lists all configured peers                        |
| `Remove-WireGuardPeer`         | Removes a peer configuration                      |
| `Reset-WireGuardConfiguration` | Resets the WireGuard configuration                |

## Detailed Usage

### Setting up the WireGuard Server

```powershell
# Basic setup with default settings
EnsureWireGuard

# Custom setup with specific port and container name
EnsureWireGuard -ContainerName "my_wireguard" -ServicePort 51821
```

### Managing Peers (Clients)

```powershell
# Add a new peer with default settings
Add-WireGuardPeer -PeerName "Laptop"

# Add a peer with custom allowed IPs
Add-WireGuardPeer -PeerName "Phone" -AllowedIPs "10.13.13.2/32"

# Generate a QR code for easy setup on mobile devices
Get-WireGuardPeerQRCode -PeerNumber 1

# List all peers
Get-WireGuardPeers

# Remove a peer
Remove-WireGuardPeer -PeerName "OldDevice"
```

## Client Setup

### Android

1. Install the [WireGuard app](https://play.google.com/store/apps/details?id=com.wireguard.android) from Google Play Store
2. Use `Get-WireGuardPeerQRCode` to generate a QR code
3. In the WireGuard app, tap "+" and select "Scan from QR code"
4. Scan the QR code displayed in your terminal
5. Tap "Create Tunnel" and activate the VPN connection

### iOS

1. Install the [WireGuard app](https://apps.apple.com/us/app/wireguard/id1441195209) from App Store
2. Use `Get-WireGuardPeerQRCode` to generate a QR code
3. In the WireGuard app, tap "+" and select "Create from QR code"
4. Scan the QR code displayed in your terminal
5. Activate the VPN connection

### Windows/macOS/Linux

1. Download and install the [WireGuard client](https://www.wireguard.com/install/)
2. Use `Add-WireGuardPeer` to generate a configuration file
3. Import the generated .conf file into the WireGuard client
4. Activate the VPN connection

## Troubleshooting

### Common Issues

- **Connection Timeouts**: Make sure port 51839/UDP is open in your firewall and forwarded in your router
- **Client Can't Connect**: Verify the endpoint IP address matches your server's public IP
- **Configuration Errors**: Check for proper configuration by examining the peer details
- **Docker Issues**: Ensure Docker is running and that the container has the necessary permissions

### Logs and Diagnostics

To view the WireGuard server logs:

```powershell
docker logs wireguard
```

## License

MIT License - see LICENSE file for details.

## Additional Resources

- [Official WireGuard Website](https://www.wireguard.com/)
- [WireGuard Documentation](https://www.wireguard.com/quickstart/)
- [LinuxServer.io WireGuard Container](https://docs.linuxserver.io/images/docker-wireguard)
