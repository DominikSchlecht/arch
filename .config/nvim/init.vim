inoremap jj <ESC>
inoremap zz <ESC>:update<cr>i
nnoremap zz :update<cr>
nnoremap wq :wq<cr>
let mapleader = "\<Space>"
 
set nocompatible
set number

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
syntax on

set foldenable
set foldmethod=marker
set foldlevelstart=8
" nnoremap <space> za

set background=dark
colorscheme tokyo-metro

call vundle#begin('~/.config/nvim/plugins')

Plugin 'Markdown-syntax'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'chrisbra/csv.vim'
Plugin 'vim-scripts/vim-auto-save'

call vundle#end()            " required

" Autohide preview window in YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1

" Nerdtree-Toggle
map <C-n> :NERDTreeToggle<CR>

" Enable autosave by default
let g:auto_save = 1

" Easier navigation in vim
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
