echo "Script now will gather your mac address and send to the class chatbot for"
echo "attendance purposes"

# Get MAC address for attendance
# ether 54:26:96:d6:71:c7
mac_address=$(sudo ifconfig en0 | grep ether | sed -e 's/^[ \t|ether|\s|\n]*//')

# curl mac address info to chatbot
ATTENDANCE_URL=http://agile-plateau-3603.herokuapp.com/students

# Send to attendance db
curl -i \
-H "Accept: application/json" \
-H "Content-Type:application/json" \
-X POST --data '{
"name"         : "'"$user_name"'",
"email"        : "'"$github_email"'",
"github"       : "'"$github_name"'",
"mac_address"  : "'"$mac_address"'"
}' $ATTENDANCE_URL
