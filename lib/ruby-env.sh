# Our Ruby Environment

ruby_check=$(rbenv versions | grep $BELOVED_RUBY_VERSION)

if [[ "$ruby_check" == *$BELOVED_RUBY_VERSION* ]]; then
  echo "$BELOVED_RUBY_VERSION is installed"
else
  rbenv install "$BELOVED_RUBY_VERSION"
fi

# Set global Ruby
rbenv global $BELOVED_RUBY_VERSION

# Reload
rbenv rehash

gem update --system

gem install bundler --no-document --pre

