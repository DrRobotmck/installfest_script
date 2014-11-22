# Create a folder for backed up files
# mkdir -p "${HOME}/.dotfiles_backup"

# Dotfiles we'll be using
dotfiles=(
  bashrc
  bash_profile
  gemrc
  gitconfig
  gitignore_global
  irbrc
  pryrc
  rspec
  vimrc
)

for file in ${dotfiles[@]}; do
  backup "${HOME}/.${file}"
  # symlink file
  ln -s "$SETTINGS/${file}" "${HOME}/.${file}"
done
