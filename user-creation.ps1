# created by Bret Fisher - bret@fishbrains.com

# meant to 
#SEARCH AND REPLACE:
     #MYUSER_ with service account prefix
     #DOMAIN with AD domain
     #"password" with service account password
     #OU=Service Accounts with OU accounts belong in

#SearchContentAccess has been changed to ContentAccess to fit
#SP_CacheSuperReader has been changed to SP_CacheSuperRdr

# I recommend keeping the prefix blank if this is your first farm in the domain
# you can add a prefix to allow for multiple farm deployments using different accounts
# but you'll then need to update the AutoSPInstallerInput.xml
$prefix = ""

$domain = ""

$UserPath = "OU=SharePoint Services,DC=DOMAIN,DC=COM"


# ======================
# You should need to edit these lines, but you may want to uncomment the ones for SQL and ADFS
Import-Module ActiveDirectory
New-ADUser -SamAccountName MYUSER_SPinstall -Name "MYUSER_SPinstall" -UserPrincipalName "MYUSER_SPinstall@DOMAIN.com" -Description "SP installer account" -AccountPassword (ConvertTo-SecureString -AsPlainText "password" -Force) -Enabled $true -PasswordNeverExpires $true -Path $UserPath
New-ADUser -SamAccountName MYUSER_SPfarm -Name "MYUSER_SPfarm" -UserPrincipalName "MYUSER_SPfarm@DOMAIN.com" -Description "SP Farm" -AccountPassword (ConvertTo-SecureString -AsPlainText "password" -Force) -Enabled $true -PasswordNeverExpires $true -Path $UserPath
New-ADUser -SamAccountName MYUSER_SPservice -Name "MYUSER_SPservice" -UserPrincipalName "MYUSER_SPservice@DOMAIN.com" -Description "SP Services" -AccountPassword (ConvertTo-SecureString -AsPlainText "password" -Force) -Enabled $true -PasswordNeverExpires $true -Path $UserPath
New-ADUser -SamAccountName MYUSER_portalacc -Name "MYUSER_portalacc" -UserPrincipalName "MYUSER_portalacc@DOMAIN.com" -Description "SP Content Svc" -AccountPassword (ConvertTo-SecureString -AsPlainText "password" -Force) -Enabled $true -PasswordNeverExpires $true -Path $UserPath
New-ADUser -SamAccountName MYUSER_mysitesacc -Name "MYUSER_mysitesacc" -UserPrincipalName "MYUSER_mysitesacc@DOMAIN.com" -Description "SP mysites" -AccountPassword (ConvertTo-SecureString -AsPlainText "password" -Force) -Enabled $true -PasswordNeverExpires $true -Path $UserPath
New-ADUser -SamAccountName MYUSER_SP_CacheSuperUser -Name "MYUSER_SP_CacheSuperUser" -UserPrincipalName "MYUSER_SP_CacheSuperUser@DOMAIN.com" -Description "SP cache Super User" -AccountPassword (ConvertTo-SecureString -AsPlainText "password" -Force) -Enabled $true -PasswordNeverExpires $true -Path $UserPath
New-ADUser -SamAccountName MYUSER_SP_CacheSuperRdr -Name "MYUSER_SP_CacheSuperRdr" -UserPrincipalName "MYUSER_SP_CacheSuperRdr@DOMAIN.com" -Description "SP cache Super Reader" -AccountPassword (ConvertTo-SecureString -AsPlainText "password" -Force) -Enabled $true -PasswordNeverExpires $true -Path $UserPath
New-ADUser -SamAccountName MYUSER_UPSync -Name "MYUSER_UPSync" -UserPrincipalName "MYUSER_UPSync@DOMAIN.com" -Description "SP User Prof Sync" -AccountPassword (ConvertTo-SecureString -AsPlainText "password" -Force) -Enabled $true -PasswordNeverExpires $true -Path $UserPath
New-ADUser -SamAccountName MYUSER_SPsearch -Name "MYUSER_SPsearch" -UserPrincipalName "MYUSER_SPsearch@DOMAIN.com" -Description "SP search" -AccountPassword (ConvertTo-SecureString -AsPlainText "password" -Force) -Enabled $true -PasswordNeverExpires $true -Path $UserPath
New-ADUser -SamAccountName MYUSER_ContentAccess -Name "MYUSER_ContentAccess" -UserPrincipalName "MYUSER_ContentAccess@DOMAIN.com" -Description "SP search Content Access" -AccountPassword (ConvertTo-SecureString -AsPlainText "password" -Force) -Enabled $true -PasswordNeverExpires $true -Path $UserPath
New-ADUser -SamAccountName MYUSER_ExcelUser -Name "MYUSER_ExcelUser" -UserPrincipalName "MYUSER_ExcelUser@DOMAIN.com" -Description "SP Excel Service" -AccountPassword (ConvertTo-SecureString -AsPlainText "password" -Force) -Enabled $true -PasswordNeverExpires $true -Path $UserPath
New-ADUser -SamAccountName MYUSER_VisioUser -Name "MYUSER_VisioUser" -UserPrincipalName "MYUSER_VisioUser@DOMAIN.com" -Description "SP Visio Service" -AccountPassword (ConvertTo-SecureString -AsPlainText "password" -Force) -Enabled $true -PasswordNeverExpires $true -Path $UserPath
New-ADUser -SamAccountName MYUSER_PerfPointUser -Name "MYUSER_PerfPointUser" -UserPrincipalName "MYUSER_PerfPointUser@DOMAIN.com" -Description "SP PerformancePoint Service" -AccountPassword (ConvertTo-SecureString -AsPlainText "password" -Force) -Enabled $true -PasswordNeverExpires $true -Path $UserPath
