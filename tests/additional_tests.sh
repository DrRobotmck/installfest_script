# TODO (phlco): can't seem to run these on travis

# holding off for travis
# is_not_this "ssh -T git@github.com" "successfully authenticated"

# dost_thou_have "${HOME}/.gitignore_global"
# dost_thou_have "${HOME}/Library/Application\ Support/Sublime\ Text\ 2/Installed\ Packages"

# Sublime Checks
# sublime="${HOME}/Library/Application\ Support/Sublime\ Text\ 2/Packages/User"
# subl_prefs=$(cat "$sublime/Preferences.sublime-settings")
# tab_size='"tab_size": 2'
# tab_to_space='"translate_tabs_to_spaces": true'

# if [[ "$subl_prefs" != *$tab_size* ]]; then
#   nay "Tab size must be set to 2!"
#   ((++checkpoints));
# fi

# if [[ "$subl_prefs" != *$tab_to_space* ]]; then
#   nay "Translate tabs to spaces must be true!"
#   ((++checkpoints));
# fi

