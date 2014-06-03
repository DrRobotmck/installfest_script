# Google Chrome.........The Browser
# HipChat...............The Chat Client
# Sublime Text 2........The Text Editor

# chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install google-chrome-stable

# hipchat
echo "deb http://downloads.hipchat.com/linux/apt stable main" > /etc/apt/sources.list.d/atlassian-hipchat.list
wget -O - https://www.hipchat.com/keys/hipchat-linux.key | apt-key add -
apt-get update
apt-get install hipchat

# sublime
sudo add-apt-repository ppa:webupd8team/sublime-text-2
sudo apt-get update
sudo apt-get install sublime-text

# zsh
sudo apt-get install zsh

# flux
sudo add-apt-repository ppa:kilian/f.lux
sudo apt-get update
sudo apt-get install fluxgui

# hub
# http://eoinoc.net/install-hub-github-linux-mint/
mkdir ~/bin
curl http://defunkt.io/hub/standalone -Lo ~/bin/hub
chmod 755 ~/bin/hub

# atom
# ensure that gyp uses Python 2
npm config set python /usr/bin/python2 -g
git clone https://github.com/atom/atom
cd atom
# Creates application at $TMPDIR/atom-build/Atom
script/build
# Installs command to /usr/local/bin/atom
sudo script/grunt install
# Generates a .deb package at $TMPDIR/atom-build
script/grunt mkdeb
