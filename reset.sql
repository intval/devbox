UPDATE mysql.user SET Password=PASSWORD('123456') WHERE User='root';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '123456' WITH GRANT OPTION;
FLUSH PRIVILEGES;
