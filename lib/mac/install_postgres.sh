# Set up Postgres
brew install postgresql

# Install ruby interface for Postgres
gem install pg

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
