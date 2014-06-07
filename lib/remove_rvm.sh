# uninstall rvm, so that we can use rbenv
# http://stackoverflow.com/questions/3950260/howto-uninstall-rvm
if hash rvm 2>/dev/null || [ -d ~/.rvm ]; then
  yes | rvm implode
  rm -rf ~/.rvm
fi

assert_that "RVM has been removed or was not installed" "command -v rvm" ""
