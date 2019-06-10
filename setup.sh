#!/bin/bash

DOT_FILES=( .gitconfig .gitignore .irbrc .vimrc .tmux.conf .tmuxinator .dir_colors .pryrc )

for file in ${DOT_FILES[@]}
do
    rm $HOME/$file
    ln -s $HOME/dotfiles/$file $HOME/$file
done

# .zshenv
