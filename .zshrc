#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export PATH=~/bin:$PATH

# vim
export PATH=/Applications/MacVim.app/Contents/bin/:$PATH
export EDITOR=vim
alias vi=vim

# go
export GOPATH=$HOME
export PATH=$GOPATH/bin:$PATH

# GCP
export PATH=$HOME/bin/google-cloud-sdk/bin:$PATH

# rbenv
eval "$(rbenv init -)"

# openssl
export PATH=/usr/local/opt/openssl/bin:$PATH
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

# neovim
export XDG_CONFIG_HOME=~/.config

##############
### prezto ###
##############

# modules/history/init.zsh
HISTSIZE=50000                   # The maximum number of events to save in the internal history.
SAVEHIST=50000                   # The maximum number of events to save in the history file.


############
### peco ###
############

# history filter
# http://qiita.com/uchiko/items/f6b1528d7362c9310da0
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history # C-rに割り当て

# cdr
autoload -Uz is-at-least
if is-at-least 4.3.11
then
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':chpwd:*' recent-dirs-max 5000
  zstyle ':chpwd:*' recent-dirs-default yes
  zstyle ':completion:*' recent-dirs-insert both
fi
function peco-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr

# rake routes
function peco-routes() {
 rake --help > /dev/null 2>&1
 if [[ $? == 0 ]]; then
   BUFFER="$(rake routes | peco --query "$LBUFFER")"
   CURSOR=$#BUFFER
 fi
}
zle -N peco-routes

# 絞り込んで指定行をvimで開く
function peco-ag-vim () {
 vim $(ag $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}

# cd gem directory
function peco-cd-gem() {
 local gem_name=$(bundle list | sed -e 's/^ *\* *//g' | peco | cut -d \  -f 1)
 if [ -n "$gem_name" ]; then
   local gem_dir=$(bundle show ${gem_name})
   echo "cd to ${gem_dir}"
   cd ${gem_dir}
 fi
}

# function peco-ssh () {
#   local selected_host=$(awk '
#   tolower($1)=="host" {
#     for (i=2; i<=NF; i++) {
#       if ($i !~ "[*?]") {
#         print $i
#       }
#     }
#   }
#   ' ~/.ssh/config | sort | peco --query "$LBUFFER")
#   if [ -n "$selected_host" ]; then
#     BUFFER="ssh ${selected_host}"
#     zle accept-line
#   fi
#   zle clear-screen
# }
# zle -N peco-ssh

function peco-ghq-list () { cd $(ghq list -p | peco) }
function peco-bundle-show-list () { cd $(bundle show --paths | peco) }

# vgo じゃなくて go で動くようになった
export GO111MODULE=on

eval "$(direnv hook zsh)"
