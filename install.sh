#! /bin/zsh

# check os
OS=$(uname)

# switch default shell to zsh
sudo apt install zsh
if [ $SHELL != "/bin/zsh" ]; then
	chsh -s /bin/zsh
fi
sudo apt install peco

# go install
./go-install.sh

# rust install
./rust-install.sh

cargo install natls

# install powerline-go
go get -u github.com/justjanne/powerline-go

# install zplug
ZPLUG=$HOME/.zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

BASEDIR=$(dirname $0)
cd $BASEDIR

for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".gitmodules" ] && continue

    ln -snfv ${PWD}/"$f" ~/
done
