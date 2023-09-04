#!/bin/bash
cd ~/
git clone https://github.com/alacritty/alacritty && cd alacritty
git checkout $(git tag --sort=creatordate | tail -1)

# Check if Rust is installed, install if not
if [[ -d $HOME/.cargo ]]
then
  export PATH="$HOME/.cargo/bin:$PATH"
  rustup update
else
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# Install Hasklug Nerd Font from Homebrew
brew tap homebrew/cask-fonts
brew install --cask font-caskaydia-cove-nerd-font

# Configure Rust and build app
rustup target add x86_64-apple-darwin
rustup target add aarch64-apple-darwin
cargo check --target=aarch64-apple-darwin
make dmg-universal

# Copy Alacritty to Applications and remove temp files
rsync -arhP --delete-before target/release/osx/Alacritty.app /Applications/
rm -rf ~/alacritty

