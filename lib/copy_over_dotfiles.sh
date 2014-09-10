SRC_DIR=~/.wdi/installfest
SETTINGS=$SRC_DIR/settings

dotfiles=($SETTINGS/*)

timestamp=$(date +%s)

mkdir -p $HOME/.wdi/backups_$timestamp

for filepath in "${dotfiles[@]}"; do

  dotfile=".$(basename $filepath)"

  if [[ -a "$HOME/$dotfile" ]]; then

    cp "$HOME/$dotfile" "$HOME/.wdi/backups_$timestamp/$dotfile"

  fi

  cp $filepath "$HOME/$dotfile"
done
