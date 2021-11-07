#importer les données
$ADou = "C:\Configuration\ADou.csv"
$CSVData = Import-CSV -Path $ADou -Delimiter ";" -Encoding Default

foreach ($Ou in $CSVData)
{
    $addOU = $Ou.OU
    $Path = $Ou.Path

    #créez une nouvelle OU
    New-ADOrganizationalUnit
    -Name $addOU
    -Path $Path
}
