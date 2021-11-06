#
# Script Windows PowerShell pour le déploiement d’AD DS
# Configutation des fichiers et policy interne du controleur de domaine principal
#

# Creation des fichiers partager -----------------------------------------------
# Creation des fichiers
New-Item "C:\Direction" -itemType Directory
New-Item "C:\GestionAD" -itemType Directory
New-Item "C:\Compta" -itemType Directory
New-Item "C:\RH" -itemType Directory
New-Item "C:\Dev" -itemType Directory
New-Item "C:\Perso" -itemType Directory
New-Item "C:\Temporaire" -itemType Directory
New-Item "C:\Stagiaire" -itemType Directory
New-Item "C:\Application" -itemType Directory

# Création de partages de fichier
New-SmbShare -Name "Direction" -Path "C:\Direction" -FullAccess "EXIA\GRP_Admin","EXIA\Direction\GRP_direction" -EncryptData $True
New-SmbShare -Name "GestionAD" -Path "C:\GestionAD" -FullAccess "EXIA\GRP_Admin","EXIA\GestionAD\GRP_gestionADResponsables","EXIA\Comptabilité\GRP_gestionAD" -EncryptData $True
New-SmbShare -Name "Compta" -Path "C:\Compta" -FullAccess "EXIA\GRP_Admin","EXIA\Comptabilité\GRP_comptaResponsables" -ReadAccess "EXIA\Comptabilité\GRP_compta" -WriteAccess "EXIA\Comptabilité\GRP_compta" -EncryptData $True
New-SmbShare -Name "RH" -Path "C:\RH" -FullAccess "EXIA\GRP_Admin","EXIA\RessourceHumaines\GRP_RHResponsables" -ReadAccess "EXIA\RessourceHumaines\GRP_RH" -WriteAccess "EXIA\RessourceHumaines\GRP_RH" -EncryptData $True
New-SmbShare -Name "Dev" -Path "C:\Dev" -FullAccess "EXIA\GRP_Admin","EXIA\Developpeur\GRP_devResponsables" -ReadAccess "EXIA\Developpeur\GRP_dev" -WriteAccess "EXIA\Developpeur\GRP_dev" -EncryptData $True
New-SmbShare -Name "Perso" -Path "C:\Perso" -FullAccess "EXIA\GRP_Admin" -ReadAccess "EXIA\GRP_employes" -WriteAccess "EXIA\GRP_employes" -EncryptData $True
New-SmbShare -Name "Temporaire" -Path "C:\Temporaire" -FullAccess "EXIA\GRP_Admin" -ReadAccess "tout le monde" -WriteAccess "tout le monde" -EncryptData $True
New-SmbShare -Name "Stagiaire" -Path "C:\Stagiaire" -FullAccess "EXIA\GRP_Admin","EXIA\Stagiaire\GRP_stagaireResponsables" -ReadAccess "Exia\Stagiaire\GRP_stagaire" -WriteAccess "Exia\Stagiaire\GRP_stagaires" -EncryptData $True
New-SmbShare -Name "Application$" -Path "C:\Application" -FullAccess "EXIA\GRP_Admin","EXIA\ADGestion\GRP_gestionADResponsables" -ReadAccess "tout le monde","EXIA\ADGestion\GRP_gestionAD" -WriteAccess "EXIA\ADGestion\GRP_gestionAD" -EncryptData $True
