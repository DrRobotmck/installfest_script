# Because we're going to use rbenv and homebrew we need to remove RVM and MacPorts
# This script checks for and removes previous installs of macports and RVM

# Uninstall RVM
# http://stackoverflow.com/questions/3950260/howto-uninstall-rvm
if hash rvm 2>/dev/null || [ -d ~/.rvm ]; then
  yes | rvm implode
  rm -rf ~/.rvm
  echo "RVM has been removed."
else
  echo "RVM is not installed. Moving on..."
fi

