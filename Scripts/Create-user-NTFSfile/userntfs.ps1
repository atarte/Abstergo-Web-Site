#importer les données
$ADUsers = "C:\employes\user.csv"
$CSVData = Import-CSV -Path $ADUsers -Delimiter ";" -Encoding Default

foreach ($User in $CSVData)
{
    $Password    = $User.password
    $Firstname   = $User.firstname
    $Lastname    = $User.lastname
    $Login = ($Firstname).Substring(0,1).ToLower()+ $Lastname.ToLower()
    $Email = "$Login@abstergo.fr"
    $OU = $User.ou

    #Vérifiez si le compte utilisateur existe déjà  dans AD
    if (Get-ADUser -F {SamAccountName -eq $Login})
    {
        #Si l'utilisateur existe, éditez un message d'avertissement
        Write-Warning "L'identifiant $Username existe déjà  dans l'Active Directory."
    }
    else
    {
        #Si un utilisateur n'existe pas, créez un nouveau compte utilisateur
        New-ADUser `
        -SamAccountName $Login `
        -UserPrincipalName "$Username@exia.local" `
        -Name "$Firstname $Lastname" `
        -GivenName $Firstname `
        -Surname $Lastname `
        -DisplayName "$Lastname, $Firstname" `
        -EmailAddress $Email `
        -Path $OU `
        -AccountPassword (convertTo-SecureString $Password -AsPlainText -Force) `
        -ChangePasswordAtLogon $True `
        -Enabled $True `

        $User = $Login
        $PersonnelPathRoot = "C:\Perso"

        # Créer un dossier pour chaque utilisateur du CSV
        New-Item -ItemType Directory -Path "$PersonnelPathRoot\$User"

        # Desactiver l'heritage tout en copiant les autorisations NTFS héritées
        Get-Item "$PersonnelPathRoot\$User" | Disable-NTFSAccessInheritance

        # Ajout des autorisations NTFS
        Add-NTFSAccess -Path "$PersonnelPathRoot\$User"  -Account "$User@exia.local" -AccessRights FullControl
        Add-NTFSAccess -Path "$PersonnelPathRoot\$User"  -Account "GRP_admln@exia.local" -AccessRights FullControl

        # Modifier le proprietaire sur le dossier
        Set-NTFSOwner -Path "$PersonnelPathRoot\$User" -Account "$User@exia.local"

        # Supprimer des autorisations NTFS
        Remove-NTFSAccess -Path "$PersonnelPathRoot\$User"  -Account "Utilisateurs authentifiés" -AccessRights FullControl
        Remove-NTFSAccess -Path "$PersonnelPathRoot\$User"  -Account "Utilisateurs" -AccessRights FullControl
        Remove-NTFSAccess -Path "$PersonnelPathRoot\$User"  -Account "Système" -AccessRights FullControl
    }
}
