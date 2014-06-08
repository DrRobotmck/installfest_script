# Our Ruby version manager
brew install rbenv
# git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

# Add to path
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' > ~/.bash_profile

# enable shims and autocompletion
echo 'eval "$(rbenv init -)"' > ~/.bash_profile

# Automatically runs rbenv rehash every time you install or uninstall a gem.
brew install rbenv-gem-rehash
# git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

# Automatically install gems every time you install a new version of Ruby
brew install rbenv-default-gems
# git clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems

# automatically runs rbenv rehash every time you install or uninstall a gem
brew install rbenv-gem-rehash
# git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

# Provides an `rbenv install` command
brew install ruby-build
# git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

rbenv rehash

source ~/.bash_profile
