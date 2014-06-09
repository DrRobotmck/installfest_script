# Installs Homebrew, our package manager
# http://brew.sh/

$(which -s brew)
if [[ $? != 0 ]]; then
  echo 'Installing Homebrew...'
  # piping echo to simulate hitting return in the brew install script
  echo | ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"
fi

# Make sure we're using the latest Homebrew
brew update

