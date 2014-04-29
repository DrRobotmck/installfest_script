#######################################
# ABRB
# Arguments:
#   Message
#   Attribution
# Returns:
#   None
#######################################
function quoth_the_bard () {
  local message=$1
  local attribution=$2
  echo ""
  echo "$YELLOW$message$RESET"
  echo "$PURPLE$attribution$RESET"
}

#######################################
# Upcase error message and exit script
# Arguments: 
#   Error message
# Returns:
#   None
#######################################
function fie () {
  local message=$(echo $1 | tr 'a-z' 'A-Z')
  echo ""
  echo "$RED$message$RESET"
  exit
}

#######################################
# Waits for user input
# Arguments: 
#   Message
# Returns:
#   None
#######################################
function pause_awhile () {
   read -p "$* Press Enter to continue"
}

#######################################
# Mounts DMG and moves to Applications
# Arguments: 
#   File name
# Returns:
#   None
#######################################
function install_dmg () {
  echo 'Hark, a dmg!'
  file_name="$1"
  MOUNTPOINT="/Volumes/MountPoint"
  IFS="
  "
  hdiutil attach -mountpoint $MOUNTPOINT "$file_name.dmg"
  app=$(find $MOUNTPOINT 2>/dev/null -maxdepth 2 -iname \*.app)
  if [[ ! -z "$app" ]]; then
    cp -a "$app" /Applications/
  fi
  echo 'Hark! A pkg!'
  pkg=$(find $MOUNTPOINT 2>/dev/null -maxdepth 2 -iname \*.pkg)
  if [[ ! -z "$pkg" ]]; then
    # PL: Need to handle harddrive names that aren't Macintosh HD
    sudo installer -package $pkg -target /
  fi
  hdiutil detach $MOUNTPOINT
}

#######################################
# Unzip Zip and move App to Applications
# Arguments: 
#   File name
# Returns:
#   None
#######################################
function install_zip () {
  file_name="$1"
  echo 'Hark! A zip!'
  mkdir "$file_name"
  unzip "$file_name.zip" -d "$file_name"
  mv $file_name/*.app /Applications
}

#######################################
# Checks for the existence of a file
# Arguments: 
#   File name
# Returns:
#   1 or 0
#######################################
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

#######################################
# Downloads and installs apps from zips, dmgs, and pkgs.
# Arguments: 
#   File name
#   URL
# Returns:
#   None
#######################################
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

# fin
