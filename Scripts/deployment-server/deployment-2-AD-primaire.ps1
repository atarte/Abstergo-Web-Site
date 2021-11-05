#
# Script Windows PowerShell pour le déploiement d’AD DS
# Configutation des fichiers et policy interne du controleur de domaine principal
# et configuration des services qui non pas peu l'être présédement à cause des restart de l'oridnateur
#

# Configutation du protocole SNMP ----------------------------------------------
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities" -Name "public" -Value 4 -type DWord

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\PermittedManagers" -Name "2" -Value "192.168.168.10" -type String

Restart-Service -Name SNMP
