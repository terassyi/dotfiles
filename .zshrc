# zplug settings
export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh

#plugins
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

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
alias ls='natls'
alias ll='natls -l'
alias la='natls -l'
alias ..='cd ..'
alias date="gdate"

# pyenv settings
# unalias pyenv 2>/dev/null
eval "$(pyenv init -)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
alias pyenv="SDKROOT=$(xcrun --show-sdk-path) pyenv"


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
