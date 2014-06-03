# Because we're going to use rbenv and homebrew we need to remove RVM and MacPorts
# This script checks for and removes previous installs of macports and RVM

# Uninstall Macports
# http://guide.macports.org/chunked/installing.macports.uninstalling.html
if hash port 2>/dev/null || [[ $(find /opt/local -iname macports 2>/dev/null) ]]; then
  echo "Removing MacPorts"
    macports=$(find /opt/local -iname macports)
    for f in $macports; do
      rm -rf $f
    done
  # carthago delenda est
  sudo port -fp uninstall installed
  sudo rm -rf \
    /opt/local \
    /Applications/DarwinPorts \
    /Applications/MacPorts \
    /Library/LaunchDaemons/org.macports.* \
    /Library/Receipts/DarwinPorts*.pkg \
    /Library/Receipts/MacPorts*.pkg \
    /Library/StartupItems/DarwinPortsStartup \
    /Library/Tcl/darwinports1.0 \
    /Library/Tcl/macports1.0 \
    ~/.macports
    sudo find / | grep macports | sudo xargs rm
else
  echo "Macports is not installed. Moving on..."
fi
