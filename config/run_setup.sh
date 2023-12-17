export MYSQL_HOST="127.0.0.1"
export MYSQL_ROOT_USER="root"
export MYSQL_ROOT_PASS="root"
export MYSQL_USER="root"
export MYSQL_PASS="root"

sudo mysql -e "create database dvwa;"
sudo mysql -e "create user dvwa@localhost identified by 'p@ssw0rd';"
sudo mysql -e "grant all on dvwa.* to dvwa@localhost;"
sudo mysql -e "flush privileges;"
sudo mysql -e "drop database dvwa;"

curl -X POST -c cookies.txt -d 'username=admin&password=password' http://localhost/login.php -L -o login.body &&\
curl -b cookies.txt -X POST -d 'create_db=Create+%2F+Reset+Database' http://localhost/setup.php -L -o setup.body
