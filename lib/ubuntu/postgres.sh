# open source object-relational database management system
# https://www.digitalocean.com/community/articles/how-to-install-and-use-postgresql-on-ubuntu-12-04
# TODO phlco set up user
# https://help.ubuntu.com/community/PostgreSQL
# sudo apt-get -y install postgresql-xc-client
# sudo apt-get -y install postgresql-client
# sudo apt-get -y install postgresql
# sudo apt-get -y install postgresql-contrib
# sudo apt-get -y install pg_ctl # initialize stop/start posgres
sudo apt-get -y install postgresql
sudo apt-get -y install postgresql-contrib

sudo -u postgres createuser --superuser $USER
sudo -u postgres psql
createdb $USER
