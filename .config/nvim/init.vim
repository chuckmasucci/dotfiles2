" Line numbers
set number
set relativenumber

" Options
set shiftwidth=4
set expandtab
autocmd Filetype c setlocal tabstop=4
autocmd BufEnter * :syntax sync fromstart
syntax on
set termguicolors

" Autoformat on save
au BufWrite * :Autoformat

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
call plug#end()

" Buftabline settings
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-A-N> :bprev<CR>

" Chromatica settings
let g:chromatica#responsive_mode=1

" Set the color scheme
colorscheme codedark

" Save file
nnoremap <Leader>w :w<cr>

" Close buffer
nnoremap <Leader>b :bd<cr>

" Clear search highlighting
nnoremap <Leader><space> :noh<cr>
