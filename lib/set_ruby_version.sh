# source ~/.bash_profile

ruby_check=$(rbenv versions | grep $BELOVED_RUBY_VERSION)

if [[ "$ruby_check" == *$BELOVED_RUBY_VERSION* ]]; then
  echo "$BELOVED_RUBY_VERSION is installed"
else
  rbenv install $BELOVED_RUBY_VERSION
fi

# Set global Ruby
rbenv global $BELOVED_RUBY_VERSION

# Reload
# source ~/.bash_profile

# Reload
rbenv rehash
