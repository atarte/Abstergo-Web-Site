#importer les donnÃ©es
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

       #VÃ©rifiez si le compte utilisateur existe dÃ©jÃ  dans AD
       if (Get-ADUser -F {SamAccountName -eq $Login})
       {
               #Si lâ€™utilisateur existe, Ã©ditez un message dâ€™avertissement
               Write-Warning "L'identifiant $Username existe dÃ©jÃ  dans l'Active Directory."
       }
       else
       {
              #Si un utilisateur nâ€™existe pas, crÃ©ez un nouveau compte utilisateur
          
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


    # CrÃ©er un dossier pour chaque utilisateur du CSV
    New-Item -ItemType Directory -Path "$PersonnelPathRoot\$User"

    # Desactiver l'heritage tout en copiant les autorisations NTFS hÃ©ritÃ©es
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