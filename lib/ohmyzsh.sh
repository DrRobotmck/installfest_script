# The Z shell (zsh) is a Unix shell that can be used as an interactive login
# shell and as a powerful command interpreter for shell scripting. Zsh can be
# thought of as an extended Bourne shell with a large number of improvements,
# including some features of bash, ksh, and tcsh.

# This script installs oh-my-zsh, an open source, community-driven framework
# for managing your ZSH configuration.

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.zshrc ~/.zshrc.orig
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

# Set as default
chsh -s /bin/zsh

# Resources
# https://github.com/robbyrussell/oh-my-zsh
