# Add user's github info to gitconfig
# https://www.kernel.org/pub/software/scm/git/docs/git-config.html
git config --global user.name    "$fname $lname"
git config --global user.github  $github_name
git config --global user.email   $github_email

# set colors
git config --global color.ui always

git config --global color.branch.current   "green reverse"
git config --global color.branch.local     green
git config --global color.branch.remote    yellow

git config --global color.status.added     green
git config --global color.status.changed   yellow
git config --global color.status.untracked red

# set editor
# change to `subl -w` if you want to open merge messages in Sublime.
git config --global core.editor "nano"

# default branch to push to
git config --global push.default current

# set global gitignore
git config --global core.excludesfile ~/.gitignore_global
