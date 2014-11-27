# SRC_DIR=~/.wdi/installfest
# SETTINGS=$SRC_DIR/settings
if [[ $os_version == *10.6** ]]; then
  # skip for now
  subl_app_support="/Users/$USER/Library/Application Support/Sublime Text 2"
else
  # Setup Sublime Preferences
  subl_app_support="${HOME}/Library/Application Support/Sublime Text 2"
fi
subl_preferences="Preferences.sublime-settings"
pkg_control="Package Control.sublime-package"
pkg_url="https://sublime.wbond.net/Package%20Control.sublime-package"
pkg_settings="Package Control.sublime-settings"

backup "$subl_app_support/Packages/User/$subl_preferences"
backup "$subl_app_support/Installed Packages/$pkg_settings"

# copy over
cp -f "$SRC_DIR/settings/sublime/$subl_preferences" "$subl_app_support/Packages/User/$subl_preferences"
cp -f "$SRC_DIR/settings/sublime/$pkg_settings"     "$subl_app_support/Installed Packages/$pkg_settings"

# Installing Package Control
curl -oL "$subl_app_support/Installed Packages/$pkg_control" "$pkg_url"

# NOTE (phlco) I think brew cask takes care of this.
# # Symlink Sublime Text 2
# ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
