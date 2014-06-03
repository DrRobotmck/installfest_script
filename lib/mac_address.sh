# Get MAC address for attendance
# 	ether 54:26:96:d6:71:c7
mac_address=$(sudo ifconfig en0 | grep ether | sed -e 's/^[ \t|ether|\s|\n]*//')
