# WDI InstallFest Script

This repo holds the scripts used in the installation, setup, and creation of "dotfiles" (ie, application settings) for the development environments of students in General Assembly's Web Development Immersive program.

[You can head here to find out what is installed, and what the hardware specifications are for the program.][specs]

The script comes in three basic flavors: the default full install for Mac OS, the default full install for Ubuntu Linux, and smaller scripts that ensure a current and standardized install of Ruby is being used.

##### For Mac OS:

Paste this script into a Terminal prompt:

```
bash <(curl -sL https://raw.githubusercontent.com/ga-instructors/installfest_script/version2/mac)
```

##### For Ubuntu Linux:

If you aren't familiar with Linux, then make sure to read "[Getting Started with Ubuntu][ubuntu]." Otherwise, just paste this script into a Terminal prompt:

```
bash <(wget -qO- https://raw.githubusercontent.com/ga-instructors/installfest_script/version2/ubuntu)
```

If you are a Linux user already, and only want to install our common Ruby environment, paste this script into a Terminal prompt:

```
bash <(wget -qO- https://raw.githubusercontent.com/ga-instructors/installfest_script/version2/ubuntu-rubyonly)
```

# Contributing to (or Editing) the Installfest Scripts

For specific rules about making contributions or how to structure Pull Requests, please read [CONTRIBUTING.md]().

## Directory and script structure

The scripts are written in Bash, and are meant to be run in a `bash` shell on a Unix-derived system. Such environments include both the default Terminal and iTerm in Mac OS X, and the Terminal and shell in Ubuntu Linux.

Every script has a manifest file in the root of the repo (`Manifest.scriptname`), and then a requisite Installfest script named simply `scriptname`, for example: `Manifest.mac` and `mac`. The manifest file is a list of the component shell scripts that comprise the full Installfest script. Running the default `rake` task in the repo assembles each of the Installfest scripts dynamically from the contents of each component script named therein.

The individual components of the InstallFest script are stored in `lib` and `tests`, and the Rake tasks (stored in the `Rakefile`) call Ruby scripts stored in `bin`.

