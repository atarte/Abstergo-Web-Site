#importer les données
$ADgroup = "C:\Configuration\adgroup.csv"
$CSVData = Import-CSV -Path $ADgroup -Delimiter ";" -Encoding Default

foreach ($Group in $CSVData)
{

       
       $Group = $Group.name
       $OU = $Group.ou

       #créez un nouveau groupe
          
       New-ADGroup 
		-Name $Group 
		-GroupScope Global 
		-Path $OU

       
}