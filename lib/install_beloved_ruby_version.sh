ruby_check=$(rbenv versions | grep $BELOVED_RUBY_VERSION)

if [[ "$ruby_check" == *$BELOVED_RUBY_VERSION* ]]; then
  echo "$BELOVED_RUBY_VERSION is installed"
else
  rbenv install $BELOVED_RUBY_VERSION
fi

assert_that "Ruby is installed and links to rbenv" "which ruby" "$HOME/.rbenv/shims/ruby"
