# moving to dramatis personae
# SRC_DIR=~/.wdi-installfest
# SCRIPTS=$SRC_DIR/scripts
# SETTINGS=$SRC_DIR/settings
# INSTALL_REPO=https://github.com/ga-instructors/installfest_script.git

# download the repo for the absolute paths
if [[ ! -d $SRC_DIR ]]; then
  echo 'Downloading Installfest repo...'
  # autoupdate bootstrap file
  git clone $INSTALL_REPO $SRC_DIR
  # hide folder
  chflags hidden $SRC_DIR
else
  # update repo
  echo 'Updating repo...'
  cd $SRC_DIR
  git pull origin $branch
fi

# fin
