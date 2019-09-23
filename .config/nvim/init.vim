execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set backspace=indent,eol,start
set background=dark
set clipboard=unnamed
set completeopt-=preview
" set cursorline
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
" set termguicolors
set undodir=$HOME/.vim/undo
set undofile
" set updatetime=100
set wildmenu
set wrap!
set wildignore+=**/node_modules/** 

set cmdheight=2
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes

syntax on
autocmd Filetype c setlocal tabstop=2
autocmd BufEnter * :syntax sync fromstart
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS<Paste>
" autocmd FileType css,sass,scss setlocal omnifunc=sasscomplete#CompleteSass noci

filetype plugin indent on

let mapleader = '\'
let g:netrw_banner = 0

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.jsx
" autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx

" Key mappings
nnoremap G Gzz
" nnoremap z zz
nnoremap <silent> <Leader>w :w<cr>
nnoremap <silent> <Leader><space> :noh<cr>
nnoremap <silent> <Leader>b :bd<cr>
nnoremap <silent> <Leader><Leader>b :bufdo bwipeout<cr>
nnoremap <silent> <Leader>q :q<cr>
nnoremap <silent> <Leader><Leader>q :q!<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <C-N> :bnext<CR>
nnoremap <silent> <C-A-N> :bprev<CR>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
nnoremap <leader>o <C-W>o<CR>
nnoremap n nzz
nnoremap N Nzz

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'prettier/vim-prettier'
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips'
Plug 'ianks/vim-tsx'
Plug 'chriskempson/base16-vim'
" Plug 'mattn/emmet-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'romainl/Apprentice'
Plug 'scrooloose/nerdtree'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'jiangmiao/auto-pairs'
Plug 'suy/vim-context-commentstring'
Plug 'mustache/vim-mustache-handlebars'
Plug 'Badacadabra/vim-archery'
Plug 'romainl/Apprentice'
Plug 'zacanger/angr.vim'
Plug 'owickstrom/vim-colors-paramount'
Plug 'maksimr/Lucius2'
Plug 'gruvbox-community/gruvbox'
Plug 'dunstontc/vim-vscode-theme'
Plug 'lifepillar/vim-solarized8'
Plug 'flrnprz/plastic.vim'
Plug 'jasoncarr0/sidewalk-colorscheme'
call plug#end()

" Coc
autocmd FileType json syntax match Comment +\/\/.\+$+
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? coc#rpc#request('doKeymap', ['snippets-expand-jump','']) :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gn <Plug>(coc-diagnostic-next)
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> go :CocList outline<CR>
nmap <silent><leader><leader>o :CocCommand tsserver.organizeImports<CR>

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" NERDTree
map <F2> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=50

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsSnippetDirectories = ['~/.vim/ultisnips', 'UltiSnips']
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', 'UltiSnips']

" You Complete Me
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_always_populate_location_list = 1
" nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
" nnoremap <tab>. :YcmCompleter FixIt<CR>

" Lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode' ], [ 'readonly', 'relativepath', 'gitbranch', 'modified' ] ],
      \ },
			\ 'component_function': {
			\   'gitbranch': 'fugitive#head'
			\ },
      \ }

" " Sort imports
" let g:import_sort_auto = 1

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

" Prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.json,*.md,*.yaml,*.html,*.hbs PrettierAsync

" colorscheme apprentice
colorscheme gruvbox

if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif


" now that you have automagically added the closing whatevs, hit Ctrl-l to
" instantly break out of the whatevs-pair, or hit Ctrl-x to remove the closing
" whatevs if you don't need it which is also handy if you forget about this
" hack and type in the closing whatevs yourself, effectively doubling up your
" closing whatevs and leaving you with syntax errors
imap <C-l> <Esc>:exec "normal f" . breakout<CR>a<Space>
imap <C-x> <Esc>:exec "normal f" . breakout<CR>xa<Space>

" Coc custom highlights
hi CocErrorFloat guibg=#dd4d4d
hi CocErrorFloat guifg=white
