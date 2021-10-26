#importer les données
$ADUsers = "C:\Configuration\adUsersNew.csv"
$CSVData = Import-CSV -Path $ADUsers -Delimiter ";" -Encoding Default

foreach ($User in $CSVData)
{

       
       $Password    = $User.password
       $Firstname   = $User.firstname
       $Lastname    = $User.lastname
       $Login = ($Firstname).Substring(0,1).ToLower()+ $Lastname.ToLower()
       $Email = "$Login@abstergo.fr"
       $OU = $User.ou

       #Vérifiez si le compte utilisateur existe déjà dans AD
       if (Get-ADUser -F {SamAccountName -eq $Login})
       {
               #Si l’utilisateur existe, éditez un message d’avertissement
               Write-Warning "L'identifiant $Username existe déjà dans l'Active Directory."
       }
       else
       {
              #Si un utilisateur n’existe pas, créez un nouveau compte utilisateur
          
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
            
       

       }

       
}