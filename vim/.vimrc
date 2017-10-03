inoremap jj <ESC>
inoremap zz <ESC>:update<cr>i
nnoremap zz :update<cr>
nnoremap wq :wq<cr>
let mapleader = "\<Space>"
 
set nocompatible
filetype plugin indent on
syntax on
ret encoding=utf-8
" set spell spelllang=en_us

" Unser arrow keys to break the bad habbit
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <ESC> <NOP>
