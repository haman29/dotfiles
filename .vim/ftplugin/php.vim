let php_sql_query=1
let php_htmlInStrings=1
" let php_folding=1
autocmd Syntax php set fdm=syntax
autocmd filetype php :set makeprg=php\ -l\ %
autocmd filetype php :set errorformat=%m\ in\ %f\ on\ line\ %l
" switch 文でインデントする
let g:PHP_vintage_case_default_indent = 1

setl dict+=~/.vim/dict/php.dict

