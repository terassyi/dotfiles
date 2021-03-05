#! /bin/zsh

# check os
OS=$(uname)

echo $OS

# switch default shell to zsh
if [ $SHELL != "/bin/zsh" ]; then
	chsh -s /bin/zsh
fi

# setup golang
git clone https://github.com/canha/golang-tools-install-script
cd golang-tools-install-script
chmod +x goinstall.sh
./goinstall.sh
rm -rf golang-tools-install-script

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
