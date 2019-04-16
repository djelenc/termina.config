#!/bin/sh
set +x
set +e
DATE=`date '+%Y-%m-%d-%H%M%S'`

# vimrc
mv ~/.vimrc ~/.vimrc-$DATE && echo "Backing up existing vimrc to ~/.vimrc-$DATE" || echo "No prior vimrc"
ln -sf $PWD/vimrc ~/.vimrc
mv ~/.vimrc.local ~/.vimrc.local-$DATE && echo "Backing up existing vimrc.local to ~/.vimrc-$DATE" || echo "No prior vimrc.local"
ln -sf $PWD/vimrc.local ~/.vimrc.local

# tmux
mv ~/.tmux.conf ~/.tmux.conf-$DATE && echo "Backing up existing tmux.conf to ~/.tmux.conf-$DATE" || echo "No prior tmux.conf"
ln -sf $PWD/tmux.conf ~/.tmux.conf

# ssh
mkdir -p ~/.ssh
mv ~/.ssh/config ~/.ssh/config-$DATE && echo "Backing up existing ssh/config to ~/.ssh/config-$DATE" || echo "No prior ssh/config"
ln -sf $PWD/ssh.config ~/.ssh/config

# zshrc
mv ~/.zshrc ~/.zshrc-$DATE && echo "Backing up existing zshrc ~/.zshrc-$DATE" || echo "No prior zshrc"
ln -sf $PWD/zshrc ~/.zshrc
