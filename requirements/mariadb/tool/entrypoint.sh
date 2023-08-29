service mysql start;
sleep 5

mysql -u root -p"${SQL_ROOT_PWD}" -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
mysql -u root -p"${SQL_ROOT_PWD}" -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PWD}';"
mysql -u root -p"${SQL_ROOT_PWD}" -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PWD}';"
mysql -u root -p"${SQL_ROOT_PWD}" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PWD}';"
mysql -u root -p"${SQL_ROOT_PWD}" -e "FLUSH PRIVILEGES;"
mysql -r username 'database_name' -p'password'
mysqladmin -u root -p"${SQL_ROOT_PWD}" shutdown

exec mysqld_safe