#!/bin/sh
set +x
set +e
DATE=`date '+%Y-%m-%d-%H%M%S'`

# vimrc
# mv ~/.vimrc ~/.vimrc-$DATE && echo "Backing up existing vimrc to ~/.vimrc-$DATE" || echo "No prior vimrc"
# ln -sf $PWD/vimrc ~/.vimrc
# mv ~/.vimrc.local ~/.vimrc.local-$DATE && echo "Backing up existing vimrc.local to ~/.vimrc.local-$DATE" || echo "No prior vimrc.local"
# ln -sf $PWD/vimrc.local ~/.vimrc.local
# mv ~/.vimrc.local.bundles ~/.vimrc.local.bundles-$DATE && echo "Backing up existing vimrc.local.bundles to ~/.vimrc.local.bundles-$DATE" || echo "No prior vimrc.local.bundles"
# ln -sf $PWD/vimrc.local.bundles ~/.vimrc.local.bundles

# tmux
mv ~/.tmux.conf ~/.tmux.conf-$DATE && echo "Backing up existing tmux.conf to ~/.tmux.conf-$DATE" || echo "No prior tmux.conf"
ln -sf $PWD/tmux.conf ~/.tmux.conf

# ssh
mkdir -p ~/.ssh
mv ~/.ssh/config ~/.ssh/config-$DATE && echo "Backing up existing ssh/config to ~/.ssh/config-$DATE" || echo "No prior ssh/config"
ln -sf $PWD/ssh.config ~/.ssh/config

# zshrc
# mv ~/.zshrc ~/.zshrc-$DATE && echo "Backing up existing zshrc ~/.zshrc-$DATE" || echo "No prior zshrc"
# ln -sf $PWD/zshrc ~/.zshrc

# spacemacs
# mv ~/.spacemacs ~/.spacemacs-$DATE && echo "Backing up existing spacemacs to ~/.spacemacs-$DATE" || echo "No prior spacemacs"
# ln -sf $PWD/spacemacs ~/.spacemacs

# ideavimrc
mv ~/.ideavimrc ~/.ideavimrc-$DATE && echo "Backing up existing ideavimrc ~/.ideavimrc-$DATE" || echo "No prior ideavimrc"
ln -sf $PWD/ideavimrc ~/.ideavimrc
