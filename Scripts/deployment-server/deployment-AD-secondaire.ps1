#
# Script Windows PowerShell pour le déploiement d’AD DS
# Installation/Configutation des toutes les fonctionnalité et services de base
# du controleur de domaine secondaire
#

# Configutation des interface réseau -------------------------------------------
# Obtention de l'adapateur réseau
$adp=(Get-NetAdapter -Name "Ethernet0").ifIndex

# Modification de l'adresse ip de l'adapateur réseau
New-NetIPAddress –InterfaceIndex $adp –IPAddress 10.0.1.12 –PrefixLength 24 –DefaultGateway 10.0.1.1

# Modification du dns de l'adapateur réseau
Set-DnsClientServerAddress -InterfaceIndex $adp -ServerAddresses "10.0.1.11"

# Configutation de l'AD DS -----------------------------------------------------
# Installation de l'AD secondaire
Import-Module ADDSDeployment
Install-ADDSDomainController -NoGlobalCatalog:$false -CreateDnsDelegation:$false -Credential (Get-Credential) -CriticalReplicationOnly:$false -DatabasePath "C:\Windows\NTDS" -DomainName "exia.local" -InstallDns:$true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion:$false -ReplicationSourceDC "DC0.exia.local" -SiteName "Default-First-Site-Name" -SysvolPath "C:\Windows\SYSVOL" ` -Force:$true

# Configutation de SNMP ---------------------------------------------------------
# Installation du service SNMP
Install-WindowsFeature SNMP-Service -IncludeAllSubFeature -IncludeManagementTools

# Configutation du service SNMP
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities" -Name "public" -Value 4 -type DWord
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\PermittedManagers" -Name "2" -Value "10.0.1.2" -type String

# Restart du service SNMP
Restart-Service -Name SNMP

# Configutation des fichers pour les backups de DC0 ----------------------------
# Création d'un ficher pour les backup de DC0
New-Item "C:\Backup-DC0" -itemType Directory

# Partage sur le réseau du ficher de backup
New-SmbShare -Name Backup-DC0 -Path "C:\Backup-DC0" -FullAccess "Administrateur"

# Changement de nom de l'AD secondaire -----------------------------------------
Rename-Computer -NewName DC1 -DomainCredential EXIA\Administrator -PassThru

# Redemarrage du serveur
Restart-Computer
