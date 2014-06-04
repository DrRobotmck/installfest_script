# our ruby version manager
sudo apt-get -y install rbenv
# git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
# provides an `rbenv install` command
sudo apt-get -y install ruby-build


# Add to path
# export PATH="$HOME/.rbenv/bin:$PATH"
# # enable shims and autocompletion
# eval "$(rbenv init -)"

# add to default bashrc for the moment
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

source ~/.bashrc

ruby_check=$(rbenv versions | grep $BELOVED_RUBY_VERSION)

if [[ "$ruby_check" == *$BELOVED_RUBY_VERSION* ]]; then
  echo "$BELOVED_RUBY_VERSION is installed"
else
  rbenv install $BELOVED_RUBY_VERSION
fi

# Set global Ruby
rbenv global $BELOVED_RUBY_VERSION

# Reload
rbenv rehash
source ~/.bashrc
