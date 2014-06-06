## WDI InstallFest Script

These are the scripts used to in the installation, setup, and creation of "dotfiles" for the development environments of students in General Assembly's Web Development Immersive program.

[You can head here to find out what is installed and what the hardware specifications are for the program.][specs]

The script comes in three basic flavors: the default full install for Mac OS, the default full install for Ubuntu Linux, and smaller scripts that ensure a current and standardized install of Ruby is being used.

##### For Mac OS:

Paste this script into a Terminal prompt:

```
bash <(curl -sL http://git.io/6_SaSw)
```

##### For Ubuntu Linux:

_**Don't use yet!** Almost in working condition._

If you aren't familiar with Linux, then make sure to read "[Getting Started with Ubuntu][ubuntu]." Otherwise, just Paste this script into a Terminal prompt:

```
bash <(wget -qO- https://raw.githubusercontent.com/ga-instructors/installfest_script/ubuntu-merge/ubuntu)
```

##### For Ruby only:

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

## Developers

If you want to contribute to or use the installfest script to set up a GA dev environment, please read our [how to use][developing] document.

[specs]:          specifications.md               "Dev Environment and hardware specs"
[ubuntu]:         getting_started_with_ubuntu.md  "Ubuntu Guide"
[developing]:     how_to_use.md                   "How to use the script"
[mac-torrent]:    http://example.com/             "Mac GABox"
[ubuntu-torrent]: http://example.com/             "Ubuntu GABox"

# How to Use
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

# Success

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

# Getting started with Ubuntu
# Setting up your Linux environment with Ubuntu

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
