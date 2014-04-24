# This script creates a gitconfig file and copies over additional git settings

# copying gitignore global and commit template
cp $SETTINGS/gitignore_global ~/.gitignore_global # files to ignore in every git repo
cp $SETTINGS/gitmessage.txt   ~/.gitmessage.txt   # default git commit message tempalte

# Add user's github info to gitconfig
git config --global user.name  $github_name
git config --global user.email $github_email

# color
git config --global color.ui always

# set editor
git config --global core.editor subl -w

# default branch to push to
git config --global push.default current

# fin
