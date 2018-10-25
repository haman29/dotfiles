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
autocmd FileType go  setlocal ts=4 sw=4 sts=4 noet
autocmd FileType vim setlocal ts=2 sw=2 sts=2 et

" 全角スペース可視化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

""""""""""""
" dein.vim "
""""""""""""
if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " for deoplete.nvim, defx.nvim
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/defx.nvim')

  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

" Shougo/deoplete.vim
let g:deoplete#enable_at_startup = 1

" Shougo/deinte.nvim
nnoremap [denite]  <Nop>
nmap     <Leader>u [denite]
nnoremap <silent> [denite]u  :<C-u>Denite buffer file/rec<CR>
nnoremap <silent> [denite]l  :<C-u>Denite line<CR>
nnoremap <silent> [denite]c  :<C-u>Denite command<CR>
call denite#custom#map('normal', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('normal', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')

" Shougo/defx.vim
nnoremap <silent><buffer><expr> <CR> defx#do_action('open', 'wincmd w \| drop')
