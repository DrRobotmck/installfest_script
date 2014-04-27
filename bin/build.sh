#!/usr/bin/env bash

for MANIFEST in Manifest.*; do
  FILENAME=$(printf "$MANIFEST" | sed s/Manifest\.//)
  rm -f "$FILENAME"

  printf "\nBuilding $MANIFEST into $FILENAME\n"

  while read file; do
    printf "## Enter $file\n" >> "$FILENAME"

    cat "$file" >> "$FILENAME"

    printf "## Exeunt $file \n\n" >> "$FILENAME"
  done < "$MANIFEST"
done
