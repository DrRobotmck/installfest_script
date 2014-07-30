# WDI InstallFest Script

This repo holds the scripts used in the installation, setup, and creation of "dotfiles" (ie, application settings) for the development environments of students in General Assembly's Web Development Immersive program.

## How do I run an Installfest Script?

The script comes in three basic flavors: the default full install for Mac OS, the default full install for Ubuntu Linux, and smaller scripts that ensure a current and standardized install of Ruby is being used.

**Warning**: in their default form, these scripts are very invasive, overwriting settings and versions for applications and tools used in the course. If you have dearly loved dotfiles, ensure that you back them up before running the script.

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

#### A successful install

A successful install means we can run the following:

```bash
rails new sample_app -d postgresql && cd sample_app
rails g scaffold pet name:string
rake db:create && rake db:migrate
rails server #=> testing on localhost:3000

subl .

git init
git add .
git commit -am 'first commit'

heroku create
git push heroku master
```
