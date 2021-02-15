# apache paigaldusskript
#
# kontrollime, mitu korda apache2 korral ok installed
# sõnad on leitud ja vastus salvestame
# muutja sisse
APACHE2=$(dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c 'ok installed')
# kui APACHE2 muutja väärtus võrdub 0-ga
if [ $APACHE2 -eq 0 ]; then
        # siis ok installed ei ole leitud
        # ja väljastame vastava teate ning
        # paigaldame teenuse
        echo "Paigaldame apache"
        apt install apache2 -y
        echo "Apache on paigaldatud"
# Kui APACHE2 muutja väärtus võrdub 1-ga
elif [ $APACHE2 -eq 1 ]; then
          # siis ok installed on leitud 1 kord
          # ja teenus on juba paigaldatud
          echo "apache2 on juba paigaldatud"
          # stardime selle ja näitame staatust
          service apache2 start
          service apache2 status
# lõpetame tingimuslause
fi
# skripti lõpp


# mysql-server paigaldusskript
#
# kontrollime, mitu kord mysql-server korral ok installed
# sõnad on leitud ja vastuse salvestame
# muutja sisse;
MYSQL=$(dpkg-query -W -f='${Status}' mysql-server 2>/dev/null | grep -c 'ok installed')
# kui MYSQL muutja väärtus võrdub 0-ga
if [ $MYSQL -eq 0 ]; then
        # siis ok installed ei ole leitud
        # ja väljastame vastava teate ning
        # paigalda teenus
        echo "Paigaldame mysql ja vajalikud teenused"
        wget htts://dev.mysql.com/get/mysql-apt-config_0.8.15-1_all.deb
        dpkg -i mysql-apt-config*
        apt update
        apt install mysql-server -y
        rm -R mysql-apt-config*
        echo "mysql on paigaldatud"
        # lisame võimaluse kasutada mysql käsk ilma kasutajat ja parooli liitmata
        touch $HOME/.my.cnf # lisame vajaliku konfikuratsiooni faili antud kasutaja kodukasuta
        echo "[client]" >> $HOME/.my.cnf
        echo "host = localhost" >> $HOME/.my.cnf
        echo "user = root" >> $HOME/.my.cnf
        echo "password = qwerty" >> $HOME/.my.cnf
# kui MYSQL muutja väärtus võrdub 1-ga
elif [ $MYSQL -eq 1 ]; then
          # siis ok installed on leitud 1 kord
          # ja teenus on juba paigaldatud
          echo "mysql-server on juba paigladatud"
          # kontrollime olemasolu
          mysql
# lõpetame tingimuslause
fi
# skripti lõpp

# php paigaldusskript
#
# kontrollime, mitu korda php7.0 korral ok installed
# sõnad on leitud ja vastuse salvestame
# muutja sisse:
PHP=$(dpkg-query -W -f='$(Status)' php7.0 2>/dev/null | grep -c 'ok installed')
# kui PHP muutja väärtus võrdub 0-ga
if [ $PHP -eq 0 ]; then
        # siis ok installed ei ole leitud
        # ja väljastame vastava teate ning
        # paigaldame teenuse
        echo "Paigaldame php ja vajalikud lisad"
        apt install php7.0 libapache2-mod-php7.0 php7.0-mysql -y
        echo "php on paigaldatud"
# kui PHP muutja  väärtus võrduv 1-ga
elif [ $PHP -eq 1]; then
          # siis ok installed on leitud 1 kord
          # ja teenused on juba paigaldatud
          echo "php on juba paigaldatud"
          # kontrollime olemasolu
          which php
# lõpetame tingimuslause
fi
#skripti lõpp




