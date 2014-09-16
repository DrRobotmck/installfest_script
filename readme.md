# WDI InstallFest Script

This repo holds the scripts used in the installation, setup, and creation of "dotfiles" (ie, application settings) for the development environments of students in General Assembly's Web Development Immersive program.

## How do I run an Installfest Script?

The script comes in three basic flavors: the default full install for Mac OS, the default full install for Ubuntu Linux, and smaller scripts that ensure a current and standardized install of Ruby is being used.

**Warning**: in their default form, these scripts are very invasive, overwriting settings and versions for applications and tools used in the course. If you have dearly loved dotfiles, ensure that you back them up before running the script.

## Step 1

##### For Mac OS

Paste this script into a Terminal prompt:

```
bash <(curl -sL https://raw.githubusercontent.com/ga-instructors/installfest_script/master/mac)
```

##### For Ubuntu Linux

Paste this script into a Terminal prompt:

```
bash <(wget -qO- https://raw.githubusercontent.com/ga-instructors/installfest_script/master/ubuntu)
```
## Step 2

##### Reload the terminal screen

The new environment **will not work** with the current, open, terminal. Use `Command+N` in Mac OS, or `Shift+Ctrl+N` in Ubuntu, to open a new terminal window.
