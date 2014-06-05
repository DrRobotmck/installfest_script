# How to use

The individual components of the InstallFest script are stored in `lib`

The components are listed in the order they are to be installed in `Manifest.mac` and `Manifest.ubuntu`

A custom rake task assembles the pieces into one script.

To build the installfest script run `rake`

A pre-commit hook has been added that should automatically run `rake`
and add the manifest files.

# Developing
The script downloads from raw.githubusercontent.com. Be aware that it caches resources for 1 minute, so you may not see your changes to the script immediately.

# What does this install

- An editor
- A browser
- Configures git

# Assumptions

- Auto Completion
- Syntax Highlighting
