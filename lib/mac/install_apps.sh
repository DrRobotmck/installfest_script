# a CLI workflow for the administration of Mac applications
# distributed as binaries
brew tap phinze/homebrew-cask
brew install brew-cask

# The Browser
brew cask install google-chrome

# A Browser
brew cask install firefox

# The Text Editor, Sublime Text 2
brew cask install sublime-text

# The X Window Server
brew cask install xquartz

# # Markdown Editor
# brew cask install mou # NOTE (phlco) we can remove this and just use atom.

# NOTE (phlco) Necessary?
# Flux, makes the color of your computer's display adapt to the time of day
# brew cask install flux

# Alternative Terminal
# brew cask install iterm2

# for fonts
# https://github.com/caskroom/homebrew-fonts/tree/master/Casks
# brew tap caskroom/fonts
#
# brew cask install font-source-code-pro
# brew cask install font-source-sans-pro
# brew cask install font-inconsolata

# Git extensions to provide high-level repository operations
# brew install git-flow

if [[ $os_version == *10.6** ]]; then
  curl -OL https://s3.amazonaws.com/spectacle/downloads/Spectacle+0.7.zip
  install_zip Spectacle+0.7.zip
  curl -OL http://25.io/mou/download/Mou_0.6.6.zip
  install_zip Mou_0.6.6.zip
  echo "Warning! Your OS doesn't support the HipChat desktop application."
  pause_awhile "HipCha is a vital class tool. You must use the web-based client or upgrade your OS."
else
  # Instant search documentation offline
  # requires 10.7 or higher
  brew cask install dash

  # The Chat Client
  # requires 10.7 or higher
  brew cask install hipchat

  # Github's Text Editor
  # requires 10.7 or higher
  brew cask install atom

  # The Window Manager
  brew cask install spectacle
  # allow spectacle to control computer
  # allow_control Spectacle NOTE (phlco) just set up by hand?
fi
