#!/bin/bash
# Script de déploiement du serveur web

# Mise a jour de l'outil apt-get -----------------------------------------------
apt-get update

# Configutation l'interface réseau ---------------------------------------------
# Installation de Resolvconf
apt-get install resolvconf

# Configutation de l'interface réseau ens33
iface ens33 inet static
    adress 10.0.2.11
    netmask 255.255.255.0
    gateway 10.0.2.1
    dns-nameserver 10.0.1.11
    dns-nameserver 8.8.8.8
    dns-nameserver 10.96.23.50

# Installation des logiciels ---------------------------------------------------
# Installation de Docker
apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt-get install docker-ce docker-ce-cli containerd.io

# Installation de Git
apt-get install git-all
