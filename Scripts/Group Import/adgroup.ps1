#importer les données
$ADgroup = "C:\Configuration\adgroup.csv"
$CSVData = Import-CSV -Path $ADgroup -Delimiter ";" -Encoding Default

foreach ($Group in $CSVData)
{

       
       $addGroup = $Group.Group
       $OU = $Group.Ou

       #créez un nouveau groupe
          
       New-ADGroup -Name $addGroup -GroupScope Global -Path $OU

       
}
