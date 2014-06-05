# SSH Keygen
ssh-keygen -t rsa -C $github_email
ssh-add id_rsa

# Copy SSH key to the clipboard
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

echo "We just copied your SSH key to the clipboard."
echo "Now we're going to visit GitHub to add the SSH key"

echo "Do the following in your browser: "
echo '- Click "SSH Keys" in the left sidebar'
echo '- Click "Add SSH key"'
echo '- Set the Title to WDI Installfest'
echo '- Paste your key into the "Key" field'
echo '- Click "Add key"'
echo '- Confirm the action by entering your GitHub password'

pause_awhile "Press Enter. We'll be here until you get back from Github."

echo "Firefox may print an error to the terminal. DON'T WORRY!"
# Open in default browser as a new process
# TODO(phlco) Firefox raises an error
xdg-open https://github.com/settings/ssh &

pause_awhile "Ok. Ready to Continue? Press Enter."
