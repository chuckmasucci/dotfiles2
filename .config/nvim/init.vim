
set number
set relativenumber

" Options
autocmd BufEnter * :syntax sync fromstart
syntax on
set termguicolors
set shiftwidth=2
set expandtab
autocmd Filetype c setlocal tabstop=2

" Use default clipboard
set clipboard=unnamedplus

" Mappings
let mapleader = '\'

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'Chiel92/vim-autoformat'
Plug 'ap/vim-buftabline'
Plug 'easymotion/vim-easymotion'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'arakashic/chromatica.nvim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
call plug#end()

set guifont=FuraCode\ Nerd\ Font:11
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Buftabline settings
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-A-N> :bprev<CR>

" Gutentags settings
let gutentags_enabled=0

" Set the color scheme
colorscheme codedark

" Save file
nnoremap <Leader>w :w<cr>

" Close buffer
nnoremap <Leader>b :bd<cr>

" Clear search highlighting
nnoremap <Leader><space> :noh<cr>

" Split config
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Ayu theme settings
" let ayucolor="mirage"

