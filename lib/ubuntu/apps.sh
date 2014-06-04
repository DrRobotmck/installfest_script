# Google Chrome.........The Browser
# HipChat...............The Chat Client
# Sublime Text 2........The Text Editor

# chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get -y update
sudo apt-get -y install google-chrome-stable

# hipchat
echo "deb http://downloads.hipchat.com/linux/apt stable main" > /etc/apt/sources.list.d/atlassian-hipchat.list
wget -O - https://www.hipchat.com/keys/hipchat-linux.key | apt-key add -
sudo apt-get -y update
sudo apt-get -y install hipchat

# sublime
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2
sudo apt-get -y update
sudo apt-get -y install sublime-text

# zsh
sudo apt-get -y install zsh

# flux
sudo add-apt-repository -y ppa:kilian/f.lux
sudo apt-get -y update
sudo apt-get -y install fluxgui

# hub
# http://eoinoc.net/install-hub-github-linux-mint/
curl http://defunkt.io/hub/standalone -Lo ~/usr/bin/hub
chmod 755 ~/usr/bin/hub

# vim
sudo apt-get -y install vim

# atom
# Requires 64-bit
# ensure that gyp uses Python 2
sudo npm config set python /usr/bin/python2 -g
git clone https://github.com/atom/atom
cd atom
# TMPDIR=~/.wdi/tmp
# Creates application at $TMPDIR/atom-build/Atom
# TODO (phlco) move to /usr/bin
script/build
# Installs command to /usr/local/bin/atom
sudo script/grunt install
# Generates a .deb package at $TMPDIR/atom-build
script/grunt mkdeb
# TODO (phlco) command line tool for atom?
# sudo dpkg -i $TMPDIR/atom-build/Atom.deb
