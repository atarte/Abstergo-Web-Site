# Projet / Admnistration du Système d'Information

### Equipe : A3 FISE INFO Groupe 4 (Laurianne, Antoine, Joris, Quentin)

Ce git contient l'ensemble des scripts réalisés pour la mise en place du S.I d'Abstergo.

## Dossier ERP

Le dossier [ERP](https://github.com/atarte/Abstergo-Web-Site/tree/main/ERP) contient toutes les procédures et ressources nécessaires à conception du site.

C'est-à-dire :

* un fichier _index.html_ qui contient le code de la page du site ERP

* un fichier _buildDataBase.sh_ qui permet d'arrêter le conteneur en cours et de lancer le conteneur de l'image utilisée pour la base de donnée. Pour l'excuté utilisé la commande `bash buildDataBase.sh` dans votre terminal

* un fichier _buildWebPage.sh_ qui permet d'arrêter le conteneur en cours et de lancer le conteneur de l'image utilisée pour le site ERP. Pour l'excuté utilisé la commande `bash buildWebPage.sh` dans votre terminal

* un dossier [`ressource`](https://github.com/atarte/Abstergo-Web-Site/tree/main/ERP/ressource) contenant 3 sous-dossiers respectivement css, img, js :

    * Le dossier [`css`](https://github.com/atarte/Abstergo-Web-Site/tree/main/ERP/ressource/css) regroupe les feuilles de style de la page web. Nous y avons déposé le fichier _master.css_ qui contient le code permettant de styliser notre page _index.html_

    * Le dossier [`img`](https://github.com/atarte/Abstergo-Web-Site/tree/main/ERP/ressource/img) regroupe les images utilisées dans notre page _index.html_

    * Le dossier [`js`](https://github.com/atarte/Abstergo-Web-Site/tree/main/ERP/ressource/js) regroupe les codes Javascript de la page web. Actuellemnt il contient le fichier _script.js_ permettant de tester notre configuration.

## Dossier Showcase-Website.

Le dossier [Showcase-Website](https://github.com/atarte/Abstergo-Web-Site/tree/main/Showcase-Website) contient toutes les procédures et ressources nécessaires à conception du site Web.

C'est-à-dire :

* un fichier _index.html_ qui contient le code de la page du du site Web

* un fichier _build.sh_ qui permet d'arrêter le conteneur en cours et de lancer le conteneur de l'image utilisée pour le site Web. Pour l'excuter utilisez la commande `bash build.sh` dans votre terminal

* un dossier [`ressource`](https://github.com/atarte/Abstergo-Web-Site/tree/main/Showcase-Website/ressource) contenant 3 sous-dossiers respectivement css, img, js :

    * Le dossier [`css`](https://github.com/atarte/Abstergo-Web-Site/tree/main/Showcase-Website/ressource/css) regroupe les feuilles de style de la page web. Nous y avons déposé le fichier _master.css_ qui contient le code permettant de styliser notre page _index.html_

    * Le dossier [`img`](https://github.com/atarte/Abstergo-Web-Site/tree/main/Showcase-Website/ressource/img) regroupe les images utilisées dans notre page _index.html_

    * Le dossier [`js`](https://github.com/atarte/Abstergo-Web-Site/tree/main/Showcase-Website/ressource/js) regroupe les codes Javascript de la page web. Actuellemnt il contient le fichier _script.js_ permettant de tester notre configuration.

## Dossier Wiki

Le dossier [Wiki](https://github.com/atarte/Abstergo-Web-Site/tree/main/Wiki) contient toutes les procédures et ressources nécessaires à conception du site Wiki.

C'est-à-dire :

* un fichier _index.html_ qui contient le code de la page du du site Web

* un fichier [`build.sh`](https://github.com/atarte/Abstergo-Web-Site/tree/main/Wiki/build.sh) qui permet d'arrêter le conteneur en cours et de lancer le conteneur de l'image utilisée pour le site Web. Pour l'excuté utilisé la commande `bash build.sh` dans votre terminal

* un dossier ressource contenant 3 sous-dossiers respectivement css, img, js :

    * Le dossier [`css`](https://github.com/atarte/Abstergo-Web-Site/tree/main/Wiki/ressource/css) regroupe les feuilles de style de la page web. Nous y avons déposé le fichier _master.css_ qui contient le code permettant de styliser notre page _index.html_

    * Le dossier [`img`](https://github.com/atarte/Abstergo-Web-Site/tree/main/Wiki/ressource/img) regroupe les images utilisées dans notre page _index.html_

    * Le dossier [`js`](https://github.com/atarte/Abstergo-Web-Site/tree/main/Wiki/ressource/js) regroupe les codes Javascript de la page web. Actuellemnt il contient le fichier _script.js_ permettant de tester notre configuration.

## Dossier Script

Le dossier [Script](https://github.com/atarte/Abstergo-Web-Site/tree/main/Script) contient toutes les procédures et ressources nécessaires à la gestion de l'AD.

* [`Create-user-NTFSfile`](https://github.com/atarte/Abstergo-Web-Site/tree/main/Script/Create-user-NTFSfile)

    * _user.csv_ : une base de données avec tous les utilisateurs du domaine

    * _userntfs.ps1_ : un script powershell permettant d'importer ces données dans l'AD et de créer un dossier personnel à chacun d'eux

* [`Group Import`](https://github.com/atarte/Abstergo-Web-Site/tree/main/Script/Group%20Import) :

    * _adgroup.csv_ : une base de données avec tous les groupes du domaine

    * _adgroup.ps1_ : un script powershell permettant d'importer ces données dans l'AD

* [`Menu Powershell`](https://github.com/atarte/Abstergo-Web-Site/tree/main/Scripts/Menu%20Powershell) :

    * _powershell.ps1_ : un script powershell menu permettant d'afficher un menu interactif avec l'AD

* [`Ou Import`](https://github.com/atarte/Abstergo-Web-Site/tree/main/Scripts/Ou%20Import) :

    * _ADou.csv_ : une base de données avec toutes les OU du domaine

    * _ADou.ps1_ : un script powershell permettant d'importer ces données dans l'AD

* [`backup-linux`](https://github.com/atarte/Abstergo-Web-Site/tree/main/Scripts/backup-linux) :

    * _backup.sh_ : un script bash permettant d'effectuer une sauvegarde du serveur Web

* [`Deployment-server`](https://github.com/atarte/Abstergo-Web-Site/tree/main/Scripts/Deployment-server) :

    * _deployment-AD-primaire.ps1_ : un script powershell permettant de déployer le controleur de domaine primaire

    * _deployment-AD-secondaire.ps1_ : un script powershell permettant de déployer le controleur de domaine secondaire

    * _deployment-centreon.sh_ : un script bash permettant de déployer le Centreon

    * _deployment-web.sh_ : un script bash permettant de déployer le serveur Web

* [`folder-creation`](https://github.com/atarte/Abstergo-Web-Site/tree/main/Scripts/folder-creation) :

    * _folder-creation.ps1_ : un script powershell permettant de créer les fichiers partagés de l'AD
