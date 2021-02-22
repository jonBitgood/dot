#!/bin/sh

echo "Setting up Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew tap homebrew/cask
brew tap homebrew/core
brew tap homebrew/cask-fonts
brew tap bramstein/webfonttools
brew tap homebrew/cask-versions

# Binaries
brew install awscli
brew install coreutils
brew install moreutils
brew install findutils
brew install ffmpeg
brew install gh
brew install git
brew install gnupg2
brew install grep
brew install httpie
brew install mackup
brew install mas
brew install 'pkg-config'
brew install trash
brew install tree
brew install zlib

# Development
brew install php
brew install composer
brew install imagemagick
brew install libmemcached
brew install memcached
brew install mysql
brew install nginx
brew install node
brew install redis
brew install yarn

brew install jrnl
brew install audiobookbinder

brew install --cask caffeine
brew install --cask dbngin
brew install --cask 'sequel-pro'
brew install --cask firefox
brew install --cask google-chrome
brew install --cask github
brew install --cask expressvpn
brew install --cask imageoptim
brew install --cask insomnia
brew install --cask java
brew install --cask phpstorm
brew install --cask sublime-text
brew install --cask spectacle
brew install --cask 'the-unarchiver'
brew install --cask transmission
brew install --cask forklift
brew install --cask vlc

if test $USER = 'jon'; then

	git config --global user.name "Jon Bitgood"
	git config --global user.email jon@dbs.org

	brew install --cask kicad
	brew install --cask prince

	# Vim Setup
	ln -fs  ~/.dot/nvim/.vimrc ~/
fi

# Set default MySQL root password and auth type.
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Install PHP extensions with PECL
pecl install memcached imagick

# Install global Composer packages
/usr/local/bin/composer global require laravel/installer laravel/valet tightenco/jigsaw

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Sites
cd $HOME/Sites && valet park

# Clone Github repositories
git clone git@github.com:digitalbiblesociety/aleph.git $HOME/Sites/aleph
git clone git@github.com:digitalbiblesociety/bet.git $HOME/Sites/bet
git clone git@github.com:digitalbiblesociety/bibles.git $HOME/Bibles

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dot
#rm -rf $HOME/.zshrc
#ln -s $HOME/.dot/.zshrc $HOME/.zshrc