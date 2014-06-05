# Our gems to install
# skip documentation
echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# Maintains a consistent environment for ruby applications.
echo "bundler" >> ~/.rbenv/default-gems

# Acceptance test framework for web applications
echo "capybara" >> ~/.rbenv/default-gems

# handle events on file system modifications
echo "guard" >> ~/.rbenv/default-gems

# JavaScript testing
echo "jasmine" >> ~/.rbenv/default-gems

# ruby interface for Postgres
echo "pg" >> ~/.rbenv/default-gems

# alternative to the standard IRB shell
echo "pry" >> ~/.rbenv/default-gems

# live syntax highlighting for the Pry REPL
echo "pry-coolline" >> ~/.rbenv/default-gems

# full stack, Web application framework
echo "rails" >> ~/.rbenv/default-gems

# testing tool for Ruby
echo "rspec" >> ~/.rbenv/default-gems

# a DSL for quickly creating web applications in Ruby
echo "sinatra" >> ~/.rbenv/default-gems

# common Sinatra extensions
echo "sinatra-contrib" >> ~/.rbenv/default-gems

# Ruby interface to github API v3
echo "github_api" >> ~/.rbenv/default-gems

# HipChat HTTP API Wrapper
echo "hipchat" >> ~/.rbenv/default-gems

# pretty print your Ruby objects with style
echo "awesome_print" >> ~/.rbenv/default-gems

# colorizing printed text on ANSI terminals
echo "rainbow" >> ~/.rbenv/default-gems
