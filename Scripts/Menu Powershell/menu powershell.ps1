Write-host "Taper [1]- Get-ADUser"
Write-host "Taper [2]- Get-ADGroup"
Write-host "Taper [3]- Get-ADGroupMember"
Write-host "Taper [4]- Get-ADOrganizationalUnit"


$Serveur = Read-Host "Choisissez un numero parmi les 4 options"

Switch ($Serveur)
{
    1{$Serveur="Get-ADUser"}
    2{$Serveur="Get-ADGroup"}
    3{$Serveur="Get-ADGroupMember"}
    4{$Serveur="Get-ADOu"}
    default{$Serveur = return}
}

If ($Serveur -eq "Get-ADUser")
{
   $User = Read-host "Veuillez renseigner le pseudo de l'utilisateur"
   Get-ADUser -Identity $User |out-file -FilePath "c:\User.txt"
}


elseif ($Serveur -eq "Get-ADGroup") 
{
    #$Groupe = Read-host "Groupe : "
    #Get-ADGroup -Identity $Groupe |out-file -FilePath "c:\Groupe.txt"
    Write-host "Taper [1]- Recherche par Nom"
    Write-host "Taper [2]- Obtenir le SID"
    $Group = Read-Host "Choisissez un numero parmi les 2 propositions"

        Switch ($Group)
            {
                1{$Group="Nom"}
                2{$Group="SID"}
                default{$Group = return}
            }
            If ($Group -eq "Nom")
                {
                    $Group = Read-host "Nom"
                    Get-ADGroup -Identity $Group|out-file -FilePath "c:\Groupe.txt"
            }
            else 
            {
                    $Group = Read-host "Nom"
                    GET-Adgroup -Identity $Group|Select SID |out-file -FilePath "c:\SID.txt"
            }
}

elseif ($Serveur -eq "Get-ADGroupMember") 
{
    $GroupeMember = Read-host "Groupe"
    Get-ADGroupMember -Identity $GroupeMember |out-file -FilePath "c:\GroupeMember.txt"
}

else 
{
   # $OU = Read-host "unite d organisation : "
   # Get-ADOrganizationalUnit -Identity $OU |out-file -FilePath "c:\Ou.txt"
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
                    Get-ADOrganizationalUnit -Identity $OU |out-file -FilePath "c:\Ou.txt"
            }
            else 
            {
                   
                   Get-ADOrganizationalUnit -Filter 'Name -like "*"' | FT Name, DistinguishedName -A|out-file -FilePath "c:\ListOU.txt"
            }
}

