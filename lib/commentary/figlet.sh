#######################################
# Announce our acts
# Arguments:
#   Act Number
# Returns:
#   None
#######################################
function figlet_announces () {
  clear
  local act=$1
  figlet -f ogre $act
}
