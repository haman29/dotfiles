How to use
======

date: 2015/07/30

# Xcode
```
# App Store で xcode 検索してインストール
$ sudo xcodebuild -license
# type “agree” 
```

# homebrew
```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

$ brew doctor
$ brew update

$ brew install python
$ brew install ansible
```

# install
```
$ git clone git@github.com:haman29/dotfiles.git
$ cd ~/dotfiles; HOMEBREW_CASK_OPTS="--appdir=/Applications" ansible-playbook -i hosts -vv localhost.yml
```

# dotfiles settings
```
$ cd ~/dotfiles/
$ git submodule init
$ git submodule update

# add symbolic link
$ ./setup.sh
```

# manual
## iterm2 color schema 設定
```
ghq get altercation/solarized.git
# iterm2 > opne profiles > colors > Load Presets > import
# iterm2-colors-solarized をimport
```

# refs

- http://t-wada.hatenablog.jp/entry/mac-provisioning-by-ansible
