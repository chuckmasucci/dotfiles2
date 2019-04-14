set backspace=indent,eol,start
set clipboard=unnamedplus
set completeopt-=preview
set expandtab
set guifont=FuraCode\ Nerd\ Font:11
set hidden
set ignorecase
set linespace=0
set nolazyredraw
set noshowmode
set number
set omnifunc=syntaxcomplete#Complete
set path+=**
set relativenumber
set shiftwidth=0
set showcmd
set smartcase
set splitright
set tabstop=2
set termguicolors
set undodir=$HOME/.vim/undo
set undofile
set updatetime=100
set wildmenu
set wrap!
syntax on
autocmd Filetype c setlocal tabstop=2
autocmd BufEnter * :syntax sync fromstart

filetype plugin indent on

let mapleader = '\'
let g:netrw_banner = 0

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

" Key mappings
nnoremap G Gzz
nnoremap z zz
nnoremap <silent> <Leader>w :w<cr>
nnoremap <silent> <Leader><space> :noh<cr>
nnoremap <silent> <Leader>b :bd<cr>
nnoremap <silent> <Leader><Leader>b :bufdo bwipeout<cr>
nnoremap <silent> <Leader>q :q!<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <C-N> :bnext<CR>
nnoremap <silent> <C-A-N> :bprev<CR>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
nnoremap <leader>o <C-W>o<CR>

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'prettier/vim-prettier'
Plug 'ruanyl/vim-sort-imports'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --ts-completer' }
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips'
Plug 'ianks/vim-tsx'
Plug 'tomasiser/vim-code-dark'
Plug 'romainl/Apprentice'
Plug 'scrooloose/nerdtree'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'mustache/vim-mustache-handlebars'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'reasonml-editor/vim-reason-plus'
Plug 'mattn/emmet-vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call plug#end()

" NERDTree
map <F2> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsSnippetDirectories = ['~/.vim/ultisnips', 'UltiSnips']
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', 'UltiSnips']

" You Complete Me
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_always_populate_location_list = 1
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <tab>. :YcmCompleter FixIt<CR>

" Lightline
let g:lightline = { 'colorscheme': 'Tomorrow_Night' }
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
      \ 'active': {
      \   'left': [ [ 'mode' ], [ 'readonly', 'relativepath', 'gitbranch', 'modified' ] ],
      \ },
			\ 'component_function': {
			\   'gitbranch': 'fugitive#head'
			\ },
      \ }

" Sort imports
let g:import_sort_auto = 1

"" Buftabline settings
let g:buftabline_indicators = 1
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)

" devicons
let g:webdevicons_enable = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" " ctrlp
" let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.json,*.md,*.yaml,*.html,*.hbs PrettierAsync

" Colorscheme
" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   source ~/.vimrc_background
" endif
colorscheme apprentice

if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

" this automagically adds closing whatevs when typing the opening whatevs, and
" keeps your insert mode inside the whatevs so there's no friction when you're
" in teh c0dez
inoremap ( ()<Esc>:let breakout=")"<CR>i
inoremap [ []<Esc>:let breakout="]"<CR>i
inoremap { {}<Esc>:let breakout="}"<CR>i
inoremap < <><Esc>:let breakout=">"<CR>i

" now that you have automagically added the closing whatevs, hit Ctrl-l to
" instantly break out of the whatevs-pair, or hit Ctrl-x to remove the closing
" whatevs if you don't need it which is also handy if you forget about this
" hack and type in the closing whatevs yourself, effectively doubling up your
" closing whatevs and leaving you with syntax errors
imap <C-l> <Esc>:exec "normal f" . breakout<CR>a<Space>
imap <C-x> <Esc>:exec "normal f" . breakout<CR>xa<Space>
