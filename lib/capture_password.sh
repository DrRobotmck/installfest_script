# Capture the user's password
sudo -p "Please enter your computer's password so that we can make the necessary changes: " echo "Thanks."

# Update existing `sudo` time stamp until script has finished
while true; do sudo -v true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
