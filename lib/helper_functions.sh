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

# announce our acts
function figlet_announces () {
  clear
  local act=$1
  figlet -f ogre $act
}

function pause_awhile () {
   read -p "$* Press Enter to continue"
}
