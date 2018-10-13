" Use the Solarized Dark theme
"colorscheme 

set t_Co=256
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme PaperColor
set background=dark

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'rking/ag.vim'
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
Plugin 'prettier/vim-prettier'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'itchyny/lightline.vim'
Plugin 'NLKNguyen/papercolor-theme'


call vundle#end()            " required

filetype plugin indent on    " required
" Put your non-Plugin stuff after this line
" autocmd vimenter * NERDTree
" NERDTree show hidden files
let NERDTreeShowHidden=1
" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

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
" server-searcher
let g:ackprg = 'ag --nogroup --nocolor --column'
" let g:ackprg = 'ag --vimgrep'

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
set t_Co=256
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

" Map fzf GFiles
map ; :GFiles<CR>

" Map NerdTree
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gd :Gdiff<CR>
noremap <Leader>g :GFiles<CR>

noremap <S-l> gt
noremap <S-h> gT

" easy macros
nnoremap Q @q
vnoremap Q :norm @q<cr>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif
