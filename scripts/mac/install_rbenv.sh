# Our Ruby version manager
# brew install rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

# Use homebrew's directories instead of rbenv's
# echo 'export RBENV_ROOT=/usr/local/var/rbenv' >> ~/.bash_profile
# export RBENV_ROOT="/usr/local/var/rbenv"

# Add to bash_profile
echo '# added by installfest script' >> ~/.bash_profile
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile

# enable shims and autocompletion
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# brew install rbenv-gem-rehash
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

# Automatically install gems every time you install a new version of Ruby
# brew install rbenv-default-gems
git clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems

# # Provides an `rbenv install` command
# # ruby-build is a dependency of rbenv-default-gems, so it gets installed
# brew install ruby-build
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# rbenv rehash
# source ~/.bash_profile
