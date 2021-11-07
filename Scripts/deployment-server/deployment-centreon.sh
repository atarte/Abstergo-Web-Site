#!/bin/bash
# Script de déploiement de l'outil de monitoring Centreon

# Mise a jour de l'outil apt-get -----------------------------------------------
yum update

# Configutation l'interface réseau ---------------------------------------------
# POur faire la config du réseau il faut passer par nmtui

# Partitionning du Centreon ----------------------------------------------------
timedatectl set-timezone Europe/Paris
systemctl restart rh-php73-php-fpm
hostnamectl set-hostname centreon-central
su - centreon
/opt/rh/re-php73/root/bin/php /usr/share/centreon/cron/centreon-partitionning.php
exit
systemctl restart cbd centengine gorgoned

# Creation des Users -----------------------------------------------------------
centreon -u admin -p centreon -o CONTACT -a add -v "atarte;Antoine Tarte;tarte.antoine@gmail.com;HJ75cz86;1;1;en_US;local"
centreon -u admin -p centreon -o contact -a setParam -v "atarte;enable_notifications;1"
centreon -u admin -p centreon -o contact -a setParam -v "atarte;hostnotifopt;d,u"
centreon -u admin -p centreon -o contact -a setParam -v "atarte;servicenotifopt;w,u,c"
centreon -u admin -p centreon -o contact -a setParam -v "atarte;hostnotifcmd;host-notify-by-email"
centreon -u admin -p centreon -o contact -a setParam -v "atarte;hostnotifperiod;24x7"
centreon -u admin -p centreon -o contact -a setParam -v "atarte;svcnotifcmd;service-notify-by-email"
centreon -u admin -p centreon -o contact -a setParam -v "atarte;svcnotifperiod;24x7"

# Creation des groupes Hosts ---------------------------------------------------
centreon -u admin -p centreon -o HG -a add -v "grp-windows;Group Windows"
centreon -u admin -p centreon -o HG -a add -v "grp-server-windows;Group server Windows"
centreon -u admin -p centreon -o HG -a add -v "grp-client-windows;Group client Windows"
centreon -u admin -p centreon -o HG -a add -v "grp-linux;Group Linux"
centreon -u admin -p centreon -o HG -a add -v "grp-server-linux;Group server Linux"
centreon -u admin -p centreon -o HG -a add -v "grp-client-linux;Group client Linux"

# Creation des Hosts -----------------------------------------------------------
# Fonction pour set tous les parametres
SetParamHost() {
    centreon -u admin -p centreon -o HOST -a setparam -v "$1;snmp_community;public"
    centreon -u admin -p centreon -o HOST -a setparam -v "$1;snmp_version;2c"
    centreon -u admin -p centreon -o HOST -a setparam -v "$1;check_period;24x7"
    centreon -u admin -p centreon -o HOST -a setparam -v "$1;max_check_attempts;3"
    centreon -u admin -p centreon -o HOST -a setparam -v "$1;check_interval;1"
    centreon -u admin -p centreon -o HOST -a setparam -v "$1;notifications_enabled:yes"
    centreon -u admin -p centreon -o HOST -a setparam -v "$1;notification_interval;10"
    centreon -u admin -p centreon -o HOST -a setparam -v "$1;notification_period;24x7"
    centreon -u admin -p centreon -o HOST -a setparam -v "$1;host_notification_options;d**u**r**f**s"
}

# Creation de l'host Client
centreon -u admin -p centreon -o HOST -a ADD -v "CLT;Windows CLT;CLT.exia.local;generic-active-host**OS-Windows-SNMP;central;grp-windows**grp-client-windows"
SetParamHost "CLT"

# Creation de l'host de l'AD primaire
centreon -u admin -p centreon -o HOST -a ADD -v "DC0;Windows DC0;10.0.1.11;generic-active-host**OS-Windows-SNMP;central;grp-windows**grp-server-windows"
SetParamHost "DC0"

# Creation de l'host de l'AD secondaire
centreon -u admin -p centreon -o HOST -a ADD -v "DC1;Windows DC1;10.0.1.12;generic-active-host**OS-Windows-SNMP;central;grp-windows**grp-server-windows"
SetParamHost "DC1"

