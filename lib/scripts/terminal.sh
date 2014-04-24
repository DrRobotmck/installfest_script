####################################################################################
# Download and set Terminal colors to Solarized
####################################################################################
# TODO: Make these open in the background
echo "Settings MyMonokai for Terminal..."
open "$SETTINGS/dotfiles/MyMonokai.terminal"
sleep 1
defaults write com.apple.terminal "Default Window Settings" -string "MyMonokai"
defaults write com.apple.terminal "Startup Window Settings" -string "MyMonokai"
