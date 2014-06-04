# How to use

The individual components of the InstallFest script are stored in `lib`

The components are listed in the order they are to be installed in `Manifest.mac`

A custom rake task assembles the pieces into one script.

To build the installfest script run `rake`

A pre-commit hook has been added that should automatically run `rake`
and add the manifest files.

# What does this install

- An editor
- A browser
- Configures git

# Assumptions

- Auto Completion
- Syntax Highlighting
