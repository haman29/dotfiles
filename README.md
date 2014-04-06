dotfiles setting
========

# How to use
```
$ git clone git@github.com:haman29/dotfiles.git
$ cd ~/dotfiles/
$ git submodule init
$ git submodule update
```

## Init
### xcode
```
$ xcodeselect --install
```
### HomeBrew
```
$ ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)" 
$ brew doctor
$ sudo xcodebuild -license
$ brew doctor
Your system is ready to brew.
$ brew bundle ~/dotfiles/Brewfile

$ export HOMEBREW_CASK_OPTS="--appdir=/Applications"
$ brew bundle ~/dotfiles/Brewfile
```
## zsh
```
$ ln -s ~/dotfiles/.zshenv .zshenv
# restart zsh
```
## anyenv
```
$ ln -s ~/dotfiles/anyenv ~/.anyenv
$ anyenv install rbenv
```
## Vim
```
$ ln -s ~/dotfiles/.vimrc ~/
```
## git
```
$ ln -s ~/dotfiles/.giconfig ~/
$ ln -s ~/dotfiles/.gitignore ~/
```
##
