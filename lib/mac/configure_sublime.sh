# SRC_DIR=~/.wdi/installfest
# SETTINGS=$SRC_DIR/settings

if [[ $os_version == *10.6* ]]; then
  # skip for now
  subl_app_support="/Users/$USER/Library/Application\ Support/Sublime\ Text\ 2"
else
  # Setup Sublime Preferences
  subl_app_support="${HOME}/Library/Application\ Support/Sublime\ Text\ 2"
fi

subl_preferences="Preferences.sublime-settings"
pkg_control="Package Control.sublime-package"
pkg_url="https://sublime.wbond.net/Package%20Control.sublime-package"
pkg_settings="Package Control.sublime-settings"

backup "$subl_app_support/Packages/User/$subl_preferences"
backup "$subl_app_support/Installed Packages/$pkg_settings"

# ensure files exist before copying for 10.6
mkdir -p "$subl_app_support/Packages/User/$subl_preferences"
mkdir -p "$subl_app_support/Installed Packages/"

# copy over
cp -f "$SRC_DIR/settings/sublime/$subl_preferences" "$subl_app_support/Packages/User/$subl_preferences"
cp -f "$SRC_DIR/settings/sublime/$pkg_settings"     "$subl_app_support/Installed Packages/$pkg_settings"

# Installing Package Control
# NOTE (phlco) curling then mving because curl gave a malformed url in 10.6
curl -O $pkg_url
mv "Package%20Control.sublime-package" "$subl_app_support/Installed\ Packages/$pkg_control"
