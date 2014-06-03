



#-------------------------------------------------------------------------------
# Set environmental constants
#-------------------------------------------------------------------------------



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
# TODO (phlco) ensure this actually works so we don't sudo every apt-get
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#-------------------------------------------------------------------------------
# Begin installfest
#-------------------------------------------------------------------------------





#######################################################################################

quoth_the_bard "The play's the thing..."

# The curtain rises ###################################################################

quoth_the_bard \
"Double, double toil and trouble; Fire burn, and caldron bubble." \
"--Macbeth (IV.i)"

echo "First, let's ensure your SSH keys are setup."

# SSH keys establish a secure connection between your computer and GitHub
# This script follows these instructions `https://help.github.com/articles/generating-ssh-keys`






######################################################################################

# Additional settings and bash_profile ###############################################
# FIGLET enters stage left. (apt-get installed a figlet formula to do auto ascii-text art)
# PHIL: What ho, Figlet!
# FIGLET: It is a tale. Told by an idiot, full of sound and fury. Signifying nothing.
# PHIL: Ummmmm, ok... Would you mind announcing the acts?
figlet_announces "act 1 - scene 3"
#
quoth_the_bard \
"I have touch'd the highest point of all my greatness;
And, from that full meridian of my glory,
I haste now to my setting: I shall fall
Like a bright exhalation in the evening,
And no man see me more." \
"--Henry VIII (III.ii)"
#
pause_awhile "Config settings for terminal"

# TODO (phlco) move to separate dotfiles install
source $SCRIPTS/settings.sh
#######################################################################################

# Ruby setup ##########################################################################
figlet_announces "act 3 - scene 1"

quoth_the_bard \
"Once more the ruby-colour'd portal open'd," \
"--Venus and Adonis (1593)"

pause_awhile "Setting up RBENV our Ruby Version Manager"
source $SCRIPTS/rbenv.sh
# #######################################################################################
#
# git setup ###########################################################################
figlet_announces "act 2 - scene 1"

quoth_the_bard \
"MARIA: This and these pearls to me sent Longaville:
The letter is too long by half a mile.

PRINCESS OF FRANCE: I think no less. Dost thou not wish in heart
The chain were longer and the letter short?" \
"--Love's Labour Lost (V.ii)"

pause_awhile "Setting up Git for Version Control"
source $SCRIPTS/git.sh
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
