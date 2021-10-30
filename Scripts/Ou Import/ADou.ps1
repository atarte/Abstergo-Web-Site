#importer les données
$ADou = "C:\Configuration\ADou.csv"
$CSVData = Import-CSV -Path $ADou -Delimiter ";" -Encoding Default

foreach ($Ou in $CSVData)
{

       $OU = $Ou.name
       $Path = $Ou.path

       #créez une nouvelle OU
          
       New-ADOrganizationalUnit 
		-Name $OU 
		-Path $Path

       
}