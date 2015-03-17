" https://github.com/junegunn/vim-plug
" PlugInstall
" PlugUpdate
" PlugClean
" PlugUpgrade
" PlugStatus
call plug#begin('~/.vim/plugged')
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'myusuf3/numbers.vim'
Plug 'ervandew/supertab'
Plug 'hail2u/vim-css3-syntax'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'nono/vim-handlebars'
Plug 'tpope/vim-rails'
Plug 'kchmck/vim-coffee-script'
Plug 'wookiehangover/jshint.vim'
Plug 'bling/vim-airline'
Plug 'ap/vim-css-color'
Plug 'kien/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'groenewege/vim-less'
Plug 'airblade/vim-gitgutter'
Plug 'jnwhiteh/vim-golang'
Plug 'jimmyhchan/dustjs.vim'
Plug 'flazz/vim-colorschemes'
Plug 'schickling/vim-bufonly'
Plug 'junegunn/seoul256.vim'

Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
call plug#end()

" Use Node.js for JavaScript interpretation
" let $JS_CMD='node'

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
"let mapleader=","
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

" copy paste
nmap <leader>v :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
vmap <leader>x :w !pbcopy<CR><CR>

vmap <Enter> <Plug>(EasyAlign)

if exists("&undodir")
	set undodir=~/.vim/undo
endif

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
map <F9> :if exists("g:syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif<CR>

" Highlight current line
set cursorline

" number of pixel lines to use between characters
set lsp=4

" use 256 colors in vim
set t_Co=256

let g:seoul256_background = 233
if has("gui_running")
	let g:seoul256_background = 235
endif
colorscheme seoul256


" Show “invisible” characters
" set listchars=tab:>-,extends:>,precedes:<
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set lcs=tab:.\ ,trail:·
set list

" Enable mouse in insert mode
set mouse=i
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI

" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif

inoremap jj <ESC>

" Make capital W also write to read-only buffer
if !exists(":W")
	command W :w !sudo tee % > /dev/null<CR>
endif



" highlight anything over 80 column red
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
set colorcolumn=80
highlight ColorColumn ctermbg=black
highlight SignColumn ctermbg=black


"" airline settings
" remove separators
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#ctrlp#show_adjacent_modes = 1
"let g:airline_theme='kolor'
" set second section to filename
"let g:airline_section_b="%f"
" empty third and fourth sections
"let g:airline_section_x=""
let g:airline_section_c="%f"
let g:airline_section_y=""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set maxmempattern=5000
augroup TextFiles
autocmd!
" Turn off colors
autocmd BufEnter *.txt syntax off
" Check spelling
" autocmd BufEnter *.txt,*.html,README set spell
augroup END " TextFiles



filetype plugin indent on         " Turn on file type detection.




" + and - in edit mode to change horizontal split width
if bufwinnr(1)
  map + <C-W>2>
  map - <C-W>2<
endif

nnoremap <F3> :NumbersToggle<CR>


" Disable arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Return shows file path
nnoremap <CR> :echo expand('%:p')<CR><CR>


"start visual mode with previous area reselected
vmap > >gv
vmap < <gv

" insert mode mapping for ctrl hjkl to move
imap <C-H> <Left>
imap <C-J> <Down>
imap <C-K> <Up>
imap <C-L> <Right>
imap <C-X> <del>

nmap <c-l> :noh<CR>
imap <c-l> <Esc>:noh<CR>o

" Fugitive shortcuts
map <leader>s :Gstatus<CR>
map <leader>d :Gdiff<CR>
map <leader>dg :diffget<CR>
map <leader>dp :diffput<CR>


" manually change to working directory
map <leader>cd :cd %:p:h<CR>:NERDTree %:p:h<CR>:pwd<CR>
map <leader>[ :NERDTree %:p:h<CR>
map <leader>] :NERDTreeClose<CR>
map <Leader>nt :NERDTreeToggle<cr>

" Use Ack for Grep
map <leader>g :Ack






" Automatically remove trailing whitespace
" autocmd BufWritePre * :%s/\s\+$//e

" Color chart http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
"highlight Folded ctermfg=186 ctermbg=234
highlight JSHintError ctermbg=238
highlight DiffChange ctermbg=234 ctermfg=129
highlight Diffadd ctermbg=234 ctermfg=46
highlight Diffdelete ctermbg=234 ctermfg=9






" Autocompletion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set hidden                        " Handle multiple buffers better.

set wildmode=list,longest,full    " Complete files like a shell.


set numberwidth=5

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.

" Automatically change the current directory
" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
" autocmd BufEnter * silent! lcd %:p:h


"copy the indentation from the previous line
set autoindent
set copyindent


"set tabstop=2                    " Global tab width.
"set shiftwidth=2                 " And again, related.
"set expandtab                    " Use spaces instead of tabs

set tabstop=4
set shiftwidth=4
set softtabstop=0
set noexpandtab

"Set tab autoindent
" http://vim.wikia.com/wiki/Indenting_source_code
set smartindent "automatically inserts one extra level of indentation in some cases
"set smarttab
"set preserveindent
"set shiftround " indent/outdent to nearest tabstops
"set cinkeys=0{,0},:,0#,!,!^F

set laststatus=2                  " Show the status line all the time


" Tab mappings.
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>


map <Leader>q :NERDTreeClose<cr>:q<cr>

" Open CtrlP
map <Leader>o :CtrlPMixed<CR>
map <Leader><bar> :let g:ctrlp_working_path_mode = 'c' <bar> CtrlP<CR>
map <Leader>\ :let g:ctrlp_working_path_mode = 'ra' <bar> CtrlP<CR>
map <Leader>r :CtrlPMRU<cr>
"map <Leader>o :CtrlPBuffer<CR>

" ignore
set wildignore+=node_modules,bower_components,*/public/components/*,*/cache/*

" Remove all files in buffer
map <Leader>e :BufOnly<CR> :tabo<CR>


" Automatic fold settings for specific files. Uncomment to use.
autocmd FileType ruby setlocal foldmethod=syntax
autocmd FileType css  setlocal foldmethod=indent shiftwidth=3 tabstop=3
autocmd FileType less  setlocal foldmethod=indent shiftwidth=3 tabstop=3

" folding settings
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=1


" Reads json like JavaScript
autocmd BufNewFile,BufRead *.json set ft=javascript


let g:syntastic_java_checkers=['javac']
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_less_checkers=['less-lint']
" let JSHintUpdateWriteOnly=1


let NERDTreeIgnore = ['\.pyc$','cache$','node_modules$']

function! s:StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
" Strip trailing whitespace (/ss)
noremap <leader>ss :call <SID>StripWhitespace()<CR>
" Strip trailing whitespace (on write)
" autocmd BufWritePre * call <SID>StripWhitespace()


" force reloading of filetype
filetype off
filetype on

" fast autocompletion
" http://stackoverflow.com/questions/2169645/vims-autocomplete-is-excruciatingly-slow
set foldmethod=manual
