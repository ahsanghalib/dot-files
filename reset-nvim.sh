#!/usr/bin/env bash

rm -rf ~/.local/share/nvim 
rm -rf ~/.local/state/nvim 
rm -rf ~/.cache/nvim 

# git clone --depth 1 https://github.com/wbthomason/packer.nvim\
#  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "Reset NeoVIM is done"
