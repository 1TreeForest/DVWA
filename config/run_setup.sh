export MYSQL_HOST="127.0.0.1"
export MYSQL_ROOT_USER="root"
export MYSQL_ROOT_PASS="root"
export MYSQL_USER="root"
export MYSQL_PASS="root"

mysql -e "create database dvwa;"
mysql -e "create user dvwa@localhost identified by 'p@ssw0rd';"
mysql -e "grant all on dvwa.* to dvwa@localhost;"
mysql -e "flush privileges;"
mysql -e "drop database dvwa;"

cd /tmp &&\
curl -X POST -c cookies.txt -d 'username=admin&password=password' http://localhost/login.php -L -o login.body &&\
curl -b cookies.txt -X POST -d 'create_db=Create+%2F+Reset+Database' http://localhost/setup.php -L -o setup.body
