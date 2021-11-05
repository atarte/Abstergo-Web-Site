#
# Script Windows PowerShell pour le déploiement d’AD DS
# Installation/Configutation des toutes les fonctionnalité et services de base
# du controleur de domaine principal
#

# Configutation des interface réseau -------------------------------------------
# Obtention de l'adapateur réseau
$adp = (Get-NetAdapter -Name "lan").ifIndex

# Modification de l'adresse ip de l'adapateur réseau
New-NetIPAddress –InterfaceIndex $adp –IPAddress 10.0.1.11 –PrefixLength 24 –DefaultGateway 10.0.1.1

# Modification du dns de l'adapateur réseau
Set-DnsClientServerAddress -InterfaceIndex $adp -ServerAddresses "10.0.1.11"

# Configutation de L'AD DS -----------------------------------------------------
# Installation de l'AD principal
Import-Module ADDSDeployment
Install-ADDSForest -CreateDnsDelegation:$false -DatabasePath "C:\Windows\NTDS" -DomainMode "WinThreshold" -DomainName "exia.local" -DomainNetbiosName "EXIA" -ForestMode "WinThreshold" -InstallDns:$true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion:$false -SysvolPath "C:\Windows\SYSVOL" -Force:$true

# Configutation du DNS ---------------------------------------------------------
# Creation et configuration des zones de recherche direct
Add-DnsServerResourceRecordA -Name "firewall" -ZoneName "exia.local" -IPv4Address "10.0.1.1"
Add-DnsServerResourceRecordA -Name "monitoring" -ZoneName "exia.local" -IPv4Address "10.0.1.2"

Add-DnsServerPrimaryZone -Name "exia.com" -ReplicationScope "Forest" -PassThru
Add-DnsServerResourceRecordA -Name "erp" -ZoneName "exia.com" -IPv4Address "10.0.1.1"
Add-DnsServerResourceRecordA -Name "www" -ZoneName "exia.com" -IPv4Address "10.0.1.1"
Add-DnsServerResourceRecordA -Name "wiki" -ZoneName "exia.com" -IPv4Address "10.0.1.1"

# Creation et configuration de la zone de recherche inverse
Add-DnsServerPrimaryZone -NetworkId "10.0.1.0/24" -ReplicationZone "Domain"
ipconfig /registerdns

# Configutation du DHCP --------------------------------------------------------
# Installation du service de DHCP
Install-WindowsFeature -Name 'DHCP' -IncludeManagementTools

# Ajout d'un scope de DHCP
Add-DhcpServerV4Scope -Name "DHCP-scope" -StartRange 10.0.1.25 -EndRange 10.0.1.254 -SubnetMask 255.255.255.0 -State Active

# Ajout de valeur pour le DHCP
Set-DhcpServerV4OptionValue -ScopeID 10.0.1.0 -DnsDomain exia.local -DnsServer 10.0.1.11 -Router 10.0.1.1

# Configutation de la durée d'une session
Set-DhcpServerv4Scope -ScopeId 10.0.1.0 -LeaseDuration 1.00:00:00

# Relancement du service DHCP
Restart-Service dhcpserver

# Configutation de SNMP ---------------------------------------------------------
# Installation du service SNMP
Install-WindowsFeature SNMP-Service -IncludeAllSubFeature -IncludeManagementTools

# Configutation du service SNMP
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities" -Name "public" -Value 4 -type DWord
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\PermittedManagers" -Name "2" -Value "10.0.1.11" -type String

# Restart du service SNMP
Restart-Service -Name SNMP

# Configutation de la sauvegarde des données -----------------------------------
# Installation de Windows server backup
Install-WindowsFeature Windows-Server-Backup

# Configutation d'un backup compléte régulaire
Add-WBBackupTarget -Policy New-Policy | Add-WBSystemState -Target New-WBBackupTarget -NetworkPath "//DC1/Backup-DC0" - Credential (Get-Credential)
Set-WBbackupTarget -Policy New-Policy | Add-WBSystemState -VssFullbackup
Set-WBSchedule -Policy New-Policy | Add-WBSystemState -Schedule 23:00
Set-WBPolicy -Policy New-Policy | Add-WBSystemState

# Changement de nom de l'AD primaire -------------------------------------------
Rename-Computer -NewName DC0 -DomainCredential EXIA\Administrator -PassThru

# Redemarrage du serveur
Restart-Computer
