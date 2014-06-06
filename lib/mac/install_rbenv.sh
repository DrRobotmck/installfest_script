# Our Ruby version manager
# brew install rbenv
 git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

# Automatically runs rbenv rehash every time you install or uninstall a gem.
# brew install rbenv-gem-rehash
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

# Provides an `rbenv install` command
# brew install ruby-build
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# Add to path
export PATH="$HOME/.rbenv/bin:$PATH"

# enable shims and autocompletion
eval "$(rbenv init -)"

# Automatically install gems every time you install a new version of Ruby
# brew install rbenv-default-gems
git clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems
