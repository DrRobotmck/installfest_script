# Setup Sublime Preferences
sublime_app_support="${HOME}/Library/Application Support/Sublime Text 2"
sublime_preferences="Preferences.sublime-settings"
pkg_control="Package Control.sublime-package"
pkg_url="https://sublime.wbond.net/Package%20Control.sublime-package"
pkg_settings="Package Control.sublime-settings"

# backup
cp -r "$sublime_app_support/Packages/User/$sublime_preferences"{,.bak}
cp -r "$sublime_app_support/Installed Packages/$pkg_settings"{,.bak}

# copy over
cp -r "$SETTINGS/sublime/$sublime_preferences" "$sublime_app_support/Packages/User/$sublime_preferences"
cp -r "$SETTINGS/sublime/$pkg_settings"        "$sublime_app_support/Installed Packages/$pkg_settings"

# Installing Package Control
curl -L -o "$sublime_app_support/Installed Packages/$pkg_control" "$pkg_url"

# # Symlink Sublime Text 2
# ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
