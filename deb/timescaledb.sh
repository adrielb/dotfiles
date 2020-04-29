# https://docs.timescale.com/latest/getting-started/installation/debian/installation-apt-debian
# `lsb_release -c -s` should return the correct codename of your OS
echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -c -s)-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update

# Add our repository
sudo sh -c "echo 'deb https://packagecloud.io/timescale/timescaledb/debian/ `lsb_release -c -s` main' > /etc/apt/sources.list.d/timescaledb.list"
wget --quiet -O - https://packagecloud.io/timescale/timescaledb/gpgkey | sudo apt-key add -
sudo apt-get update

# Now install appropriate package for PG version
sudo apt-get install timescaledb-postgresql-12


# At a minimum, you will need to update your postgresql.conf file to include
# our library in the parameter shared_preload_libraries
sudo timescaledb-tune


# Restart PostgreSQL instance
sudo service postgresql restart
