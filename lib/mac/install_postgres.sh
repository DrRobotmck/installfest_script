# Set up Postgres
brew install postgresql

# Install ruby interface for Postgres
# from brew: "When installing the postgres gem, including ARCHFLAGS is recommended:"
ARCHFLAGS="-arch x86_64" gem install pg

# NOTE! https://coderwall.com/p/rjioeg
# Yosemite problems:
# for some reasons yosemite cleaned up some files/directories in /usr/local
# for postgres installed via homebrew the following directories were missing to start postgres properly:
mkdir -p /usr/local/var/postgres/{pg_tblspc,pg_twophase,pg_stat_tmp}
# May also need this.
chmod -R 700 /usr/local/var/postgres
chown -R ${USER} /usr/local/var/postgres

# Create a database
initdb /usr/local/var/postgres -E utf8

# Ensure that Postgres launches whenever we login
mkdir -p ~/Library/LaunchAgents
cp /usr/local/Cellar/postgresql/9.*/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgents/

# Start Postgres now
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# give postgres time to load
sleep 5s

# create db matching user name so we can log in by just typing psql
createdb ${USER}
