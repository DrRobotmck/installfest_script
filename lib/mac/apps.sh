# a CLI workflow for the administration of Mac applications
# distributed as binaries
brew tap phinze/homebrew-cask
brew install brew-cask

# Instant search documentation offline
brew cask install dash

# The Browser
brew cask install google-chrome

# A Browser
brew cask install firefox

# The Chat Client
brew cask install hipchat

# The Window Manager
brew cask install spectacle
# allow spectacle to control computer
allow_control Spectacle

# The Text Editor, Sublime Text 2
brew cask install sublime-text

# The X Window Server
brew cask install xquartz

# Markdown Editor
brew cask install mou

# makes the color of your computer's display adapt to the time of day
brew cask install flux

# for fonts
# https://github.com/caskroom/homebrew-fonts/tree/master/Casks
brew tap caskroom/fonts

brew cask install font-source-code-pro
brew cask install font-source-sans-pro
brew cask install font-consolas

