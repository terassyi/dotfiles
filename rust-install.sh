!#/bin/zsh

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update
rustup component add rls rust-analysis rust-src
