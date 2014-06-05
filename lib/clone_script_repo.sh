# download the repo for the absolute paths
if [[ ! -d $SRC_DIR ]]; then
  echo 'Downloading Installfest repo...'
  # autoupdate bootstrap file
  git clone -b $BRANCH $INSTALL_REPO $SRC_DIR
  # hide folder
  # chflags hidden $SRC_DIR # FIXME (h4w5) doesn't work on linux
else
  # update repo
  echo 'Updating repo...'
  cd $SRC_DIR
  git pull origin $BRANCH
fi
