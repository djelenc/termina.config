# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:$HOME/bin"

# emacs doom scripts
export PATH="$PATH:/home/david/.emacs.d/bin"

# Path to your oh-my-zsh installation.
export ZSH=/home/david/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="gallois"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    extract
    tmux
    mvn
    golang
    docker
    docker-compose
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gst='git status -sb'

# ANTLR
alias antlr4='java -jar /usr/local/lib/antlr-4.7.1-complete.jar'
alias grun="java -cp .:/usr/local/lib/antlr-4.7.1-complete.jar org.antlr.v4.gui.TestRig"
alias gcomp="javac -cp /usr/local/lib/antlr-4.7.1-complete.jar $*"
alias gexec="java -cp .:/usr/local/lib/antlr-4.7.1-complete.jar $*"

# Android SDK
export PATH="$PATH:/home/david/apps/android-sdk/platform-tools"

# Golang
export GOPATH=$HOME/Development/go
export PATH=$GOPATH/bin:$PATH

# Virtalenv and virtualenvwrapper
export WORKON_HOME=$HOME/Development/python/virtualenvs
# Ubuntu 18.04 /usr/local/bin/virtualenvwrapper.sh
# Ubuntu 16.04 /usr/share/virtualenvwrapper/virtualenvwrapper.sh
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh >/dev/null 2>&1 || source /usr/local/bin/virtualenvwrapper.sh

# Maybe put the following PATH modifications to some local file?
# ESP32 toolchain
export PATH="$PATH:/home/david/Development/esp32/xtensa-esp32-elf/bin:/home/david/.emacs.d/bin"
export IDF_PATH=~/Development/esp32/esp-idf

# Cuda: do I need it?
export PATH="/usr/local/cuda-9.2/bin:$PATH"

# haskell
export PATH="$PATH:/home/david/.local/bin"

# docker-compose
# See manual installation
# https://github.com/zsh-users/zsh-completions e. g.
# git clone git://github.com/zsh-users/zsh-completions.git ~/.zsh/completion
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# vi mode
# https://dougblack.io/words/zsh-vi-mode.html
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# Map tapped CAPS to ESC and held CAPS to CTRL
# setxkbmap -option 'caps:ctrl_modifier'
# xcape -e 'Caps_Lock=Escape'

export JAVA_HOME=/usr/lib/jvm/default-java
fpath+=${ZDOTDIR:-~}/.zsh_functions
