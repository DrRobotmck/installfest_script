#-------------------------------------------------------------------------------
# Welcome Prompt
# prints stats on terminal load
#-------------------------------------------------------------------------------

# welcome and unwelcome functions to toggle welcome_prompt are in .bash_prompt
WELCOME_PROMPT=true

welcome_msg() {
  # GA General Assembly Webdevelopment Immersive
  echo ${BG_RED}${WHITE} \
      GA${RESET}${WHITE}${BG_BLACK} \
      General Assembly ${RESET}${BG_YELLOW}${BLACK} \
      Web Development Immersive ${RESET}
  echo "------------------------------------------"
  echo $(git --version)
  if which brew >/dev/null; then
    echo $(brew -v)
  fi
  echo $(ruby -v)
  echo $(psql --version)
  echo $(rails -v)
  echo $(heroku --version)
  echo "------------------------------------------"
  echo "type ${BOLD}unwelcome${RESET} to remove this message"
}

if [[ $WELCOME_PROMPT == true ]]; then welcome_msg; fi
