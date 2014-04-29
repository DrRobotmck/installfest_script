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
