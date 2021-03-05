# zplug settings
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

#plugins
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
# zplug "eendroroy/alien"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi


# Then, source plugins and add commands to $PATH
zplug load --verbose


# command alias
alias ls='gls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias ..='cd ..'
alias date="gdate"

############ color scheme settings ###############################
function powerline_precmd() {
    PS1="$($GOPATH/bin/powerline-go -error $? -jobs ${${(%):%j}:-0})"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    install_powerline_precmd
fi

SILVER=(status:black:white dir:blue:black git:green:black cmdtime:magenta:black)
export SILVER_SHELL=zsh
eval "$(silver init)"
####################################################################

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
