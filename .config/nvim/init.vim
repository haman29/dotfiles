let mapleader = ","

set number
set clipboard+=unnamed
set inccommand=split
set ruler
set list
set cursorline
set smartcase
set virtualedit+=block
nmap <ESC><ESC> :nohlsearch<CR><ESC>
vnoremap <leader>r "xy:%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>
vnoremap $ $h

" space/tab 設定
set tabstop=4 shiftwidth=4 softtabstop=0 expandtab
autocmd FileType go setlocal ts=4 sw=4 sts=4 noet

" 全角スペース可視化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/
