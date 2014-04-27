# Setup Sublime Preferences
subl_settings="${HOME}/Library/Application Support/Sublime Text 2"
user_prefs="Preferences.sublime-settings"
pkg_control="Package Control.sublime-package"
pkg_url="https://sublime.wbond.net/Package%20Control.sublime-package"
pkg_settings="Package Control.sublime-settings"

# backup
cp "$subl_settings/Packages/User/$user_prefs"{,.bak}
cp "$subl_settings/Installed Packages/$pkg_settings"{,.bak}

# copy over
cp "$SETTINGS/sublime/$pkg_settings" "$subl_settings/Installed Packages/$pkg_settings"
cp "$SETTINGS/sublime/$user_prefs"   "$subl_settings/Packages/User/$user_prefs"

# Installing Package Control
curl -L -o "$subl_settings/Installed Packages/$pkg_control" "$pkg_url"

# Symlink Sublime Text 2
ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

# fin #
