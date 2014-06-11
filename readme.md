# WDI InstallFest Script

This repo holds the scripts used in the installation, setup, and creation of "dotfiles" (ie, application settings) for the development environments of students in General Assembly's Web Development Immersive program.

[You can head here to find out what is installed, and what the hardware specifications are for the program.][specs]

## How do I run an Installfest Script?

The script comes in three basic flavors: the default full install for Mac OS, the default full install for Ubuntu Linux, and smaller scripts that ensure a current and standardized install of Ruby is being used.

**Warning**: in their default form, these scripts are very invasive, overwriting settings and versions for applications and tools used in the course. If you have dearly loved dotfiles, ensure that you back them up before running the script.

##### For Mac OS

Paste this script into a Terminal prompt:

```
bash <(curl -sL https://raw.githubusercontent.com/ga-instructors/installfest_script/version2/mac)
```

##### For Ubuntu Linux

If you aren't familiar with Linux, then make sure to read "[Getting Started with Ubuntu][ubuntu]." Otherwise, just paste this script into a Terminal prompt:

```
bash <(wget -qO- https://raw.githubusercontent.com/ga-instructors/installfest_script/version2/ubuntu)
```

If you are a Linux user already, and only want to install our common Ruby environment, paste this script into a Terminal prompt:

```
bash <(wget -qO- https://raw.githubusercontent.com/ga-instructors/installfest_script/version2/ubuntu-rubyonly)
```

#### A successful install

A successful install means we can run the following:

```bash
rails new sample_app -d postgresql && cd sample_app
rails g scaffold pet name:string
rake db:create && rake db:migrate
rails server #=> testing on localhost:3000

git init
git add .
git commit -am 'first commit'

heroku create
git push heroku master

atom .
chrome
hipchat

# sinatra? node? rspec?
```

## How do I Contribute to (or edit) the Installfest Scripts?

For specific rules about making contributions or how to structure Pull Requests, please read [CONTRIBUTING.md]().

### Directory and script structure

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

```bash
.
├── Rakefile     #=> the rake task used to assemble or
├── bin          #   'build' a script from a manifest
│   └── build.rb #=> the build executable itself
├── lib
│   ├── commentary
│   │   ├── #=> messages for the user
|   |   ...
│   ├── mac
│   │   ├── #=> mac-only components
|   |   ...
│   ├── ubuntu
│   |   ├── #=> ubuntu-only components
|   |   ...
│   └── settings
│       ├── dotfiles
│       │   ├── #=> dotfiles!
|       ├── #=> other application settings,
|       |   #   possibly in directories for each application
|       ...
├── tests
│   ├── #=> testing (or other meta-) components
|   ...
├── Manifest.mac    #=> the list of components above
├── mac             #=> the script assembled from the manifest
├── Manifest.ubuntu
├── ubuntu
...
└── readme.md
```

### Testing and logging

