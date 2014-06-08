# Our Ruby version manager
brew install rbenv
# git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

# Use homebrew's directories instead of rbenv's
echo 'export RBENV_ROOT=/usr/local/var/rbenv' >> ~/.bash_profile
export RBENV_ROOT=/usr/local/var/rbenv

# Add to path
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
export PATH="$HOME/.rbenv/bin:$PATH"

# enable shims and autocompletion
# echo '# added by installfest script' >> ~/.bash_profile
echo 'if which rbenv > /dev/null; then eval "$(rbenv init-)": fi' >> ~/.bash_profile
eval "$(rbenv init -)"

# Automatically runs rbenv rehash every time you install or uninstall a gem.

# -If the `GEM_PATH` environment variable is undefined, rbenv-gem-rehash
# -must first execute the `gem env gempath` command to retrieve RubyGems'
# -default path so that it can can *append* to the path rather than
# -override it. This can take a while—from a few hundred milliseconds on
# -MRI to several seconds on JRuby—so the default path for the current
# -Ruby version is cached to the filesystem the first time it is
# -retrieved.

brew install rbenv-gem-rehash
# git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

# Automatically install gems every time you install a new version of Ruby
brew install rbenv-default-gems
# git clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems

# Provides an `rbenv install` command
## ruby-build is a dependency of rbenv-default-gems, so it gets installed
brew install ruby-build
# git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

rbenv rehash

source ~/.bash_profile
