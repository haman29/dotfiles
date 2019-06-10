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
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('lifepillar/vim-solarized8')
  call dein#add('rking/ag.vim')
  call dein#add('keith/swift.vim')

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
nnoremap <Leader>df :Defx -split=vertical -winwidth=30 -direction=topleft<CR>
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('open', 'wincmd w \| drop')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction

" altercation/vim-colors-solarized
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
