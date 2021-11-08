# Projet/ Admnistration du Système d'Information

### Equipe : A3 FISE INFO Groupe 4 (Laurianne, Antoine, Joris, Quentin)

Ce git contient l'ensemble des scripts réalisés pour la mise en place du S.I d'Abstergo.

### Dossier ERP
Ce dernier contient toutes les procédures et ressources nécessaires à conception du site.
C'est-à-dire : 

* un fichier _index.html_ qui contient le code de la page du site ERP

* un fichier _buildDataBase.sh_ qui permet d'arrêter le conteneur en cours et de lancer le conteneur de l'image utilisée pour la base de donnée.

* un fichier _buildWebPage.sh_ qui permet d'arrêter le conteneur en cours et de lancer le conteneur de l'image utilisée pour le site ERP.

* un dossier _ressource_ contenant 3 sous-dossiers respectivement css, img, js. 

  * Au sein du dossier css nous avons déposé un fichier _master.css_ qui contient le code permettant de styliser notre page _index.html_
Le dossier img quant à lui regroupe les images utilisées dans notre page _index.html_
Enfin le dossier js qui contient le fichier _script.js_ permettant de tester notre configuration.

### Dossier Showcase-Website. 
Ce dernier contient toutes les procédures et ressources nécessaires à conception du site Web.
C'est-à-dire : 

* un fichier index.html qui contient le code de la page du du site Web

* un fichier build.sh qui permet d'arrêter le conteneur en cours et de lancer le conteneur de l'image utilisée pour le site Web.

* un dossier ressource contenant 3 sous-dossiers respectivement css, img, js. 

  * Au sein du dossier css nous avons déposé un fichier master.css qui contient le code permettant de styliser notre page index.html
Le dossier img quant à lui regroupe les images utilisées dans notre page index.html
Enfin le dossier js qui contient le fichier script.js permettant de tester notre configuration.

### Dossier Wiki
Ce dernier contient toutes les procédures et ressources nécessaires à conception du site Wiki.
C'est-à-dire : 

* un fichier README.md contenant les informations sur le dossier Wiki

* un fichier index.html qui contient le code de la page du du site Wiki

* un fichier build.sh qui permet d'arrêter le conteneur en cours et de lancer le conteneur de l'image utilisée pour le site Wiki.

* un dossier ressource contenant 3 sous-dossiers respectivement css, img, js. 

  * Au sein du dossier css nous avons déposé un fichier master.css qui contient le code permettant de styliser notre page index.html
Le dossier img quant à lui regroupe les images utilisées dans notre page index.html
Enfin le dossier js qui contient le fichier script.js permettant de tester notre configuration.

### Dossier Script 

* Create-user-NTFSfile

  * user.csv : une base de données avec tous les utilisateurs du domaine 
  * userntfs.ps1 : un script powershell permettant d'importer ces données dans l'AD et de créer un dossier personnel à chacun d'eux

* Group Import contenant :

  * adgroup.csv : une base de données avec tous les groupes du domaine 
  * adgroup.ps1 : un script powershell permettant d'importer ces données dans l'AD 

* Menu Powershell contenant :

  * powershell.ps1 : un script powershell menu permettant d'afficher un menu interactif avec l'AD

* Ou Import contenant :

  * ADou.csv : une base de données avec toutes les OU du domaine 
  * ADou.ps1 : un script powershell permettant d'importer ces données dans l'AD 

* backup-linux contenant :

  * backup.sh : un script bash permettant d'effectuer une sauvegarde du serveur 

* Deployment-server contenant :

  * deployment-AD-primaire.ps1 : un script powershell permettant de déployer les configurations du serveur primaire
  * deployment-AD-secondaire.ps1 : un script powershell permettant de déployer les configurations du serveur secondaire
  * deployment-centreon.sh : un script bash permettant de déployer les configurations de Centreon
  * deployment-web.sh : un script bash permettant de déployer les configurations relatives au serveur Web

* folder-creation contenant :

  * folder-creation.ps1 : un script powershell permettant de déployer l'AD DS

