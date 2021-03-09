# zplug settings
export ZPLUG_HOME=/usr/local/opt/zplug
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
alias ls='gls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias ..='cd ..'
alias date="gdate"

# pyenv settings
unalias pyenv 2>/dev/null
eval "$(pyenv init -)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
alias pyenv="SDKROOT=$(xcrun --show-sdk-path) pyenv"

# GoLang
export GOROOT=/Users/spectre/.go
export PATH=$GOROOT/bin:$PATH
export GOPATH=/Users/spectre/go
export PATH=$GOPATH/bin:$PATH