**A pre-commit hook can be added to your repo** that automatically runs `rake` and adds the newly assembled Installfest script with your changes from the Manifests (and the `lib/set_script_branch.sh` file, which sets an environment variable with the current git branch's name) to your commit. To add that hook, run the command below from the repo's root.

```bash
# will not overwrite an existing pre-commit hook...
if [[ ! -a .git/hooks/pre-commit ]]; then
  cat << EOF > .git/hooks/pre-commit
    #!/usr/bin/env bash
    rake
    git add lib/set_script_branch.sh
    ls  Manifest* | sed -e 's/Manifest\.//g' | xargs git add
EOF
fi
```

Tests that can be run as part of a script, or helper functions to run such tests, are stored in the `tests` folder. All other components are stored in the `lib` folder.

Commentary beyond code explanation (simple comments) is stored in `lib/commentary`. System-independent components are stored in the base of `lib`, and system-dependent components are stored in `lib/systemname` (eg: `lib/mac` and `lib/ubuntu`). Settings (separate from installations, mostly for applications) and dotfiles are stored in `lib/settings`.

## Testing and logging

The script downloads from [https//raw.githubusercontent.com](). Be aware: **it caches resources for one minute**, so you may not see your changes to the script immediately.

*Use a seperate branch (or fork) from **master** and **development** for testing and working on features or new components*, of course. Users are pulling directly from **master** for builds.

Components exist to log the output of the scripts. Since the output is massive, they are set by default to log only:

- output sent to `STDERR`
- comments printed with the command `echo_log` or `echo >&2`
- output created by functions that use `echo_log`, such as those stored in the `tests/add_assert_functions.sh` component

Components also exist to share the log file via email. This will be helpful for knowing the status of students' installs done off-site.

It is recommended to add assertions that check the status of every component that installs or updates the target system, if for no other reason than to ensure that there is a log record of the changes made by the script.


## What does this install

- An editor
- A browser
- Configures git

## Assumptions

- Auto Completion
- Syntax Highlighting

## Success

A successful install means we can run the following successfully.

```
rails new sample_app -d postgresql && cd sample_app
rails g scaffold pet name:string
rake db:create && rake db:migrate
git init
git add .
git commit -am 'first commit'
# testing on localhost:3000

heroku create
git push heroku master
```

# Getting Started with Ubuntu

## What is Linux? What is Ubuntu?

What and why

...

## How can I use Linux on my machine?

1. In a virtual environment
2. As the local environment

...

## Installing a virtual environment

Install VirtualBox VM
Install Vagrant
Vagrant Up

...


Inside of the virtual environment we must:

- [set up the windowing to auto-resize](http://askubuntu.com/questions/104440/how-do-you-resize-the-standard-ubuntu-desktop-inside-of-virtualbox):

```bash
sudo apt-get install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
```

## Installing a bootable local environment

...

## Setting up the dev environment

- Set the desktop wallpaper with:

```bash
wget -O ~/Pictures/shortcut_wallpaper.jpg http://i.stack.imgur.com/krD8y.jpg
gsettings set org.gnome.desktop.background picture-uri "file://${HOME}/Pictures/shortcut_wallpaper.jpg"
```
http://i.stack.imgur.com/krD8y.jpg (--> need to host this!)

- Run the installfest script:

```bash
bash <( wget -qO- https://raw.githubusercontent.com/ga-instructors/installfest_script/ubuntu-merge/ubuntu)
```

## Learn the Unity desktop

- REALLY GOOD SHORTCUTS THING:
http://askubuntu.com/questions/28086/what-are-unitys-keyboard-and-mouse-shortcuts
- LESS GOOD THING: https://help.ubuntu.com/community/KeyboardShortcuts#Common_application_shortcuts
- SUPER, META, & HYPER KEYS: http://askubuntu.com/questions/19558/what-are-the-meta-super-and-hyper-keys
- OTHER TERMINOLOGY:
http://askubuntu.com/questions/10228/whats-the-right-terminology-for-unitys-ui-elements


# Specifications
The script first runs any software updates and then checks for Xcode.

If Xcode is installed the script continues.

- We then clone the repo onto the student's machine
- Remove Macports or RVM
- Installs homebrew and some formulae
- Sets up git
- Installs Sublime and Sublime settings (package manager and base packages)
- Installs additional apps like Chrome, HipChat and Spectacle
- Sets up RBenv and installs bundler, pry and rails
- Adds solarized to Terminal

# Minimum Requirements

- Ruby
- Rails
- Browser
- Text Editor

Ruby, 16 MB

Sublime
OS X (OS X 10.6 or later is required), 30 MB

Homebrew
10.7 or higher is recommended. 10.6 and 10.5 are supported on a best-effort basis.

Mac System Requirements
In order to run 10.7 you'll need
An Intel Core 2 Duo, Core i3, Core i5, Core i7, or Xeon processor
7 GB of available disk space
2 GB of RAM

Chrome
Mac OS X 10.6 or later, Intel, 350 MB
Ubuntu 12.04+, Intel Pentium 4 or later

Class Repo ~ 500MB

Brew Cellar ~ 1GB

Atom ~ 200 MB

HipChat ~ 25MB

FireFox ~ 115MB

Gems

~~~~~

Our development environment.

Program in a Unix-like environment. Right now we support Mac OSX and Ubuntu. We program in a shell: bash/zsh. We use a window manager: Spectacle or Unity's built-in tool.

What we teach with.

- BE Framework: Rails & Sinatra, FE Framework: Backbone, Database: PostgreSQL.
- Chart of versions.

What tools we use.*

- Editor: Atom (Sublime, Vim)
- Chat: HipChat
- Browser: Chrome (Firefox)

Other applications often used in class.

- Mac OS: ... (installed by default)
- Ubuntu: ... "

Other programming environments you may use in class or in another GA class. Also used by some of our applications and system tools.

- C
- Node
- Python
- PHP
- Java

Minimum and recommended hardware specs and virtual machines.

...

Recommended hardware for purchase.

...

### Why not use a Virtual Environment?

When weighing the options, we decided not use Vagrant to ensure all students were working in a common environment for three main reasons:

1. ownership
2. simplicity
3. Heroku

##### Ownership

We want the students to feel as if they are in control of their environments. That is, they should be able, within reason, to customize and optimize their coding experience as they see fit. Using a common install and then stepping away feels like a good way to set a baseline while allowing them ownership. While they could do the same with virtual machine, that undermines the entire reason of forcing them to work in a virtualized environment.

The precept holds as well: let's help them grow as individuals, and not enforce uniformity upon them. It seems to me weirdly patronizing to force them to work in an environment we've created, instead of giving them the tools to begin building their own.

##### Simplicity

Sure, having the students install Vagrant and run a VM may seem like it takes fewer steps than running this overcooked install script. But it's also removing a fair amount of agency. They don't afterwards have to interact with their dev environment, but only because of a reliance upon multiple layers of incredibly complicated software. It's giving the students "the magic" up front, which we've often seen lead to a number of questions we can't answer and misconceptions that are hard to clear up.

##### Heroku

As long as we are pushing our repos to Heroku for deployment, a VM seems unnecessary. But if we begin using a different and customizable hosting environment, and teaching students about basic DevOps, it may make sense to use Chef and Vagrant to configure servers and deploy.

### That being said...

We expect to build virtual machines using default setups, the installfest script and settings, and then have torrent links available here:

_**Don't use yet!** Not in working condition._

- [Download our our virtual Mac OS environment via BitTorrent.][mac-torrent]
- [Download our our virtual Ubuntu environment via BitTorrent.][ubuntu-torrent]




[specs]:          #specifications              "Dev Environment and hardware specs"
[ubuntu]:         #getting-started-with-ubuntu "Ubuntu Guide"
[developing]:     how_to_use.md                   "How to use the script"
[mac-torrent]:    http://example.com/             "Mac GABox"
[ubuntu-torrent]: http://example.com/             "Ubuntu GABox"
