Write-host "==========================MENU=========================" 
Write-host "Taper [1]- Get-ADUser" 
Write-host "Taper [2]- Get-ADGroup"
Write-host "Taper [3]- Get-ADGroupMember"
Write-host "Taper [4]- Get-ADOrganizationalUnit"
Write-host "Taper [5]- Remove-ADUser"
Write-host "Taper [6]- Remove-ADGroup"
Write-host "=======================================================" 

$Serveur = Read-Host "Choisissez un numero parmi les 4 options"

Switch ($Serveur)
{
    1{$Serveur="Get-ADUser"}
    2{$Serveur="Get-ADGroup"}
    3{$Serveur="Get-ADGroupMember"}
    4{$Serveur="Get-ADOu"}
    5{$Serveur="Remove-ADUser"}
    6{$Serveur="Remove-ADGroup"}
    default{$Serveur = return}
}

If ($Serveur -eq "Get-ADUser")
{

   Write-host "Taper [1]- Recherche par pseudo"
   Write-host "Taper [2]- Obtenir la liste de tous les users"
    $User = Read-Host "Choisissez un numero parmi les 2 propositions"

        Switch ($User)
            {
                1{$User="Pseudo"}
                2{$User="Liste"}
                default{$User = return}
            }
            If ($User -eq "Pseudo")
                {
                    $User = Read-host "Veuillez renseigner le pseudo de l'utilisateur" 
                    #Get-ADUser -Identity $User |out-file -FilePath "c:\User.txt"
                    get-aduser  -Identity $User | Export-Csv c:\user.csv
            }
            else 
            {
                    
                    get-aduser -filter *| Export-Csv "c:\ListeUser.csv"
            }
}


elseif ($Serveur -eq "Get-ADGroup") 
{

    Write-host "Taper [1]- Recherche par Nom"
    Write-host "Taper [2]- Obtenir le SID"
    Write-host "Taper [3]- Obtenir la liste de tous les groupes"
    $Group = Read-Host "Choisissez un numero parmi les 3 propositions"

        Switch ($Group)
            {
                1{$Group="Nom"}
                2{$Group="SID"}
                3{$Group="Liste"}
                default{$Group = return}
            }
            If ($Group -eq "Nom")
                {
                    $Group = Read-host "Nom"
                    Get-ADGroup -Identity $Group| Export-Csv "c:\Groupe.csv"
            }
            elseif ($Group -eq "SID") 
            {
                    $Group = Read-host "Nom"
                    GET-Adgroup -Identity $Group|Select SID | Export-Csv "c:\SID.csv"
            }
             else 
            {
                    
                    get-adgroup -filter *| Export-Csv "c:\ListeGroupe.csv"
            }
}

elseif ($Serveur -eq "Get-ADGroupMember") 
{
    $GroupeMember = Read-host "Groupe"
    Get-ADGroupMember -Identity $GroupeMember | Export-Csv "c:\GroupeMember.csv"
}

elseif ($Serveur -eq "Get-ADOu") 
{

    Write-host "Taper [1]- Trouver une OU"
    Write-host "Taper [2]- Afficher toutes les OU"
    $OU = Read-Host "Choisissez un numero parmi les 2 propositions"

        Switch ($OU)
            {
                1{$OU="Nom"}
                2{$OU="Liste"}
                default{$OU = return}
            }
            If ($OU -eq "Nom")
                {
                    $OU = Read-host "Nom"
                    Get-ADOrganizationalUnit -Identity $OU | Export-Csv "c:\Ou.csv"
            }
            else 
            {
                   
                   Get-ADOrganizationalUnit -Filter 'Name -like "*"' | FT Name, DistinguishedName -A| Export-Csv "c:\ListOU.csv"
            }
}

elseif ($Serveur -eq "Remove-ADUser") 
{
   
    $RemoveUser = Read-host "Pseudo de l'utilisateur à supprimer"
    Remove-ADUser -Identity $RemoveUser 
    Write-host "L'utilisateur a été supprimé"
}

else 
{
   
    $RemoveGroup = Read-host "Groupe à supprimer"
    Remove-ADGroup -Identity $RemoveGroup
    Write-host "Le groupe a été supprimé"
}



