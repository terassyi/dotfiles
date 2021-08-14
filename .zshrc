# zplug settings
export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh

# windows mount path
export WIN_MNT=/mnt/c/Users/terassyi

#plugins
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug mafredri/zsh-async, from:github
# zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme 
# zplug skylerlee/zeta-zsh-theme, from:github, as:theme
# zplug qoomon/zsh-theme-qoomon, from:github, as:theme
zplug el1t/statusline, from:github, as:theme

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time load battery)
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

POWERLEVEL9K_TIME_FOREGROUND='015'
POWERLEVEL9K_TIME_BACKGROUND='245'

POWERLEVEL9K_HOST_LOCAL_BACKGROUND='245'
POWERLEVEL9K_HOST_LOCAL_FOREGROUND='black'
POWERLEVEL9K_HOST_REMOTE_BACKGROUND='245'
POWERLEVEL9K_HOST_REMOTE_FOREGROUND='black'

# POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='245'
# POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='black'
# POWERLEVEL9K_CONTEXT_SUDO_BACKGROUND='245'
# POWERLEVEL9K_CONTEXT_SUDO_FOREGROUND='black'
# POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='245'
# POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='black'

POWERLEVEL9K_DIR_HOME_BACKGROUND='253'
POWERLEVEL9K_DIR_HOME_FOREGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='253'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='black'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='253'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='black'
POWERLEVEL9K_DIR_ETC_BACKGROUND='253'
POWERLEVEL9K_DIR_ETC_FOREGROUND='black'
POWERLEVEL9K_DIR_NOT_WRITABLE_BACKGROUND='253'
POWERLEVEL9K_DIR_NOT_WRITABLE_FOREGROUND='black'

POWERLEVEL9K_LOAD_NORMAL_BACKGROUND='157'
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND='black'
POWERLEVEL9K_LOAD_WARNING_BACKGROUND='192'
POWERLEVEL9K_LOAD_WARNING_FOREGROUND='black'
POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND='225'
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND='black'

POWERLEVEL9K_BATTERY_LOW_BACKGROUND='208'
POWERLEVEL9K_BATTERY_LOW_FOREGROUND='black'
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND='229'
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND='black'
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND='221'
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND='black'
POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND='008'
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND='black'

POWERLEVEL9K_VCS_CLEAN_BACKGROUND='157'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='225'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='228'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi


# Then, source plugins and add commands to $PATH
zplug load

# command alias
alias cl='clear'
alias ls='natls'
alias ll='natls -l'
alias la='natls -l'
alias ..='cd ..'
alias date="gdate"
# alias cat="batcat"

# pyenv settings
# unalias pyenv 2>/dev/null
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"


# GoLang
export PATH=$GOROOT/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# GoLang
export GOROOT=/home/terassyi/.go
export PATH=$GOROOT/bin:$PATH
export GOPATH=/home/terassyi/go
export PATH=$GOPATH/bin:$PATH
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

if [ -e "$HOME/.nodenv" ]
then
    export NODENV_ROOT="$HOME/.nodenv"
    export PATH="$NODENV_ROOT/bin:$PATH"
    if command -v nodenv 1>/dev/null 2>&1
    then
        eval "$(nodenv init -)"
    fi
fi

source /home/terassyi/.config/broot/launcher/bash/br

PYTHONDONTWRITEBYTECODE=1

# deno settings
export DENO_INSTALL="/home/terassyi/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# peco settings
# history
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000

# share .zshhistory
setopt inc_append_history
setopt share_history

function peco-history-selection() {
    BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection
