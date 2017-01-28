#!/bin/bash

#############################################################
#   _____      _                               _       _    #
#  / ____|    | |                             (_)     | |   #
# | (___   ___| |_ _   _ _ __    ___  ___ _ __ _ _ __ | |_  #
#  \___ \ / _ \ __| | | | '_ \  / __|/ __| '__| | '_ \| __| #
#  ____) |  __/ |_| |_| | |_) | \__ \ (__| |  | | |_) | |_  #
# |_____/ \___|\__|\__,_| .__/  |___/\___|_|  |_| .__/ \__| #
#                       | |                     | |         #
#                       |_|                     |_|         #
#############################################################

# 
# ./setup.sh            - download repository to $HOME/.dotfiles and symlink everythin ing place
# ./setup.sh clean      - backup all files in $BAKFILES to .dotfilebackup
#
# The dependencies for this script are (arch linux repo names):
#   - i3-wm
#   - i3status
#   - i3lock
#   - dmenu
#   - zsh
#   - vim
#   - rxvt-unicode
#   - tmux
#   - feh
#   - volnoti (AUR, GitHub)
#   - jauth-git (AUR, GitHub)
#   - powerline-fonts-git (AUR, GitHub)

# Files and folders
DOTFILES="$HOME/.dotfiles"

BAKFILES=".i3
          .zshrc
          .tmux.conf
          .vimrc
          .Xdefaults"

BAKFOLD="$HOME/.dotfilebackup"

# Clean environment
if [ "$1" == "clean" ]; then
    echo "[*] Backing up dotfiles to $BAKFOLD"

    # Create backup folder if it doesn't exist
    if [ ! -d $BAKFOLD ]; then
        mkdir $BAKFOLD
    fi

    # Backup each config file specified by $BAKFILES
    for file in $BAKFILES
    do
        mv -v $HOME/$file $BAKFOLD/$file
    done

    exit
fi

# Clone the repository if it doesn't exist 
if [ ! -e "$HOME/.dotfiles/"  ]; then
    git clone https://github.com/id101010/LinuxDotFiles.git $DOTFILES
fi

# ------------------------------------------------ Setup I3wm
ln -sfv $DOTFILES/i3wm/ $HOME/.i3

# ------------------------------------------------ Setup tmux
ln -sfv $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf

# ------------------------------------------------ Setup vim
ln -sfv $DOTFILES/vim/vimrc $HOME/.vimrc

# ------------------------------------------------ Setup zsh
ln -sfv $DOTFILES/zsh/zshrc $HOME/.zshrc

# ------------------------------------------------ Setup urxvt
ln -sfv $DOTFILES/urxvt/Xdefaults $HOME/.Xdefaults

# ------------------------------------------------ Setup wallpapers
ln -sfv $DOTFILES/wallpapers/ $HOME/.wallpapers
