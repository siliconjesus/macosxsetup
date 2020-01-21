#!/bin/bash

# Setup brew - we will need this for the following:

# Install xcode command line

xcode-select --install

# Install brew

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install cask

brew install cask

# Install additional brews - this is from a populated list called brew.cfg
# DOES NOT CHECK FOR FAILURES (YET)
# to generate this: $ brew list > brew.cfg
for BREW in `cat brew.cfg | grep -v $#`
do
   brew install $BREW
done

# Install casks - from casks.cfg
# DOES NOT CHECK FOR ERRORS (YET)
# to generate this: $brew cask list > casks.cfg
for CASK in `cat casks.cfg | grep -v $#` 
do
   brew cask install $CASK
done

# Pull rcfiles
git clone https://github.com/siliconjesus/rcfiles ~/rcfiles/
bash ~/rcfiles/install_rcfiles.sh
. ~/.bashrc

# Install pip3 libraries
# to generate: pip3 list | tail +3 | awk '{print $1}' > pip.cfg

for PIP in `cat pip.cfg | grep -v $#`
do
   pip3 install $PIP
done
