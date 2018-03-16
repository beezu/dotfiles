#!/bin/bash

mkdir -p ~/.config/nvim/
ln -s ~/.vimrc ~/.config/nvim/init.vim
sudo ln -s ~/.vimrc /root/.vimrc
sudo ln -s ~/.vim /root/.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
