#!/bin/bash
cd ~/
git clone https://github.com/alacritty/alacritty && cd alacritty
rustup target add aarch64-apple-darwin
cargo check --target=aarch64-apple-darwin
make dmg-universal
rsync -arhP --delete-before target/release/osx/Alacritty.app /Applications/
rm -rf ~/alacritty
