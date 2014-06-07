
# this is a subset of the install_system_packages script for the purpose of
# setting up an ubuntu-rubyonly install

# OpenSSL implementation of SSL
sudo apt-get -y install libssl-dev
assert_that "OpenSSL implementation downloaded for git" "apt-cache show libssl-dev"

# git for version control
sudo apt-get -y install git
assert_that "OpenSSL implementation downloaded for git" "apt-cache show git"
