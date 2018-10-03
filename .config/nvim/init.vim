" Options
set relativenumber

" Mappings
let mapleader = '\'
nnoremap <leader>w :w <Enter>

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
call plug#end()
