$AddUserNtfs = Import-CSV C:\Users\Administrateur\Documents\UserNtfs.csv -Delimiter "|"
$PersonnelPathRoot = "C:\employes"
Foreach ($Line in $AddUserNtfs) 
{
$User = $Line.user


    # Créer un dossier pour chaque utilisateur du CSV
    New-Item -ItemType Directory -Path "$PersonnelPathRoot\$User"

    # Desactiver l'heritage tout en copiant les autorisations NTFS héritées
    Get-Item "$PersonnelPathRoot\$User" | Disable-NTFSAccessInheritance

    # Ajout des autorisations NTFS
    Add-NTFSAccess -Path "$PersonnelPathRoot\$User"  -Account "$User@exia.local" -AccessRights FullControl
    Add-NTFSAccess -Path "$PersonnelPathRoot\$User"  -Account "GRP_admin@exia.local" -AccessRights FullControl
    
    # Modifier le proprietaire sur le dossier
    Set-NTFSOwner -Path "$PersonnelPathRoot\$User" -Account "$User@exia.local"
    
    # Supprimer des autorisations NTFS
    Remove-NTFSAccess -Path "$PersonnelPathRoot\$User"  -Account "Utilisateurs authentifiés" -AccessRights FullControl
    Remove-NTFSAccess -Path "$PersonnelPathRoot\$User"  -Account "Utilisateurs" -AccessRights FullControl
    Remove-NTFSAccess -Path "$PersonnelPathRoot\$User"  -Account "Système" -AccessRights FullControl
} 
