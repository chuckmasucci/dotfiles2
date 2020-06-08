syntax on
set backspace=indent,eol,start
set background=dark
set clipboard=unnamedplus
set completeopt-=preview
set cmdheight=2
set expandtab
set guifont=FuraCode\ Nerd\ Font:11
set hidden
set ignorecase
set laststatus=2
set termguicolors
set linespace=0
set nobackup
set nolazyredraw
set noshowmode
set nowritebackup
set number
set omnifunc=syntaxcomplete#Complete
set path+=**
set relativenumber
set shiftwidth=0
set shortmess+=c
set showcmd
set signcolumn=yes
set smartcase
set splitright
set tabstop=2
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm
set t_8f=\e[38;2;%lu;%lu;%lum
set t_8b=\e[48;2;%lu;%lu;%lum
set t_Co=256
set undodir=$HOME/.vim/undo
set undofile
set wildmenu
set wrap!
set wildignore+=**/node_modules/** 
set updatetime=300
set timeoutlen=300
filetype plugin indent on
let mapleader = '\'

" Key mappings
nnoremap G Gzz
nnoremap <silent> <Leader>w :w<cr>
nnoremap <silent> <Leader><space> :noh<cr>
nnoremap <silent> <Leader>b :BW<cr>
nnoremap <silent> <Leader><Leader>b :bufdo bwipeout<cr>
nnoremap <silent> <Leader>q :q<cr>
nnoremap <silent> <Leader><Leader>q :q!<cr>
nnoremap <silent> <C-N> :bnext<CR>
nnoremap <silent> <C-A-N> :bprev<CR>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
nnoremap <leader>o <C-W>o<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-o> <C-o>zz
nnoremap <silent> <Leader>s :vsp<cr>
inoremap <F1> <Esc>
noremap <F1> :call MapF1()<CR>

" Functions
function! MapF1()
  if &buftype == "help"
    exec 'quit'
  else
    exec 'help'
  endif
endfunction

" Statusline
if filereadable(expand("~/.config/nvim/statusline.vim"))
  source ~/.config/nvim/statusline.vim
 endif

" Plugins
if filereadable(expand("~/.config/nvim/plugins.vim"))
  source ~/.config/nvim/plugins.vim
 endif

" Colorscheme
if filereadable(expand("~/.config/nvim/colorscheme.vim"))
  source ~/.config/nvim/colorscheme.vim
 endif

" vim-grepper
if filereadable(expand("~/.config/nvim/configs/vim-grepper.vim"))
  source ~/.config/nvim/configs/vim-grepper.vim
 endif

" nerdtree
if filereadable(expand("~/.config/nvim/configs/needtree.vim"))
  source ~/.config/nvim/configs/needtree.vim
 endif

" coc.nvim
if filereadable(expand("~/.config/nvim/configs/coc.vim"))
  source ~/.config/nvim/configs/coc.vim
 endif

" vim-jsx-pretty
if filereadable(expand("~/.config/nvim/configs/vim-jsx-pretty.vim"))
  source ~/.config/nvim/configs/vim-jsx-pretty.vim
 endif

" fuzzysearch
if filereadable(expand("~/.config/nvim/configs/fuzzysearch.vim"))
  source ~/.config/nvim/configs/fuzzysearch.vim
 endif

" vim-buftabline
if filereadable(expand("~/.config/nvim/configs/vim-buftabline.vim"))
  source ~/.config/nvim/configs/vim-buftabline.vim
 endif

" vim-prettuer
if filereadable(expand("~/.config/nvim/configs/vim-prettier.vim"))
  source ~/.config/nvim/configs/vim-prettier.vim
 endif

" vim-prettuer
if filereadable(expand("~/.config/nvim/configs/vim-devicons.vim"))
  source ~/.config/nvim/configs/vim-devicons.vim
 endif

" vim-prettuer
if filereadable(expand("~/.config/nvim/configs/vim-tmux-navigator.vim"))
  source ~/.config/nvim/configs/vim-tmux-navigator.vim
 endif

" Folding
set foldmethod=indent
set viewoptions=cursor,folds,slash,unix
autocmd BufWrite * mkview
autocmd BufRead * silent loadview
