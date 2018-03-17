#!/bin/bash

mkdir -p ~/.config/nvim/
sudo mkdir -p /root/.config/nvim/
ln -s ~/.vimrc ~/.config/nvim/init.vim
sudo ln -s ~/.vimrc /root/.config/nvim/init.vim
sudo ln -s ~/.vimrc /root/.vimrc
sudo ln -s ~/.vim /root/.vim
