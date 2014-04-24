# Upgrade any already-installed formulae
brew upgrade

# These formulae duplicate software provided by OS X
# though may provide more recent or bugfix versions.
brew tap homebrew/dupes

# Autoconf is an extensible package of M4 macros that produce shell scripts to automatically configure software source code packages.
brew install autoconf

# Automake is a tool for automatically generating Makefile.in
brew install automake

# generic library support script
brew install libtool

# a YAML 1.1 parser and emitter
brew install libyaml

# neon is an HTTP and WebDAV client library
brew install neon

# A toolkit implementing SSL v2/v3 and TLS protocols with full-strength cryptography world-wide.
brew install openssl

# pkg-config is a helper tool used when compiling applications and libraries.
brew install pkg-config

# a self-contained, serverless, zero-configuration, transactional SQL database engine.
brew install sqlite

# a script that uses ssh to log into a remote machine
brew install ssh-copy-id

# XML C parser and toolkit
brew install libxml2

# a language for transforming XML documents into other XML documents.
brew install libxslt

# a conversion library between Unicode and traditional encoding
brew install libiconv

# generates an index file of names found in source files of various programming languages.
brew install ctags

# Tap a new formula repository from GitHub, or list existing taps.
brew tap homebrew/versions

# Ensures all tapped formula are symlinked into Library/Formula
# and prunes dead formula from Library/Formula.
brew tap --repair

# Remove outdated versions from the cellar
brew cleanup
