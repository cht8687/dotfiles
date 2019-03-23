set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'isRuslan/vim-es6'
Plugin 'junegunn/fzf.vim'
Plugin 'mhartington/oceanic-next'
Plugin 'othree/yajs.vim'
Plugin 'othree/html5.vim'
Plugin 'styled-components/vim-styled-components'
Plugin 'sheerun/vim-polyglot'
Plugin 'rakr/vim-one'
Plugin 'junegunn/seoul256.vim'
Plugin 'roxma/nvim-yarp'
Plugin 'tpope/vim-surround'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'itchyny/lightline.vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'scrooloose/nerdcommenter'
Plugin 'w0rp/ale'
Plugin 'prettier/vim-prettier'
Plugin 'Shougo/deoplete.nvim'
Plugin 'brooth/far.vim'
Plugin 'tpope/vim-unimpaired'

call vundle#end()            " required

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background = 234
colo seoul256

filetype plugin indent on    " required
" Put your non-Plugin stuff after this line
" autocmd vimenter * NERDTree
" NERDTree show hidden files
let NERDTreeShowHidden=1
" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
set diffopt+=vertical
set cursorcolumn 
set cursorline

" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
" set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
"auto complete
set completeopt=longest,menu
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Show JSX
let g:jsx_ext_required = 1
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" vim-javascript settings
let g:javascript_plugin_jsdoc = 1

" Strip trailing whitespace (,ss)
let g:polyglot_disabled = ['graphql']

"deoplete auto-complete
let g:deoplete#enable_at_startup = 1

"lightline show full path
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
      \ }
      \ }

"lyglot_disabled = ['css']
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" remap j and k to scroll by visual lines
nnoremap j gj
nnoremap k gk
"split the window 
nnoremap <leader>z :vsplit<cr> 
nnoremap <leader>Z :split<cr> 
"save file
nnoremap <leader>s :w<cr>
nnoremap <leader>S :wa<cr>

" Map NerdTree
nnoremap <Leader>t :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

" Search {{{
let g:ag_working_path_mode="r"
set showmatch
set scrolloff=5
set smartcase
set hlsearch
set incsearch
set list
set ignorecase
nnoremap <Leader><SPACE> :nohlsearch<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gd :Gdiff<CR>
noremap <Leader>g :GFiles<CR>
noremap <Leader>ag :Ag<SPACE>
noremap <Leader>f :Files<CR>
noremap <Leader>b :Buffers<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz" }}}
" }}}
"
" Copy & Paste {{{
noremap <Leader>c "+c<CR>
noremap <Leader>p "+p<CR>
noremap <Leader>y "+y<CR>
noremap <Leader>ya gg"*yG<CR>
" }}}

" Motions {{{
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
" }}}

noremap <S-l> gt
noremap <S-h> gT
nnoremap <leader>ls :Ex<CR>
noremap <Leader>nh :noh<CR>
nnoremap ; :

" easy macros
nnoremap Q @q
vnoremap Q :norm @q<cr>

" Switching tabs {{{
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>l gt
nnoremap <leader>h gT
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
" }}}

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

xnoremap p "_dP

" Switch buffer
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" auto refresh a file when it is changed
au FocusGained,BufEnter * :silent! !


" Prettier configs {{{
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync
" }}}


" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown


let $FZF_DEFAULT_COMMAND = 'ag -g ""'

endif