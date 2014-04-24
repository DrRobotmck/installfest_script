# Our Ruby version manager
brew install rbenv

# Automatically runs rbenv rehash every time you install or uninstall a gem.
brew install rbenv-gem-rehash

# Provides an `rbenv install` command
brew install ruby-build

# enable shims and autocompletion
eval "$(rbenv init -)"

# Automatically install gems every time you install a new version of Ruby
brew install rbenv-default-gems

# Add to path
export PATH="$HOME/.rbenv/bin:$PATH"
