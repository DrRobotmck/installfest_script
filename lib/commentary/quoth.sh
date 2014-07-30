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
  echo "${RED}${message}${RESET}"
  echo "${BLUE}${attribution}${RESET}"
}
