echo "Script now will gather your mac address and send to the class chatbot for"
echo "attendance purposes"

# Get MAC address for attendance
# ether 54:26:96:d6:71:c7
user_name=$(git config --global user.name)
github_email=$(git config --global user.email)
github_name=$(git config --global user.github)
mac_address=$(sudo ifconfig en0 | grep ether | sed -e 's/^[ \t|ether|\s|\n]*//')

# curl mac address info to chatbot
ATTENDANCE_URL=https://sir-john-falstaff.herokuapp.com/mac_addresses

# Send to attendance db
curl -i $ATTENDANCE_URL \
  -H "Accept: application/json" \
  -H "Content-Type:application/json" \
  -X POST
  -d '{
    "name"         : "'"$user_name"'",
    "email"        : "'"$github_email"'",
    "github"       : "'"$github_name"'",
    "clientMac"    : "'"$mac_address"'"
  }'

