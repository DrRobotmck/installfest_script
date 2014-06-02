#
#  _           _        _ _  __           _
# (_)_ __  ___| |_ __ _| | |/ _| ___  ___| |_
# | | '_ \/ __| __/ _` | | | |_ / _ \/ __| __|
# | | | | \__ \ || (_| | | |  _|  __/\__ \ |_
# |_|_| |_|___/\__\__,_|_|_|_|  \___||___/\__|
#
# Installfest Script for development on a vanilla Ubuntu machine
#
# Author: Phillip Lamplugh, GA Instructor (2014)
# Contributions: PJ Hughes, GA Instructor (2014)
#

# Resources
# what are some for Ubuntu?...

# References
# http://www.sudo.ws/
# http://www.gnu.org/software/bash/manual/bashref.html
# http://www.shellcheck.net
# http://explainshell.com/

#-------------------------------------------------------------------------------
# Set colors
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

# announce our acts
function figlet_announces () {
  clear
  local act=$1
  figlet -f ogre $act
}

function pause_awhile () {
   read -p "$* Press Enter to continue"
}

#-------------------------------------------------------------------------------
# Set environmental constants
#-------------------------------------------------------------------------------

# MINIMUM_OS="10.7.0"
BELOVED_RUBY_VERSION="2.1.0"

SRC_DIR=~/.wdi/installfest # TODO backport this into master and mac...
SCRIPTS=$SRC_DIR/scripts
SETTINGS=$SRC_DIR/settings
INSTALL_REPO=https://github.com/ga-instructors/installfest_script.git
BRANCH="ubuntu"

#-------------------------------------------------------------------------------
# Determine OS version
#-------------------------------------------------------------------------------

# Check version of Ubuntu and stuff?

#-------------------------------------------------------------------------------
# Check for Command Line Tools from X Code
#-------------------------------------------------------------------------------

# Check that gcc is installed?

#-------------------------------------------------------------------------------
# Clear terminal screen and capture password
#-------------------------------------------------------------------------------

clear

echo "Welcome to Installfest"
sudo echo "${GREEN}Thanks.${RESET}" # capture the user's password

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#-------------------------------------------------------------------------------
# Begin installfest
#-------------------------------------------------------------------------------

echo "Please register for an account on github.com if you haven't already done so."

read -p "Enter your full name: "  user_name
read -p "Github Username: "       github_name
read -p "Github Email: "          github_email

#-------------------------------------------------------------------------------
# Check for software updates
#-------------------------------------------------------------------------------

# do this?

#######################################################################################

quoth_the_bard "The play's the thing..."

# The curtain rises ###################################################################

quoth_the_bard \
"Double, double toil and trouble; Fire burn, and caldron bubble." \
"--Macbeth (IV.i)"

echo "First, let's ensure your SSH keys are setup."

# SSH keys establish a secure connection between your computer and GitHub
# This script follows these instructions `https://help.github.com/articles/generating-ssh-keys`

# SSH Keygen
ssh-keygen -t rsa -C $github_email
ssh-add id_rsa
# Copy SSH key to the clipboard
# Installing xclip
sudo apt-get install xclip
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

echo "We just copied your SSH key to the clipboard."
echo "Now we're going to visit GitHub to add the SSH key"

echo "Do the following in your browser: "
echo '- Click "SSH Keys" in the left sidebar'
echo '- Click "Add SSH key"'
echo '- Set the Title to WDI Installfest'
echo '- Paste your key into the "Key" field'
echo '- Click "Add key"'
echo '- Confirm the action by entering your GitHub password'

pause_awhile "Press Enter. We'll be here until you get back from Github."
echo "Firefox may print an error to the terminal. DON'T WORRY!"
# Open in default browser as a new process
xdg-open https://github.com/settings/ssh &

pause_awhile "Ok. Ready to Continue? Press Enter."
#
# download the repo for the absolute paths
if [[ ! -d $SRC_DIR ]]; then
  echo 'Downloading Installfest repo...'
  # autoupdate bootstrap file
  git clone -b $BRANCH $INSTALL_REPO $SRC_DIR
  # hide folder
  chflags hidden $SRC_DIR
else
  # update repo
  echo 'Updating repo...'
  cd $SRC_DIR
  git pull origin master
