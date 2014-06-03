# Check for recommended software updates
sudo softwareupdate -i -r --ignore iTunes

# Ensure user has full control over their folder
sudo chown -R ${USER} ~

# Repair disk permission
diskutil repairPermissions /