The script downloads from [https//raw.githubusercontent.com](). Be aware: **it caches resources for one minute**, so you may not see your changes to the script immediately.

*Use a seperate branch (or fork) from __master__ and __development__ for testing and working on features or new components*, of course. Users are pulling directly from **master** for builds.

Components exist to log the output of the scripts. Since the output is massive, they are set by default to log only:

- output sent to `STDERR`
- comments printed with the command `echo_log` or `echo >&2`
- output created by functions that use `echo_log`, such as those stored in the `tests/add_assert_functions.sh` component

Components also exist to share the log file via email. This will be helpful for knowing the status of students' installs done off-site.

It is recommended to add assertions that check the status of every component that installs or updates the target system, if for no other reason than to ensure that there is a log record of the changes made by the script.

### Creating new scripts

While adding components to the script library is always useful, as well as making updates to existing components to reflect changes in standard installations or bugfixes, it is important to test any changes made in a component that is included in existing manifests at the script level and the component level. What that means is, run every effected script when you make a change to a component to check for regression errors, please.

In order to minimize regression issues, please add new or special functionality to new components. Place the component in the right directory (system-specific, system-independent, user settings, tests, etc.), and create a new manifest.

The suggested structure for a component is:

```bash
                           #=> begin with a blank line! (be nice)
# this component will blow
# your minds so just get   #=> explain what component does
# ready for the madness

SCPTVAR=${SCPTVAR:-deflt}  #=> be sure any env vars declared
                           #   in another component are set
                           #   to defaults (be safe)
SCPTVARTWO="`pwd`/newdir"  #=> set any vars local to this
SCPTF="${SCTPVARTWO}/"+ \  #   component... use ALL CAPS!
      "${SCPTVAR}"         #   (ie, be consistent)
CNTNTS="put in the file!"

mkdir -p SCPTVARTWO        #=> perform the action
echo $CNTNTS > $SCPTFILE

#=> finally, assert that the script worked
assert_that "File was created" "cat $SCPTFILE" "$CNTNTS"
#=> assert_that checks that the second param can be eval'ed
#   without an error, and that any optional thrid param is
#   equivalent to the output from eval'ing the second param
```

... and the suggested structure for a manifest is:

```bash
#=> begin the script, handle options and set up logging
shebang
handle_options_and_start_logging
tests/add_assert_functions

#=> handle any options and/or set env vars for components
...

#=> explanation and/or directions for script
commentary/...

#=> if necessary (using sudo in components below)
capture_password

#=> insert your components here
...

```

## What do the Installfest scripts do?

After the successful completion of an Installfest script, the target computer should have all of the necessary software installed to create web applications: to write, test, run, collaborate on, and host them online.

The target computer should also utilize common settings for applications and software development tools used in the course (unless the user overrode the script's default behavior).

In short, the scripts set up the target computer with a common development environment shared by all of the members and instructors of WDI. Which raises the questions:

- what is a development environment?
- how we teach development in WDI?
- what tools do we use to develop software?
- what other applications do we use in the course?
- what other tools and techs might one use while at GA?
- what are minimum and recommended specs for development hardware?

### What is a development environment?

Program in a Unix-like environment. Right now we support Mac OSX and Ubuntu. We program in a shell: bash/zsh. We use a window manager: Spectacle or Unity's built-in tool. we use technologies and a language stack. we use tools and settings and a style guide.

### How do we teach development in WDI?

language stack  
versions (why important)

|                       | Version      | Technology | Client/Server | Installed |
|:----------------------|:-------------|:-------------|:------:|:--:|
| **[PostgreSQL][psql]** | ...    | Database     | Server | &#x2713; |
| **[Ruby][sll]**       | 2.1.2  | Language     | Server | &#x2713; |
| **[Sinatra][sf1l]**   | ...    | Framework    | Server | &#x2713; |
| **[Rails][sf2l]**     | 4.1.0  | Framework    | Server | &#x2713; |
| **[RSpec][stl]**      | 3.0.0  | Unit Testing | Server | &#x2713; |
| **[JavaScript][cll]** | ...    | Language     | Client | |
| **[jQuery][jquery]** | 2.1.1    | Framework     | Client | |
| **[Backbone][back]**   | 1.1.2  | Framework    | Client | |
| **[Jasmine][ftl]**    | [...][ftv]   | Unit Testing | Client | |
| **[Capybara][acl]**   | [...][acv]   | Acceptance <br> Testing | Client | &#x2713; |
| **[Heroku][hkl]**     | ...  | Hosting      | &nbsp; | &#x2713;\* |

\* - some tools added and setup performed, but no specific application involved  

[psql]: http://www.postgresql.org/ "..."
[sll]: ... "..."
[sf1l]: ... "..."
[sf2l]: ... "..."
[stl]: http://rspec.info/ "..."
[cll]: ... "..."
[back]:   http://backbonejs.org/ "Backbone homepage and documentation"
[jquery]: http://jquery.com/  "jQuery homepage"
[ftl]: ... "..."
[acl]: ... "..."
[hkl]: ... "..."
[dbv]: ... "..."
[slv]: ... "..."
[sf1v]: ... "..."
[sf2v]: ... "..."
[stv]: ... "..."
[clv]: ... "..."
[cfv]: ... "..."
[ftv]: ... "..."
[acv]: ... "..."

### What tools do we use to develop software?

what tools do we need for web dev  
suggested vs alternatives  
settings

| App | Tool | Alternatives |
|:--:|:--:|:--:|
| **[Atom][txt]** | Text Editor | [Sublime Text](), <br> [Vim]() |
| **[Chrome][brw]** | Web Browser | [Firefox]() |
| **[Git][ver]** | Version Control | none |
| **[GitHub][clb]** | Code Sharing /<br> Collaboration | none |
| **[Trello][pro]** | Process <br> Management | [Pivotal Tracker]() |
| **[HipChat][cha]** | Chat / Messaging | [IRC](), [Slack]() |

[txt]: ... "..."
[brw]: ... "..."
[ver]: ... "..."
[clb]: ... "..."
[pro]: ... "..."
[cha]: ... "..."

### What other applications do we use in the course?

| App | Req'd for Class | System | Description |
|:----|:---------------:|:------:|:------------|
| __[rbenv][rbenv]__ | &#x2713; | Mac/Ubuntu | A Ruby version management tool. Similar to [RVM][rvm], but smaller and simpler. |
| __[figlet]()__  |  &#x2713; | Mac/Ubuntu  | An ASCII art generator. |
| __[Brew]()__\* | &#x2713; | Mac | A system-wide [package management]() system. Similar to [apt-get](). |
| __[Spectacle]()__\* | &#x2713; | Mac | A window management utility with hotkeys. Similar to the hotkeys in [Unity](). |
| __[Vim]()__\*\*  | &#x2713; | Ubuntu  | A very widely-used, terminal-based text editor. |
| __[Alfred]()__  |  | Mac  | A search and indexing tool that replaces Spotlight. |
| __[Dash]()__, __[Zeal]()__ |  | Mac, Ubuntu | Tools for storing, browsing and searching documentation. |
| __[Flux]()__  | | Mac/Ubuntu  | A monitor color management utility pegged to daylight. |
| __[Hub][hub]__ | | Mac/Ubuntu | A wrapper/plugin for Git that adds functionality. |
| __[Sublime Text]()__  | | Mac/Ubuntu | An alternate (very popular) text editor. |
| __[zsh]()__  | | Mac/Ubuntu  | An alternate terminal shell environment. |

 \* - copies a program or functionality included by default in Ubuntu Linux  
 \*\* - copies a program or functionality included by default in Mac OS X

and various packages needed to make these work and the above work

[rbenv]: https://github.com/sstephenson/rbenv "rbenv on GitHub"
[rvm]: https://rvm.io/ "RVM homepage"
[hub]: https://hub.github.com/ "Hub hompeage"

### What settings and dotfiles do we use for applications?

settings as separate from default installations  
how dotfiles work  
colors and profiles for term and text editors  
browser plugins  
git settings  
testing  

read more: our style guide

### What other tools and techs might one use while at GA?

Other programming environments you may use in class or in another GA class. Also used by some of our applications and system tools.

- C & C++ (gcc/clang, make, autoconf) installed
- Node (node and npm) installed
- Python (python versions and pip, django) installed
- R (version, open source R studio) not installed (why)
- PHP (versions, composer, laravel) not installed (why)
- Java (versions, jdk) not installed (why)

### What are minimum and recommended specs for development hardware?

#### Minimum and recommended hardware specs

- Ruby: 16 MB
- Sublime: OS X (OS X 10.6 or later is required), 30 MB
- Homebrew: 10.7 or higher is recommended. 10.6 and 10.5 are supported on a best-effort basis.
- Mac System Requirements: In order to run 10.7 you'll need
  - an Intel Core 2 Duo, Core i3, Core i5, Core i7, or Xeon processor
  - 7 GB of available disk space
  - 2 GB of RAM
- Chrome
  - Mac OS X 10.6 or later, Intel, 350 MB
  - Ubuntu 12.04+, Intel Pentium 4 or later
- Class Repo ~ 500MB
- Brew Cellar ~ 1GB
- Atom ~ 200 MB
- HipChat ~ 25MB
- FireFox ~ 115MB
- Gems

#### Recommended hardware for purchase

...

#### Virtual machines and necessary hardware

...

~~~

## Assumptions

- Auto Completion
- Syntax Highlighting

~~~


## How do I get started with Ubuntu?

### What is Linux? What is Ubuntu?

What and why

...

### How can I use Linux on my machine?

1. In a virtual environment
2. As the local environment

...

### Installing a virtual environment

Install VirtualBox VM
Install Vagrant
Vagrant Up

...


Inside of the virtual environment we must:

- [set up the windowing to auto-resize](http://askubuntu.com/questions/104440/how-do-you-resize-the-standard-ubuntu-desktop-inside-of-virtualbox):

```bash
sudo apt-get install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
```

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

### Installing a bootable local environment

...

### Setting up the dev environment

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

### Learn the Unity desktop

- REALLY GOOD SHORTCUTS THING:
http://askubuntu.com/questions/28086/what-are-unitys-keyboard-and-mouse-shortcuts
- LESS GOOD THING: https://help.ubuntu.com/community/KeyboardShortcuts#Common_application_shortcuts
- SUPER, META, & HYPER KEYS: http://askubuntu.com/questions/19558/what-are-the-meta-super-and-hyper-keys
- OTHER TERMINOLOGY:
http://askubuntu.com/questions/10228/whats-the-right-terminology-for-unitys-ui-elements




[specs]:          #specifications              "Dev Environment and hardware specs"
[ubuntu]:         #getting-started-with-ubuntu "Ubuntu Guide"
[developing]:     how_to_use.md                   "How to use the script"
[mac-torrent]:    http://example.com/             "Mac GABox"
[ubuntu-torrent]: http://example.com/             "Ubuntu GABox"
