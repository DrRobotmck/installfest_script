
# Check that command line tools are installed
case $os_version in
  *10.10*) cmdline_version="CLTools_Executables" ;; # Yosemite
  *10.9*)  cmdline_version="CLTools_Executables" ;; # Mavericks
  *10.8*)  cmdline_version="DeveloperToolsCLI"   ;; # Mountain Lion
  *10.7*)  cmdline_version="DeveloperToolsCLI"   ;; # Lion
  # Force the user to upgrade if they're below 10.7
  *) echo "Sorry! You'll have to upgrade your OS to $MINIMUM_OS or above."; exit 1;;
esac

# Check for Command Line Tools based on OS versions
if [ ! -z $(pkgutil --pkgs=com.apple.pkg.$cmdline_version) ]; then
  echo "Command Line Tools are installed";
elif [[ $os_version == "10.7" ]] || [[ $os_version == "10.8" ]]; then
  echo "Command Line Tools are not installed"
  echo "Register for a Developer Account"
  echo "Download the Command Lion Tools from"
  echo "https://developer.apple.com/downloads/index.action"
  echo "Then rerun this script"
  exit 1
else
  echo "Command Line Tools are not installed!"
  # echo "run '$ sudo xcodebuild -license' then"
  # echo "'$ xcode-select --install'"
  # echo "Then rerun this script."
  echo "Running 'xcode-select --install' Please click continue!"
  xcode-select --install
  exit 1
fi
