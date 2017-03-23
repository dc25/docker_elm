#! /bin/bash

./install_node
./install_elm

mkdir -p $HOME/.vim/bundle
cd $HOME/.vim/bundle

git clone https://github.com/lambdatoast/elm.vim.git


