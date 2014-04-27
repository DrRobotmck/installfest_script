aye () {
  msg=$1
  GREEN=$(tput setaf 2)
  RESET=$(tput sgr0)
  echo "${GREEN}$msg${RESET}"
}

nay () {
  msg=$1
  RED=$(tput setaf 1)
  RESET=$(tput sgr0)
  echo "${RED}$msg${RESET}"
  ((++checkpoints));
}

# Instruments of Darkness
what_news_of () {
  app_name=$1
  echo -n "What news of $app_name? "
  # This could also work
  # if ls /path/to/your/files* &> /dev/null;
  # add support for Application folder or brew cask
  if [ -x /Applications/"$app_name".app ] || [ -x /opt/homebrew-cask/Caskroom/*/*/"$app_name".app ]; then
    aye "Good"
  else
    nay "Alack!"
    ((++checkpoints));
  fi
}

dost_thou_have () {
  filename=$1
  # That which thou seeks is thine
  if [ -e "$filename" ]; then
    aye "Good on $filename"
  else
    nay "Thou searchest in vain for $filename"
    ((++checkpoints));
  fi
}

is_not_this () {
  cmd=$($1)
  pass=$2
  if [[ $cmd == *"$pass"* ]]; then
    aye "$1 is $pass"
  else
    nay "Alack! $1 is not $pass"
    ((++checkpoints));
  fi
}
