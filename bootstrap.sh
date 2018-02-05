#!/bin/sh

set -e

# vim  
cp vimrc ~/.vimrc
# tmux
cp tmux.conf ~/.tmux.conf

# zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
