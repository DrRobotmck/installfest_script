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