fi
# #######################################################################################
#
# # Ensure Macports and RVM aren't installed ############################################
# clear
# echo "            _     _                                     _ "
# echo "  __ _  ___| |_  / |          ___  ___ ___ _ __   ___  / |"
# echo " / _' |/ __| __| | |  _____  / __|/ __/ _ \ '_ \ / _ \ | |"
# echo "| (_| | (__| |_  | | |_____| \__ \ (_|  __/ | | |  __/ | |"
# echo " \__,_|\___|\__| |_|         |___/\___\___|_| |_|\___| |_|"
# echo "                                                          "
#
# quoth_the_bard \
# "Woe, destruction, ruin, and decay\; the worst is death and death will have his day." \
# "--Richard II (III.ii)"
#
# pause_awhile "Removing any previous installations of RVM and Macports."
# source $SCRIPTS/clean.sh
# ######################################################################################
#
# # Install homebrew and formulae ######################################################
# clear
# echo "            _     _                                     ____  "
# echo "  __ _  ___| |_  / |          ___  ___ ___ _ __   ___  |___ \ "
# echo " / _' |/ __| __| | |  _____  / __|/ __/ _ \ '_ \ / _ \   __) |"
# echo "| (_| | (__| |_  | | |_____| \__ \ (_|  __/ | | |  __/  / __/ "
# echo " \__,_|\___|\__| |_|         |___/\___\___|_| |_|\___| |_____|"
# echo "                                                              "
#
# quoth_the_bard \
# "PISTOL: The plain-song is most just: for humours do abound:
# Knocks go and come; God's vassals drop and die;
# And sword and shield,
# In bloody field,
# Doth win immortal fame.
#
# Boy: Would I were in an alehouse in London! I would give
# all my fame for a pot of ale and safety." \
# "--Henry V (III.ii)"
#
# pause_awhile "Installing our Package Manager HomeBrew"
# source $SCRIPTS/brew.sh
# ######################################################################################
#
# # Additional settings and bash_profile ###############################################
# # FIGLET enters stage left. (homebrew installed a figlet formula to do auto ascii-text art)
# # PHIL: What ho, Figlet!
# # FIGLET: It is a tale. Told by an idiot, full of sound and fury. Signifying nothing.
# # PHIL: Ummmmm, ok... Would you mind announcing the acts?
# figlet_announces "act 1 - scene 3"
#
# quoth_the_bard \
# "I have touch'd the highest point of all my greatness;
# And, from that full meridian of my glory,
# I haste now to my setting: I shall fall
# Like a bright exhalation in the evening,
# And no man see me more." \
# "--Henry VIII (III.ii)"
#
# pause_awhile "Config settings for terminal"
# source $SCRIPTS/settings.sh # PL: someday maybe these are kept in a hidden folder?
# #######################################################################################
#
# # Ruby setup ##########################################################################
# figlet_announces "act 3 - scene 1"
#
# quoth_the_bard \
# "Once more the ruby-colour'd portal open'd," \
# "--Venus and Adonis (1593)"
#
# pause_awhile "Setting up RBENV our Ruby Version Manager"
# source $SCRIPTS/rbenv.sh
# #######################################################################################
#
# # git setup ###########################################################################
# figlet_announces "act 2 - scene 1"
#
# quoth_the_bard \
# "MARIA: This and these pearls to me sent Longaville:
# The letter is too long by half a mile.
#
# PRINCESS OF FRANCE: I think no less. Dost thou not wish in heart
# The chain were longer and the letter short?" \
# "--Love's Labour Lost (V.ii)"
#
# pause_awhile "Setting up Git for Version Control"
# source $SCRIPTS/git.sh
# #######################################################################################
#
# # Apps ###############################################################################
# figlet_announces "act 2 - scene 2"
#
# quoth_the_bard \
# "Lend me an arm; the rest have worn me out
# With several applications..." \
# "--All's Well That Ends Well (I.ii)"
#
# pause_awhile "Installing applications for development"
# source $SCRIPTS/apps.sh
# #######################################################################################
#
# # Sublime setup #######################################################################
# figlet_announces "act 2 - scene 3"
#
# quoth_the_bard \
# "Suit the action to the word, the word to the action,
# with this special observance that you o'erstep not the modesty of nature." \
# "--Hamlet (III.ii)"
#
# pause_awhile "Configuring Sublime and Terminal"
# source $SCRIPTS/sublime.sh
# source $SCRIPTS/terminal.sh & # solarize terminal colors
# #######################################################################################
#
#
# # PJ STOPPED CHECKING HERE ...
#
#
# # Gem setup ###########################################################################
# figlet_announces "act 3 - scene 2"
#
# quoth_the_bard \
# "Making a couplement of proud compare,
# With sun and moon, with earth and sea's rich gems,
# With April's first-born flowers, and all things rare
# That heaven's air in this huge rondure hems." \
# "--Sonnet 21"
#
# pause_awhile "Installing system gems"
# source $SCRIPTS/gems.sh
# #######################################################################################
#
# # Install Postgres ####################################################################
# figlet_announces "act 4 - scene 1"
#
# quoth_the_bard \
# "'Tis in my memory lock'd, And you yourself shall keep the key of it." \
# "--Hamlet (I.iii)"
#
# pause_awhile "Configuring Postgres"
# source $SCRIPTS/postgres.sh
# #######################################################################################
#
# # Reload ##############################################################################
# figlet_announces "act 4 - scene 2"
#
# quoth_the_bard \
# "Once more unto the breach, dear friends, once more;
# Or close the wall up with our English dead." \
# "--Henry V (III.i)"
#
# pause_awhile "Let's run some checks to see how the install went"
# source ~/.bash_profile
# #######################################################################################
#
# # heroku keys
# #source $SCRIPTS/heroku.sh
#
# # checkpoints
# source $SCRIPTS/checks.sh
#
#
# welcome
# source ~/.bash_profile
# figlet_announces "fin"
# echo "We're done"
# echo "You may want to quit terminal. Reopen and then run brew doctor to ensure"
# echo "everything is working."
# -- fin -- #
