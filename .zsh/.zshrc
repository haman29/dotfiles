export ZSH=/Users/hamada/.oh-my-zsh

# submodule
[ -d $ZDOTDIR/modules/zsh-syntax-highlighting ] && \
    source $ZDOTDIR/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_THEME="robbyrussell"

plugins=(git)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

# alias
alias g=git
alias la="ls -lAha"

###
# vim
###
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vi=vim
alias macvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/MacVim "$@"'

###
# go
###
if [ -x "`which go`" ]; then
  export GOROOT=/usr/local/Cellar/go/1.4.2/libexec
  export GOPATH=$HOME
  export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
fi

###
# powerline
###
# export PATH=$PATH:~/Library/Python/2.7/bin
# powerline-daemon -q
# . ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

###
# peco
###

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

# zmv
autoload -Uz zmv
alias zmv='noglob zmv -W'
