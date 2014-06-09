# Set up Postgres

# open source object-relational database management system
brew install postgres

# Create a database
initdb /usr/local/var/postgres -E utf8
createdb ${USER}

# Ensure that Postgres launches whenever we login

# # http://robots.thoughtbot.com/starting-and-stopping-background-services-with-homebrew
# FIXME (phlco) brew way doesn't work
# brew services start postgres
mkdir -p ~/Library/LaunchAgents
cp /usr/local/Cellar/postgresql/9.*/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgents/
# Start Postgres now
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
