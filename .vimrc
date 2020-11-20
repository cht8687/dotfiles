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
Plugin 'morhetz/gruvbox'
Plugin 'roxma/nvim-yarp'
Plugin 'tpope/vim-surround'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'itchyny/lightline.vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'scrooloose/nerdcommenter'
Plugin 'brooth/far.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 't9md/vim-choosewin' 
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'vim-syntastic/syntastic'
Plugin 'neoclide/coc.nvim'
Plugin 'frazrepo/vim-rainbow'
Plugin 'rbgrouleff/bclose.vim'
Plugin 'leafOfTree/vim-svelte-plugin'
Plugin 'voldikss/vim-floaterm'
Plugin 'benmills/vimux'
call vundle#end()            " required

colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_light='soft'
let g:gruvbox_hls_cursor='purple'

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
" set completeopt=longest,menu
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
"noremap <Leader>F :Files<CR>
noremap <Leader>f :Rag<SPACE>
noremap <Leader>b :Buffers<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz" }}}
nnoremap <leader>tt :FloatermNew<CR>
nnoremap <C-p> :FloatermNew fzf<CR>
"noremap <Leader>f :FloatermNew Ag<CR>
nnoremap <leader>rr :FloatermNew ranger<CR>
" }}}
"
" Copy & Paste {{{
noremap <Leader>c "+c<CR>
noremap <Leader>d "_d
vnoremap <Leader>d "_d
xnoremap p "_dP
noremap <Leader>cp "+p<CR>
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

" vim-choosewin {{{
nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1
" tmux-like overlay color
	let g:choosewin_color_overlay = {
	      \ 'gui': ['DodgerBlue3', 'DodgerBlue3'],
	      \ 'cterm': [105, 105]
	      \ }
	let g:choosewin_color_overlay_current = {
	      \ 'gui': ['firebrick1', 'firebrick1'],
	      \ 'cterm': [124, 124]
	      \ }
" }}}

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)


" Switch buffer
nnoremap gn :bnext<CR>
nnoremap gp :bprevious<CR>

" auto refresh a file when it is changed
au FocusGained,BufEnter * :silent! !

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown

" fzf configs enable Rag {{{
command! -bang -nargs=+ -complete=dir Rag call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
" }}}


"c-Tag {{{
set tags=tags
" }}}

"markdown {{{
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Google Chrome'
" }}}
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"mouse {{{
" set mouse-=a
" }}}

"pane {{{
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
" }}}

"coc {{{
"
" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
"
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
 inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
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
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

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

" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

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

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

command! -nargs=0 Prettier :CocCommand prettier.formatFile
"}}}

endif

"mark {{{
"nnoremap ` :Marks<CR>
"}}}

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

let g:rainbow_active = 1

"custom bindings {{{
"test helpers {{{
map <leader>testo :s/describe(/describe\.only(/<CR>:noh<CR>:w<CR>:VimuxPromptCommand<CR>npm run test<CR>
map <leader>test :noh<CR>:w<CR>:VimuxPromptCommand<CR>npm run test<CR>
map <leader>dev :noh<CR>:w<CR>:VimuxPromptCommand<CR>npm run dev<CR>
map <leader>start :noh<CR>:w<CR>:VimuxPromptCommand<CR>npm run start<CR>
"}}}
"}}}