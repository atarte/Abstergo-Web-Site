FROM ubuntu

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/web/log/apache2
ENV APACHE_PID_FILE /var/web/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

RUN export DEBIAN_FRONTEND=nointeractive && apt-get update && apt-get -y -q upgrade && apt-get -y -q install apache2

CMD rm /var/www/html/index.html

ADD . /var/www/html

EXPOSE 80 443

CMD ["apache2ctl", "-D", "FOREGROUD"]
