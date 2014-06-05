
#-------------------------------------------------------------------------------
# Set text formatting
#-------------------------------------------------------------------------------

# Reset formatting
RESET=$(      tput sgr0)

# Foreground color
BLACK=$(      tput setaf 0)
RED=$(        tput setaf 1)
GREEN=$(      tput setaf 2)
YELLOW=$(     tput setaf 3)
BLUE=$(       tput setaf 4)
MAGENTA=$(    tput setaf 5)
CYAN=$(       tput setaf 6)
WHITE=$(      tput setaf 9)
# ORANGE=$(     tput setaf 172)
# PURPLE=$(     tput setaf 141)

# Background color
BG_BLACK=$(   tput setab 0)
BG_RED=$(     tput setab 1)
BG_GREEN=$(   tput setab 2)
BG_YELLOW=$(  tput setab 3)
BG_BLUE=$(    tput setab 4)
BG_MAGENTA=$( tput setab 5)
BG_CYAN=$(    tput setab 6)
BG_WHITE=$(   tput setab 9)
# BG_ORANGE=$(  tput setab 172)

# Style
UNDERLINE=$(  tput smul)
NOUNDERLINE=$(tput rmul)
BOLD=$(       tput bold)
ITALIC=$(     tput sitm)
