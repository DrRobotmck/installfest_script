# Our ruby version manager

# rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# FIXME (h4w5) should check if it exists
# Wouldn't it not exist until installing rbenv anyway?
# Specify default gems in ~/.rbenv/default-gems
git clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems

# automatically runs rbenv rehash every time you install or uninstall a gel.
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

# FIXME (h4w5) should check if it exists
# Wouldn't it not exist until installing rbenv anyway?
# Provides an rbenv install command to compile and install different versions of Ruby
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
