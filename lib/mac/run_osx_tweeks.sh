# # Disable the "Are you sure you want to open this application?" dialog
# defaults write com.apple.LaunchServices LSQuarantine -bool false

# # Reveal IP address, hostname, OS version, etc. when clicking the clock
# # in the login window
# sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# # Disable the warning when changing a file extension
# defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# # Only use UTF-8 in Terminal.app
# defaults write com.apple.terminal StringEncodings -array 4

# # Use a modified version of the Pro theme by default in Terminal.app
# open "${HOME}/init/Mathias.terminal"
# sleep 1 # Wait a bit to make sure the theme is loaded
# defaults write com.apple.terminal "Default Window Settings" -string "Mathias"
# defaults write com.apple.terminal "Startup Window Settings" -string "Mathias"

# # Install Sublime Text settings
# cp -r init/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Preferences.sublime-settings 2> /dev/null

# spectacle
# http://support.apple.com/kb/HT5914
# codesign -s - --resource-rules=/Users/YourUserNameHere/ResourceRules-ignoring-Scripts.plist /path/to/applet.app

# https://github.com/chytreg/dotfiles/blob/c532970fb63a78b2507141b4de26b3c8e25c2bfc/bin/bootstrap

# also look into brew cask for installing applications
# https://github.com/Homebrew/homebrew/wiki/External-Commands

####################################################################################
# Download and set Terminal colors to MyMonokai
####################################################################################
# TODO(phlco): Make these open in the background

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# echo "Settings MyMonokai for Terminal..."
# open -g "${HOME}/.wdi-installfest/settings/sublime/MyMonokai.terminal"
# echo "done"

# osascript -e 'tell application "Terminal" to activate' \
# -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down' \
# -e 'tell application "Terminal" to do script "open ~/.wdi-installfest/settings/sublime/MyMonokai.terminal" in tab 2 of front window'
# -e 'tell application "System Events" to tell process "Terminal" to keystroke "w" using command down'
# -e 'tell application "System Events" to tell process "Terminal" to tell window 1 to close'
