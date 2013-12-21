#!/usr/bin/env bash

if [ ! -x "$(which "brew")" ]; then
        echo "Install xcode, brew before running this" >&2
        exit 1
fi

brew update
brew upgrade

brew install git
brew install ack
brew install git-cal
brew install coreutils
brew install findutils
brew install wget --enable-iri
brew install tree
brew install htop
brew install rlwrap
brew install watch
brew install tmux
brew install fuse4x
brew install mysql
brew install bash-completion
brew install parallel

brew cleanup