# Creation de l'host dur serveur WEB
centreon -u admin -p centreon -o HOST -a ADD -v "WEB;Linux WEB;10.0.2.11;generic-active-host**OS-Linux-SNMP;central;grp-linux**grp-server-linux"
SetParamHost "WEB"

# Creation de l'host du firewall
centreon -u admin -p centreon -o HOST -a ADD -v "PFSense;Linux PFSense;10.0.1.1;generic-active-host**OS-Linux-SNMP;central;grp-linux**grp-client-linux"
SetParamHost "PFSense"

# Creation des services --------------------------------------------------------
SetParamService() {
    centreon -u admin -p centreon -o SERVICE -a setparam -v "$1;$2;check_period;24x7"
    centreon -u admin -p centreon -o SERVICE -a setparam -v "$1;$2;max_check_attempts;3"
    centreon -u admin -p centreon -o SERVICE -a setparam -v "$1;$2;check_interval;1"
    centreon -u admin -p centreon -o SERVICE -a setparam -v "$1;$2;notifications_enabled:yes"
    centreon -u admin -p centreon -o SERVICE -a setparam -v "$1;$2;notification_interval;10"
    centreon -u admin -p centreon -o SERVICE -a setparam -v "$1;$2;notification_period;24x7"
    centreon -u admin -p centreon -o SERVICE -a setparam -v "$1;$2;host_notification_options;w,u,c,r,f,s"
}

# Service windows uptime
centreon -u admin -p centreon -o SG -a ADD -v "grp-windows;windows-uptime;OS-Windows-Uptime-SNMP"
SetParamService "grp-windows" "windows-uptime"

# Service windows cpu
centreon -u admin -p centreon -o SG -a ADD -v "grp-windows-client**grp-windows-server;windows-cpu;OS-Windows-Cpu-SNMP"
SetParamService "grp-windows-client**grp-windows-server" "windows-memory"

# Service windows memory
centreon -u admin -p centreon -o SG -a ADD -v "grp-windows-server;windows-memory;OS-Windows-SNMP-Memory"
SetParamService "grp-windows-server" "windows-memory"

# Service Linux uptime
centreon -u admin -p centreon -o SG -a ADD -v "grp-linux;linux-uptime;OS-Linux-Uptime-SNMP"
SetParamService "grp-linux" "linux-uptime"

# Service linux cpu
centreon -u admin -p centreon -o SG -a ADD -v "grp-linux-client**grp-linux-server;linux-cpu;OS-Windows-Cpu-SNMP"
SetParamService "grp-linux-client**grp-linux-server" "linux-memory"

# Service linux memory
centreon -u admin -p centreon -o SG -a ADD -v "grp-linux-server;linux-memory;OS-Windows-SNMP-Memory"
SetParamService "grp-linux-server" "linux-memory"

# Configutation des notifications par mail -------------------------------------
# Installation de Postfix
yum install postfix mailx cyrus-sasl-plain -y

# Creation du fichier de mot de passe
echo "[smtp.gmail.com]:587    tarte.antoine@gmail.com:MotdePasse" > /etc/postfix/sasl_passwd
chmod 400 /etc/postfix/sasl_passwd

# Modification du fichier de config
echo "relayhost = [smtp.gmail.com]:587" > /etc/postfix/main.cf
echo "smtp_sasl_auth_enable = yes" > /etc/postfix/main.cf
echo "smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd" > /etc/postfix/main.cf
echo "smtp_sasl_security_options = noanonymous" > /etc/postfix/main.cf
echo "smtp_tls_security_level = secure" > /etc/postfix/main.cf
echo "smtp_tls_mandatory_protocols = TLSv1" > /etc/postfix/main.cf
echo "smtp_tls_mandatory_ciphers = high" > /etc/postfix/main.cf
echo "smtp_tls_secure_cert_match = nexthop" > /etc/postfix/main.cf
echo "smtp_tls_CAfile = /etc/pki/tls/certs/ca-bundle.crt" > /etc/postfix/main.cf

# Relancement du service
postmap /etc/postfix/sasl_passwd
service postfix restart

# Export de la configutation ---------------------------------------------------
centreon -u admin -p centreon -a APPLYCFG -v "Central"
