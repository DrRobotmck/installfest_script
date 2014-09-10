# WDI InstallFest Script

This repo holds the scripts used in the installation, setup, and creation of "dotfiles" (ie, application settings) for the development environments of students in General Assembly's Web Development Immersive program.

## How do I run an Installfest Script?

The script comes in three basic flavors: the default full install for Mac OS, the default full install for Ubuntu Linux, and smaller scripts that ensure a current and standardized install of Ruby is being used.

**Warning**: in their default form, these scripts are very invasive, overwriting settings and versions for applications and tools used in the course. If you have dearly loved dotfiles, ensure that you back them up before running the script.

## Step 1

##### For Mac OS

Paste this script into a Terminal prompt:

```
bash <(curl -sL https://raw.githubusercontent.com/amadden80/installfest_script/master/mac)
```


##### For Ubuntu Linux

Paste this script into a Terminal prompt:

```
bash <(wget -qO- https://raw.githubusercontent.com/amadden80/installfest_script/master/ubuntu)
```
## Step 2

##### Reload the terminal screen

The new environment **will not work** with the current, open, terminal. Use `Command+N` in Mac OS, or `Shift+Ctrl+N` in Ubuntu, to open a new terminal window.

## Step 3

##### Check for a successful install

A successful install means we can run the following in our new terminal window. If any of these aren't working, you can stop your test and add an issue to this GitHub repo or ask an instructor for help.

```bash
cd ~/src/wdi
# ^^ The wdi folder should exist.

rails new sample_app -d postgresql && cd sample_app
rails g scaffold pet name:string
rake db:create && rake db:migrate
rails server &
# ^^ Test this by opening a Chrome browser to http://localhost:3000.
# ^^ Press Ctrl+C in the command line to stop the server from running...
#    Only stop the server if the server is running, of course!

subl .
# ^^ This should open up a Sublime Text instance.

# WARNING! Do NOT run `git init` in your home directory!
# Only run this from ~/src/wdi/sample_app!!
git init
git add . --all
git commit -am 'first commit'
# ^^ If you type `ll` you should see a ".git" folder.

heroku create
git push heroku master
# ^^ This should complete with no errors!
```
## Step 4

##### Ensure your window manager loads on startup

**For Mac OS only**: use `Command+Space` to open Spotlight, and then type in `Spectacle`. Press `Enter` to start the program, and then click on the "spectacles" icon along the top bar of your computer, and choose `Preferences...`.

Ensure that "Launch Spectacle at login," in the lower left of the panel, is checked!
