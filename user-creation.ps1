# created by Bret Fisher - bret@fishbrains.com

#
# Edit these to your liking
#

# I recommend keeping the prefix SP if this is your first/only farm in the domain
# you should change the prefix to allow for multiple farm deployments using different accounts
$prefix = "SP" #max three characters to fit SamAccountName
$domain = "demo.local"
# where to put accounts in AD. Create the OU before this script runs
$userPath = "OU=SharePoint Services,DC=demo,DC=local"
# passwords. I typically make them random 16 char, except installer I make easier to type :)
$installerPass = ""
$farmAdminPass = ""
$servicePass = ""
$websitePass = ""
$mysitePass = ""
$cacheSuprUsrPass = ""
$cacheSuprReadrPass = ""
$UPSyncPass = ""
$searchPass = ""
$contentAccessPass = ""


# ======================
# no need to edit these
Import-Module ActiveDirectory
# for logging in and installing/patching sharepoint
New-ADUser -SamAccountName $prefix"installer" -Name $prefix"installer" -UserPrincipalName $prefix"installer@"$domain -Description "SP Installer Account" -AccountPassword (ConvertTo-SecureString -AsPlainText $installerPass -Force) -Enabled $true -PasswordNeverExpires $true -Path $userPath
# aka database access account.  Needs SQL dbcreator and securityadmin
New-ADUser -SamAccountName $prefix"farmAdmin" -Name $prefix"farmAdmin" -UserPrincipalName $prefix"farmAdmin@"$domain -Description "SP Farm" -AccountPassword (ConvertTo-SecureString -AsPlainText $farmAdminPass -Force) -Enabled $true -PasswordNeverExpires $true -Path $userPath
# used for all managed service apps, some say to seperate these out, but I prefer to go for RAM savings and performance by using same
New-ADUser -SamAccountName $prefix"service" -Name $prefix"service" -UserPrincipalName $prefix"service@"$domain -Description "SP Services" -AccountPassword (ConvertTo-SecureString -AsPlainText $servicePass -Force) -Enabled $true -PasswordNeverExpires $true -Path $userPath
# used for web applications, portal, extranet, intranet, public, etc
New-ADUser -SamAccountName $prefix"website" -Name $prefix"website" -UserPrincipalName $prefix"website@"$domain -Description "SP Content Svc" -AccountPassword (ConvertTo-SecureString -AsPlainText $websitePass -Force) -Enabled $true -PasswordNeverExpires $true -Path $userPath
# just for mysites web applications
New-ADUser -SamAccountName $prefix"mysite" -Name $prefix"mysite" -UserPrincipalName $prefix"mysite@"$domain -Description "SP mysites" -AccountPassword (ConvertTo-SecureString -AsPlainText $mysitePass -Force) -Enabled $true -PasswordNeverExpires $true -Path $userPath
# speed up sharepoint
New-ADUser -SamAccountName $prefix"cacheSuprUsr" -Name $prefix"cacheSuprUsr" -UserPrincipalName $prefix"cacheSuprUsr@"$domain -Description "SP Cache Super User" -AccountPassword (ConvertTo-SecureString -AsPlainText $cacheSuprUsrPass -Force) -Enabled $true -PasswordNeverExpires $true -Path $userPath
# speed up sharepoint
New-ADUser -SamAccountName $prefix"cacheSuprRdr "-Name $prefix"cacheSuprRdr" -UserPrincipalName $prefix"cacheSuprRdr@"$domain -Description "SP Cache Super Reader" -AccountPassword (ConvertTo-SecureString -AsPlainText $cacheSuprReadrPass -Force) -Enabled $true -PasswordNeverExpires $true -Path $userPath
# user profile sync service
New-ADUser -SamAccountName $prefix"UPSync" -Name $prefix"UPSync" -UserPrincipalName $prefix"UPSync@"$domain -Description "SP User Profile Sync" -AccountPassword (ConvertTo-SecureString -AsPlainText $UPSyncPass -Force) -Enabled $true -PasswordNeverExpires $true -Path $userPath
# search service
New-ADUser -SamAccountName $prefix"search" -Name $prefix"search" -UserPrincipalName $prefix"search@"$domain -Description "SP search" -AccountPassword (ConvertTo-SecureString -AsPlainText $searchPass -Force) -Enabled $true -PasswordNeverExpires $true -Path $userPath
# account that is default for accesing non sharepoint content like file servers
New-ADUser -SamAccountName $prefix"contentAccess" -Name $prefix"contentAccess" -UserPrincipalName $prefix"contentAccess@"$domain -Description "SP Search Content Access" -AccountPassword (ConvertTo-SecureString -AsPlainText $contentAccessPass -Force) -Enabled $true -PasswordNeverExpires $true -Path $userPath
