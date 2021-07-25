if [ ! -d "/var/lib/mysql/wordpress" ]; then 
    mysql_install_db
    service mysql start
    mysql -e "CREATE USER '${DBASE_LOGIN}'@'localhost' identified by '${DBASE_PSWD}';" &&\
	mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;" &&\
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DBASE_LOGIN}'@'%' IDENTIFIED BY '${DBASE_PSWD}';" &&\
	mysql -e "FLUSH PRIVILEGES;"
    service mysql stop 
fi
mysqld
