# Create a folder for backed up files
mkdir -p "${HOME}/.dotfiles_backup"

# Dotfiles we'll be using
dotfiles="gitconfig gitignore_global bash_profile bashrc gemrc pryrc rspec irbrc vimrc"

for file in $dotfiles; do
  if [ -a "${HOME}/${file}" ]; then
      # backup files
      mv "${HOME}/${file}" "${HOME}/.dotfiles_backup/${file}"
    fi
    # symlink file
  ln -s "$SETTINGS/dotfiles/${file}" "${HOME}/${file}"
done
