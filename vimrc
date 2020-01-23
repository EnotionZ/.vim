" https://github.com/junegunn/vim-plug
" PlugInstall
" PlugUpdate
" PlugClean
" PlugUpgrade
" PlugStatus
call plug#begin('~/.vim/plugged')

Plug 'mileszs/ack.vim'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
let NERDTreeIgnore = ['\.pyc$','cache$','node_modules$']
let g:NERDTreeNodeDelimiter = "\u00a0"

Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

Plug 'ervandew/supertab'
Plug 'hail2u/vim-css3-syntax'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'nono/vim-handlebars'
Plug 'tpope/vim-rails'
Plug 'kchmck/vim-coffee-script'

Plug 'bling/vim-airline'
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

Plug 'ap/vim-css-color'
Plug 'kien/ctrlp.vim'

Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

Plug 'mxw/vim-jsx'
Plug 'groenewege/vim-less'
Plug 'othree/javascript-libraries-syntax.vim'

Plug 'jnwhiteh/vim-golang'
Plug 'jimmyhchan/dustjs.vim'
Plug 'flazz/vim-colorschemes'
Plug 'schickling/vim-bufonly'
Plug 'vim-ruby/vim-ruby'
Plug 'suan/vim-instant-markdown'
Plug 'nelstrom/vim-visual-star-search'
Plug 'plasticboy/vim-markdown'
Plug 'cakebaker/scss-syntax.vim'

Plug 'junegunn/limelight.vim'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = '#777777'
let g:limelight_paragraph_span = 0
let g:limelight_priority = -1

Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'

Plug 'dense-analysis/ale'
let b:ale_linters = ['stylelint', 'eslint']
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
hi ALEError ctermbg=Black ctermfg=Red
hi ALEErrorSign ctermbg=NONE ctermfg=red
hi ALEWarningSign ctermbg=NONE ctermfg=yellow
hi Error ctermfg=Black guifg=Black ctermbg=Red guibg=Red

Plug 'airblade/vim-gitgutter'
" Git Gutter Settings
" ]c or CtrlGn  - next hunk         ////  [c - prev hunk
" [a - toggle highlights ///   ]a - stage hunk
" <leader>hs - stage hunk (or call GitGutterStageHunk)
" <leader>hr - reset hunk (or call GitGutterRevertHunk)
nmap <C-G>j <Plug>(GitGutterNextHunk)
nmap <C-G>k <Plug>(GitGutterPrevHunk)
map [a :GitGutterLineHighlightsToggle<CR>
map ]a :GitGutterStageHunk<CR>
let g:gitgutter_max_signs=2500
autocmd BufWritePost * GitGutterAll

vmap <Enter> <Plug>(EasyAlign)

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
noremap <leader>sw :!find ~/.vim/swaps -name "*.sw*" -exec rm {} \;<CR>

" copy paste
nmap <leader>v :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
vmap <leader>x :w !pbcopy<CR><CR>

if exists("&undodir")
	set undodir=~/.vim/undo
endif

autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

syntax on " Enable syntax highlighting
map <F9> :if exists("g:syntax_on") <Bar> syntax off<Bar>set nolist<Bar>set nonumber<Bar>set norelativenumber<Bar> else <Bar> syntax enable<Bar> set list <Bar> set number<Bar>set relativenumber<Bar> endif<CR>

set cursorline " Highlight current line
hi CursorLine ctermbg=237
set lsp=4      " number of pixel lines to use between characters
set t_Co=256   " use 256 colors in vim
set cursorcolumn
hi CursorLine ctermbg=237

"let g:seoul256_background = 233
"if has("gui_running")
	"let g:seoul256_background = 235
"endif
"colorscheme seoul256
colorscheme cobalt2


" Show “invisible” characters
" set listchars=tab:>-,extends:>,precedes:<
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set lcs=tab:»\ ,trail:·
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

" Enable line numbers & relative line numbers
function! EnableRelativeNumber()
    set relativenumber
    au BufReadPost * set relativenumber
    au InsertEnter * set number
    au InsertLeave * set relativenumber
endfunction

function! DisableRelativeNumber()
    set nonumber
    set norelativenumber
    au InsertEnter * set nonumber
    au InsertLeave * set norelativenumber
    au BufReadPost * set norelativenumber
endfunction

if exists("&relativenumber")
	call EnableRelativeNumber()
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set maxmempattern=5000
augroup TextFiles
autocmd!
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
noremap <Up> gk
noremap <Down> gj
noremap <Left> h
noremap <Right> l

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

" ALE shortcuts
nmap <c-j> :ALENext<cr>
nmap <c-k> :ALEPrevious<cr>

" manually change to working directory
map <leader>cd :cd %:p:h<CR>:NERDTree %:p:h<CR>:pwd<CR>
map <leader>[ :NERDTree %:p:h<CR>
map <leader>] :NERDTreeTabsClose<CR>
map <Leader>nt :NERDTreeTabsToggle<cr>

" Use Ack for Grep
map <leader>g :Ack






" Color chart http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
"highlight Folded ctermfg=186 ctermbg=234
highlight DiffChange ctermbg=234 ctermfg=129
highlight Diffadd ctermbg=234 ctermfg=46
highlight Diffdelete ctermbg=234 ctermfg=9







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
map <Leader><bar> :let g:ctrlp_working_path_mode = 'c' <bar> CtrlP<CR>
map <Leader>\ :let g:ctrlp_working_path_mode = 'ra' <bar> CtrlP<CR>
map <Leader>o :let g:ctrlp_working_path_mode = 'ra' <bar> CtrlPMixed<CR>
map <Leader>r :CtrlPMRU<cr>
"map <Leader>o :CtrlPBuffer<CR>

" ignore
set wildignore+=node_modules,bower_components,*/public/components/*,*/cache/*,dist

" Remove all files in buffer
map <Leader>e :BufOnly<CR> :tabo<CR>


" folding settings
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=1

function! s:StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
" Strip trailing whitespace (/ss)
noremap <leader>ws :call <SID>StripWhitespace()<CR>
" Strip trailing whitespace (on write)
" autocmd BufWritePre * call <SID>StripWhitespace()


" force reloading of filetype
filetype off
filetype on

" fast autocompletion
" http://stackoverflow.com/questions/2169645/vims-autocomplete-is-excruciatingly-slow
set complete-=i

set foldmethod=manual

" autoswitch to paste mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction


" toggles numbers and special characters to copy
function! CopyModeToggle()
    if !exists("t:cpToggle") || t:cpToggle is 0
        set nolist
        let t:cpToggle = 1
        let g:ale_sign_column_always = 0
        call DisableRelativeNumber()
        call g:NERDTree.Close()
        call gitgutter#disable()
        call ale#toggle#Disable()
    else
        set lcs=tab:»\ ,trail:·
        set list
        let t:cpToggle = 0
        let g:ale_sign_column_always = 1
        call EnableRelativeNumber()
        call gitgutter#enable()
        call ale#toggle#Enable()
    endif
endfunction
command! -bar CopyModeToggle call CopyModeToggle()

" https://github.com/junegunn/goyo.vim - distraction-free writing
function! s:goyo_enter()
    call DisableRelativeNumber()
    Limelight
endfunction

function! s:goyo_leave()
    call EnableRelativeNumber()
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
