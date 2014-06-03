# Uninstall RVM
# http://stackoverflow.com/questions/3950260/howto-uninstall-rvm
if hash rvm 2>/dev/null || [ -d ~/.rvm ]; then
  rvm implode
  rm -rf ~/.rvm
  echo "RVM has been removed."
else
  echo "RVM is not installed. Moving on..."
fi
