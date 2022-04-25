#!/bin/bash
cd ~/
git clone https://github.com/alacritty/alacritty && cd alacritty
brew tap homebrew/cask-fonts
brew install --cask font-hasklug-nerd-font
rustup target add x86_64-apple-darwin
rustup target add aarch64-apple-darwin
cargo check --target=aarch64-apple-darwin
make dmg-universal
rsync -arhP --delete-before target/release/osx/Alacritty.app /Applications/
rm -rf ~/alacritty
