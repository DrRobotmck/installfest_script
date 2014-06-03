# Get MAC address for attendance
# 	ether 54:26:96:d6:71:c7
mac_address=$(sudo ifconfig en0 | grep ether | sed -e 's/^[ \t|ether|\s|\n]*//')

# TODO (philco)

# # curl mac address info to chatbot
# chatbot="http://localhost:8080"
# url="$chatbot/students"
#
# curl -H "Content-Type: application/json" -d '{
#   "name"         : "'$user_name'",
#   "email"        : "'$github_email'",
#   "github"       : "'$github_name'",
#   "mac_address"  : "'$mac_address'"
# }' "$url"
