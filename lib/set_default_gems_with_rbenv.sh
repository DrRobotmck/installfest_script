# Our gems to install
# skip documentation
echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# TODO (phlco) replace ~/.rbenv with $RBENV_ROOT
touch ~/.rbenv/default-gems

gemlist=(
  bundler         # Maintains a consistent environment for ruby applications.
  capybara        # Acceptance test framework for web applications
  guard           # handle events on file system modifications
  jasmine         # JavaScript testing
  pry             # alternative to the standard IRB shell
  pry-coolline    # live syntax highlighting for the Pry REPL
  rails           # full stack, Web application framework
  rspec           # testing tool for Ruby
  sinatra         # a DSL for quickly creating web applications in Ruby
  sinatra-contrib # common Sinatra extensions
  github_api      # Ruby interface to github API v3
  hipchat         # HipChat HTTP API Wrapper
  awesome_print   # pretty print your Ruby objects with style
  rainbow         # colorizing printed text on ANSI terminals
)

for gem in ${gemlist[@]}; do
  echo "${gem}" >> ~/.rbenv/default-gems
done
