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
        apt install mysql-server
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
