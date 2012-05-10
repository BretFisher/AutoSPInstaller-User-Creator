AD User Creation Script for SharePoint 2010 Service Accounts
====================

Use this along with www.AutoSPInstaller.com @ CodePlex to (nearly) fully automate a single or multi-server SharePoint 2010 deployment.  This PowerShell script will use the Active Directory PowerShell snapin to create the preset service accounts used in AutoSPInstaller.

Uses a Creative Commons Public Domain License (CC0)
http://creativecommons.org/publicdomain/zero/1.0/
You are free to do what you want with this code.

## How to Use
1. Download to a Server 2008 R2 or newer box running the ADDS role (a domain controller) or one with the ADDS snapin installed (RSAT may have it)
1. Remember that after downloading script you need to r-click -> properties -> unlock
2. Then run PowerShell as administrator and set your execution policy to run scripts.
    Set-ExecutionPolicy RemoteSigned
3. Open the .ps1 file and edit the variables at top
4. Now just run the script from that admin PoSh window
5. Verify users are created, now go get AutoSPInstaller to automate SharePoint

Enjoy,
- Bret