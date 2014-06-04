# # source ~/.bash_profile
#
# ruby_check=$(rbenv versions | grep $BELOVED_RUBY_VERSION)
#
# if [[ "$ruby_check" == *$BELOVED_RUBY_VERSION* ]]; then
#   echo "$BELOVED_RUBY_VERSION is installed"
# else
#   rbenv install $BELOVED_RUBY_VERSION
# fi
#
# # Set global Ruby
# rbenv global $BELOVED_RUBY_VERSION
#
# # Reload
# # source ~/.bash_profile
#
# # Reload
# rbenv rehash

# Add to path
# export PATH="$HOME/.rbenv/bin:$PATH"
# # enable shims and autocompletion
# eval "$(rbenv init -)"



########################################################
echo "${BOLD}Setting the global ruby as '${BELOVED_RUBY_VERSION}'...${RESET}"

# set rbenv's global ruby install
rbenv global $BELOVED_RUBY_VERSION

# set rbenv's shims to capture all ruby-esque commands (gem, etc.)
rbenv rehash


# echo "RUBY BEFORE SOURCE: `which ruby`"
echo "${BOLD}Adding the rbenv binary directory to path, and prepending the .shims...${RESET}"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

echo "${BOLD}Ruby version is now: '`ruby -v`', found at: `which ruby`...${RESET}"
