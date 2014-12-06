# Installs Homebrew, our package manager
# http://brew.sh/

$(which -s brew)
if [[ $? != 0 ]]; then
  echo 'Installing Homebrew...'
  # piping echo to simulate hitting return in the brew install script
  echo | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we're using the latest Homebrew
brew update

