##Checkpoints to see if you computer is configured properly.

# Original checkpoints script from Peter Lai.

# Students should be able to enter each command and receive the correct output
checkpoints=0

source spec_helper.sh

echo "Running some checks on how our Install went"

is_not_this "brew doctor"           "ready to brew."
is_not_this "ruby -v"               "$BELOVED_RUBY_VERSION"
is_not_this "gem list rails -i"       "true"
# holding off for travis
# is_not_this "ssh -T git@github.com" "successfully authenticated"

# When you type `subl` into your terminal, it opens up Sublime Text
if [ ! -L /usr/local/bin/subl ]; then
  nay "sublime doesn't appear to be symlinked.";
  ((++checkpoints));
fi

# Your root directory contains the following:
# `.gitignore_global`, `.gitconfig`, `.bash_profile`
# You should be able to open each one with `subl ~/FILENAME`
# ie `subl ~/.gitignore_global`
dost_thou_have ~/.bash_profile
dost_thou_have ~/.gitignore_global
dost_thou_have ~/.gitconfig
dost_thou_have ~/Library/Application\ Support/Sublime\ Text\ 2/Installed\ Packages

# Applications
what_news_of "Spectacle"
what_news_of "Sublime Text 2"
what_news_of "HipChat"
what_news_of "Google Chrome"
what_news_of "Firefox"
what_news_of "Mou"
what_news_of "Dash"

# Your ssh keys are set up (see [here](https://help.github.com/articles/generating-ssh-keys) for instructions)

# Sublime Checks
sublime="${HOME}/Library/Application Support/Sublime Text 2/Packages/User"
subl_prefs=$(cat "$sublime/Preferences.sublime-settings")
tab_size="\"tab_size\": 2"
tab_to_space="\"translate_tabs_to_spaces\": true"

if [[ "$subl_prefs" != *$tab_size* ]]; then
  nay "Tab size must be set to 2!"
  ((++checkpoints));
fi

if [[ "$subl_prefs" != *$tab_to_space* ]]; then
  nay "Translate tabs to spaces must be true!"
  ((++checkpoints));
fi

if [ $checkpoints != 0 ]; then
  exit 1;
else
  exit 0;
fi

