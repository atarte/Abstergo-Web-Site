#
# Script Windows PowerShell pour le déploiement d’AD DS
#

# Obtention de l'adapateur réseau
$adp = (Get-NetAdapter -Name "Ethernet0").ifIndex

# Modification de l'adresse ip de l'adapateur réseau
New-NetIPAddress –InterfaceIndex $adp –IPAddress 10.0.1.11 –PrefixLength 24 –DefaultGateway 10.0.1.1

# Modification du dns de l'adapateur réseau
Set-DnsClientServerAddress -InterfaceIndex $adp -ServerAddresses "10.0.1.11"

# Deploiement de l'AD principal
Import-Module ADDSDeployment
Install-ADDSDomainController -NoGlobalCatalog:$false -CreateDnsDelegation:$false -Credential (Get-Credential) -CriticalReplicationOnly:$false -DatabasePath "C:\Windows\NTDS" -DomainName "exia.local" -InstallDns:$true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion:$false -ReplicationSourceDC "DC0.exia.local" -SiteName "Default-First-Site-Name" -SysvolPath "C:\Windows\SYSVOL" ` -Force:$true

# Création des fichier partager

# Changement de nom de l'ad secondaire
Rename-Computer -NewName DC0 -DomainCredential EXIA\Administrator -PassThru

# Redemarrage du serveur
Shutdown-r-t 0
