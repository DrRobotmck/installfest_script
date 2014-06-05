echo "${BOLD}Ruby version is now: '`ruby -v`'...${RESET}"
echo "${BOLD}Ruby now found at: `which ruby`...${RESET}"

echo "${BOLD}Setting the global ruby as '${BELOVED_RUBY_VERSION}'...${RESET}"

rbenv global $BELOVED_RUBY_VERSION

echo "${BOLD}Ruby version is now: '`ruby -v`'...${RESET}"
echo "${BOLD}Ruby now found at: `which ruby`...${RESET}"

echo "${BOLD}Adding the rbenv binary directory to path, and prepending the .shims...${RESET}"

# TODO (h4w5) must come to understand this...
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# rbenv rehash # happens at end of eval above I believe (h4w5)

echo "${BOLD}Path is now:${RESET} ${PATH}"
echo "${BOLD}Ruby version is now: '`ruby -v`'...${RESET}"
echo "${BOLD}Ruby now found at: `which ruby`...${RESET}"
echo "${BOLD}Gem environment is now:${RESET}"
gem env
