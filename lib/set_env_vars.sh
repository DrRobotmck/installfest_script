
BELOVED_RUBY_VERSION="2.1.2"
CURRENT_STABLE_RUBY_VERSION="2.1.2"

# TODO (pj) decide what the python versions should really be...
#   and maybe come up with a bigger, better place to hang this info
BELOVED_PYTHON_VERSION="anaconda-2.0.1"
CURRENT_STABLE_PYTHON_VERSION="3.4.1"

# TODO (phlco) set this in env vars or create_student_folders?
# STUDENT_FOLDER_SETUP="$HOME/src/wdi"

# FIXME (pj) NEED TO HAVE THIS SET THE BASH FILE EVERYWHERE, .bash_profile or .bashrc
if [[ "$OSTYPE" == "darwin"* ]]; then
  SYSTEM="mac"
  BASH_FILE=".bash_profile"
else
  SYSTEM="ubuntu"
  BASH_FILE=".bashrc"
fi

# TODO backport this into master and mac...
SRC_DIR=~/.wdi/installfest
SETTINGS=$SRC_DIR/settings
INSTALL_REPO=https://github.com/ga_instructors/installfest_script.git

# Standard Bash Variables
# `OSTYPE` A string describing the operating system Bash is running on.
# `MACHTYPE` system type in cpu-company-system
# `SECONDS` number of seconds since the shell was started.
OWNER="ga-students"
REPO="godot_instructors"
