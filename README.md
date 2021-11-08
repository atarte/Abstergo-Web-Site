Projet/ Admnistration du Système d'Information

Equipe : A3 FISE INFO Groupe 4 (Laurianne, Antoine, Joris, Quentin)

Ce git contient l'ensemble des scripts réalisés pour la mise en place du S.I d'Abstergo.

Tout d'abord vous trouverez le dossier ERP. Ce dernier contient toutes les procédures et ressources nécessaires à conception du site.
C'est-à-dire : 

-un fichier index.html qui contient le code de la page du site ERP

-un fichier buildDataBase.sh qui permet d'arrêter le conteneur en cours et de lancer le conteneur de l'image utilisée pour la base de donnée.

-un fichier buildWebPage.sh qui permet d'arrêter le conteneur en cours et de lancer le conteneur de l'image utilisée pour le site ERP.

-un dossier ressource contenant 3 sous-dossiers respectivement css, img, js. 

Au sein du dossier css nous avons déposé un fichier master.css qui contient le code permettant de styliser notre page index.html
Le dossier img quant à lui regroupe les images utilisées dans notre page index.html
Enfin le dossier js qui contient le fichier script.js permettant de tester notre configuration.

Ensuite vous trouverez le dossier Showcase-Website. Ce dernier contient toutes les procédures et ressources nécessaires à conception du site Web.
C'est-à-dire : 

-un fichier index.html qui contient le code de la page du du site Web

-un fichier build.sh qui permet d'arrêter le conteneur en cours et de lancer le conteneur de l'image utilisée pour le site Web.

-un dossier ressource contenant 3 sous-dossiers respectivement css, img, js. 

Au sein du dossier css nous avons déposé un fichier master.css qui contient le code permettant de styliser notre page index.html
Le dossier img quant à lui regroupe les images utilisées dans notre page index.html
Enfin le dossier js qui contient le fichier script.js permettant de tester notre configuration.

Puis vous trouverez le dossier Wiki. Ce dernier contient toutes les procédures et ressources nécessaires à conception du site Wiki.
C'est-à-dire : 

-un fichier README.md contenant les informations sur le dossier Wiki

-un fichier index.html qui contient le code de la page du du site Wiki

-un fichier build.sh qui permet d'arrêter le conteneur en cours et de lancer le conteneur de l'image utilisée pour le site Wiki.

-un dossier ressource contenant 3 sous-dossiers respectivement css, img, js. 

Au sein du dossier css nous avons déposé un fichier master.css qui contient le code permettant de styliser notre page index.html
Le dossier img quant à lui regroupe les images utilisées dans notre page index.html
Enfin le dossier js qui contient le fichier script.js permettant de tester notre configuration.

Enfin, vous retrouverez dans le dossier Script :

Create-user-NTFSfile contenant :

-une base de données avec tous les utilisateurs du domaine : user.csv
-un script powershell userntfs.ps1 permettant d'importer ces données dans l'AD et de créer un dossier personnel à chacun d'eux

Group Import contenant :

-une base de données avec tous les groupes du domaine : adgroup.csv
-un script powershell permettant d'importer ces données dans l'AD adgroup.ps1

Menu Powershell contenant :

-un script powershell menu powershell.ps1 permettant d'afficher un menu interactif avec l'AD

Ou Import contenant :

-une base de données avec toutes les OU du domaine : ADou.csv
-un script powershell permettant d'importer ces données dans l'AD ADou.ps1

backup-linux contenant :

-un script bash backup.sh permettant d'effectuer une sauvegarde du serveur 

Deployment-server contenant :

-un script powershell deployment-AD-primaire.ps1 permettant de déployer les configurations du serveur primaire
-un script powershell deployment-AD-secondaire.ps1 permettant de déployer les configurations du serveur secondaire
-un script bash deployment-centreon.sh permettant de déployer les configurations de Centreon
-un script bash deployment-web.sh permettant de déployer les configurations relatives au serveur Web

folder-creation contenant :

-un script powershell folder-creation.ps1 permettant de déployer l'AD DS

