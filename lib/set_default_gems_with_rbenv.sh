# Our gems to install
# skip documentation
echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# TODO (phlco) move these to a default gem file that gets copied over

touch $RBENV_ROOT/default-gems

# Maintains a consistent environment for ruby applications.
echo "bundler" >> $RBENV_ROOT/default-gems

# Acceptance test framework for web applications
echo "capybara" >> $RBENV_ROOT/default-gems

# handle events on file system modifications
echo "guard" >> $RBENV_ROOT/default-gems

# JavaScript testing
echo "jasmine" >> $RBENV_ROOT/default-gems

# ruby interface for Postgres
echo "pg" >> $RBENV_ROOT/default-gems

# alternative to the standard IRB shell
echo "pry" >> $RBENV_ROOT/default-gems

# live syntax highlighting for the Pry REPL
echo "pry-coolline" >> $RBENV_ROOT/default-gems

# full stack, Web application framework
echo "rails" >> $RBENV_ROOT/default-gems

# testing tool for Ruby
echo "rspec" >> $RBENV_ROOT/default-gems

# a DSL for quickly creating web applications in Ruby
echo "sinatra" >> $RBENV_ROOT/default-gems

# common Sinatra extensions
echo "sinatra-contrib" >> $RBENV_ROOT/default-gems

# Ruby interface to github API v3
echo "github_api" >> $RBENV_ROOT/default-gems

# HipChat HTTP API Wrapper
echo "hipchat" >> $RBENV_ROOT/default-gems

# pretty print your Ruby objects with style
echo "awesome_print" >> $RBENV_ROOT/default-gems

# colorizing printed text on ANSI terminals
echo "rainbow" >> $RBENV_ROOT/default-gems
