
rbenv global $BELOVED_RUBY_VERSION

assert_that "Ruby version is now '${BELOVED_RUBY_VERSION}'" "ruby -v" "${BELOVED_RUBY_VERSION}"
