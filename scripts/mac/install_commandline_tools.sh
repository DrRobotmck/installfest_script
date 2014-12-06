
# Check that command line tools are installed
case $os_version in
  *10.10*) cmdline_version="CLTools_Executables" ;; # Yosemite
  *10.9*)  cmdline_version="CLTools_Executables" ;; # Mavericks
  *10.8*)  cmdline_version="DeveloperToolsCLI"   ;; # Mountain Lion
  *10.7*)  cmdline_version="DeveloperToolsCLI"   ;; # Lion
  *10.6*)  cmdline_version="DeveloperToolsCLILeo"
           warn "Outdated OS. Considering upgrading before continuing.";; # Snow Leopard
           # Force the user to upgrade if they're below 10.6
  *) warn "Sorry! You'll have to upgrade your OS to $MINIMUM_OS or above."; exit 1;;
esac

# Check for Command Line Tools based on OS versions
if [ ! -z $(pkgutil --pkgs=com.apple.pkg.$cmdline_version) ]; then
  inform "Command Line Tools are installed!";
elif [[ $os_version == *10.6** ]]; then
  warn "Command Line Tools are not installed"
  warn "Downloading and installing the GCC compiler."
  warn "When you're done rerun this script"
  curl -OLk https://github.com/downloads/kennethreitz/osx-gcc-installer/GCC-10.6.pkg
  open GCC-10.6.pkg
  exit 1
elif [[ $os_version == *10.7* ]] || [[ $os_version == *10.8* ]]; then
  warn "Command Line Tools are not installed"
  warn "Register for a Developer Account"
  warn "Download the Command Lion Tools from"
  warn "https://developer.apple.com/downloads/index.action"
  warn "Then rerun this script"
  exit 1 # TODO (phlco) maybe just type 'done' instead of rerunning?
else
  warn "Command Line Tools are not installed!"
  # echo "run '$ sudo xcodebuild -license' then"
  # echo "'$ xcode-select --install'"
  # echo "Then rerun this script."
  warn "Running 'xcode-select --install' Please click continue!"
  warn "After installing please rerun the installfest script."
  xcode-select --install
  exit 1 # TODO (phlco) maybe just type 'done' instead of rerunning?
fi
