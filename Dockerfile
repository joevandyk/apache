from ubuntu:16.04

run apt-get update
run apt-get install -y apache2
run apt-get install -y vim

add mod-pagespeed-stable_current_amd64.deb /tmp
run dpkg -i /tmp/mod-pagespeed-stable_current_amd64.deb

# Not related to page speed
env APACHE_RUN_USER www-data
env APACHE_RUN_GROUP www-data
env APACHE_LOG_DIR /var/log/apache2
env APACHE_LOCK_DIR /tmp
env APACHE_PID_FILE /tmp/apache.pid

add default.conf /etc/apache2/sites-enabled/000-default.conf
add html /var/www/html

cmd /usr/sbin/apache2 -DFOREGROUND
