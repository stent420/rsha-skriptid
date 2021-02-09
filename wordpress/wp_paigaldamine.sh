# Wordpress paigaldus skript
# Installida apt-get install-iga sellised paketid:
apt-get install libapache2-mod-php5
apt-get install apache2 mysql-client mysql-server php7.0 php7.0-mysql php7.0-curl php7.0-gd
# Mysql ülesseadmine root_ina:
# Sisene MySQL serverisse, kasutades parooli, mis MySQL serveri installimisel panid.
mysql --user="root" --password="qwerty" --execute="CREATE DATABASE wpdatabase; CREATE USER wpuser@localhost IDENTIFIED BY 'qwerty'; GRANT ALL PRIVILEGES ON wpdatabase.* to wpuser@localhost; FLUSH PRIVILEGES; EXIT"
# Restart Apache2 ja MySQL.
service apache2 restart
service mysql restart
# Vaheta kaust /tmp-ks, et installida Wordpress.
cd /tmp
# Kui unzip puudub, siis see enne installida.
apt-get install unzip
# Wordpressi installimine.
wget -c http://wordpress.org/latest.zip
unzip -q latest.zip -d /var/www/html
# Õiguste andmine
chown -R 755 /var/www/html/wordpress
chmod -R 775 /var/www/html/wordpress
# Wordpressi kausta loomine ja õiguste andmine.
mkdir -p /var/www/html/wordpress/wpcontent/uploads
chown -R www-data:www-data /var/www/html/wordpress/wpcontent/uploads
# Mine Wordpressi kausta.
cd /var/www/html/wordpress
# Pane oma tehtud database-i detailid nanoga config faili.
cp wp-config-sample.php wp-config.php
nano wp-config.php
# kirjutame selle sinna sisse

 sed -i “s/database_name_here/wpdatabase/g” wp-config.php
 sed -i “s/username_here/wpuser/g” wp-config.php
 sed -i “s/password_here/qwerty/g” wp-config.php
# Skripti lõpp
