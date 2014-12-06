pause_awhile "downloading the installfest repo"
# download the repo for the absolute paths

if [[ $os_version == *10.6** ]]; then
  # 10.6 doesn't have git so download the zip and rename it installfest
  curl -LO https://github.com/ga-instructors/installfest_script/archive/master.zip
  unzip "master.zip" -d ~/.wdi
  mv ~/.wdi/installfest_script-master/ ~/.wdi/installfest
else
  if [[ ! -d $SRC_DIR ]]; then
    echo 'Downloading Installfest repo...'
    # autoupdate bootstrap file
    git clone -b $BRANCH $INSTALL_REPO $SRC_DIR
  else
    # update repo
    echo 'Updating repo...'
    cd $SRC_DIR
    git pull origin $BRANCH
  fi
fi
