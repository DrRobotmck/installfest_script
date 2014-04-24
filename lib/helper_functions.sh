#-------------------------------------------------------------------------------
# Colors
#-------------------------------------------------------------------------------

# Foreground
BLACK=$(tput setaf 0)
BLUE=$(tput setaf 4)
CYAN=$(tput setaf 6)
GREEN=$(tput setaf 2)
MAGENTA=$(tput setaf 5)
ORANGE=$(tput setaf 172)
PURPLE=$(tput setaf 141)
RED=$(tput setaf 1)
WHITE=$(tput setaf 7)
YELLOW=$(tput setaf 226)

# Background
BG_BLACK=$(tput setab 0)
BG_BLUE=$(tput setab 4)
BG_CYAN=$(tput setab 6)
BG_GREEN=$(tput setab 2)
BG_MAGENTA=$(tput setab 5)
BG_ORANGE=$(tput setab 172)
BG_RED=$(tput setab 1)
BG_WHITE=$(tput setab 7)
BG_YELLOW=$(tput setab 226)

# Formatting
UNDERLINE=$(tput smul)
NOUNDERLINE=$(tput rmul)
BOLD=$(tput bold)
RESET=$(tput sgr0)

#-------------------------------------------------------------------------------
# Functions
#-------------------------------------------------------------------------------

# ABRB
function quoth_the_bard () {
  local message=$1
  local attribution=$2
  echo ""
  echo "$YELLOW$message$RESET"
  echo "$PURPLE$attribution$RESET"
}

# upcase error message and exit script
function fie () {
  local message=$(echo $1 | tr 'a-z' 'A-Z')
  echo ""
  echo "$RED$message$RESET"
  exit
}

function pause_awhile () {
   read -p "$* Press Enter to continue"
}

function install_dmg () {
  echo 'Hark, a dmg!'
  file_name="$1"
  MOUNTPOINT="/Volumes/MountPoint"
  IFS="
  "
  hdiutil attach -mountpoint $MOUNTPOINT "$file_name.dmg"
  app=$(find $MOUNTPOINT 2>/dev/null -maxdepth 2 -iname \*.app)
  if [ ! -z "$app" ]; then
    cp -a "$app" /Applications/
  # for app in `find $MOUNTPOINT -type d -maxdepth 2 -name \*.app `; do
  # done
  fi
  echo 'Hark! A pkg!'
  pkg=$(find $MOUNTPOINT 2>/dev/null -maxdepth 2 -iname \*.pkg)
  if [ ! -z "$pkg" ]; then
    # PL: Need to handle harddrive names that aren't Macintosh HD
    sudo installer -package $pkg -target /
  fi
  hdiutil detach $MOUNTPOINT
}

function install_zip () {
  file_name="$1"
  echo 'Hark! A zip!'
  mkdir "$file_name"
  unzip "$file_name.zip" -d "$file_name"
  mv $file_name/*.app /Applications
}

# Checks for the existence of a file
function know_you_not_of () {
  file_name="$1"
  file_count=$(find /Applications -name "$file_name.app" | wc -l)
  if [[ $file_count -gt 0 ]]; then
    echo "$file_name is already here.";
    return 1
  else
    return 0
  fi
}

# Downloads and installs apps from zips, dmgs, and pkgs.
function lend_me_your () {
  file_name="$1"
  url="$2"
  ext=${url: -4}
  if know_you_not_of "$file_name" ; then
    curl -L -o "$file_name$ext" $url
    # enter stage left...
    case "$ext" in
      ".dmg")  install_dmg "$file_name";;
      ".zip")  install_zip "$file_name";;
      *) echo "Not Processed";;
    esac
  fi
  # Out spot
  rm -rf "$file_name$ext"
  rm -rf "$file_name"
}
