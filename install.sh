#! /bin/zsh

# check os
OS=$(uname)

# switch default shell to zsh
if [ $SHELL != "/bin/zsh" ]; then
	chsh -s /bin/zsh
fi

# install powerline-go

go get -u github.com/justjanne/powerline-go

BASEDIR=$(dirname $0)
cd $BASEDIR

for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".gitmodules" ] && continue

    ln -snfv ${PWD}/"$f" ~/
done
