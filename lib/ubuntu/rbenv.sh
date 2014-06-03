# our ruby version manager
sudo apt-get -y install rbenv
# git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
# provides an `rbenv install` command
sudo apt-get -y install ruby-build

# enable shims and autocompletion
eval "$(rbenv init -)"

# Add to path
export PATH="$HOME/.rbenv/bin:$PATH"
