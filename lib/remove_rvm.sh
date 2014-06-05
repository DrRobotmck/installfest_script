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

# # http://blog.coolaj86.com/articles/installing-ruby-on-ubuntu-12-04.html
# sudo apt-get remove --purge ruby-rvm ruby
# sudo rm -rf /usr/share/ruby-rvm /etc/rmvrc /etc/profile.d/rvm.sh
#
# # See if there is anything
# ls -d ~/.rvm*
# ls -d ~/.gem*
# ls -d ~/.bundle*
# # Delete them (ignoring those that don't exist)
# rm -rf ~/.rvm* ~/.gem/ ~/.bundle*
