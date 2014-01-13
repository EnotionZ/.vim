" enable pathongen
silent! call pathogen#runtime_append_all_bundles()

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
" Highlight current line
set cursorline

" number of pixel lines to use between characters
set lsp=4

" use 256 colors in vim
set t_Co=256


"colorscheme VibrantInk
colorscheme toothpik


" Show “invisible” characters
" set listchars=tab:>-,extends:>,precedes:<
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
highlight SpecialKey  ctermfg=black
set lcs=tab:▸\ ,trail:·
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
command W :w !sudo tee % > /dev/null<CR>



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
" remove unused modes
let g:airline_enable_fugitive=0
let g:airline_enable_syntastic=0
" set second section to filename
let g:airline_section_b="%f"
" empty third and fourth sections
let g:airline_section_c=""
let g:airline_section_x=""
" put filetype in fifth section
let g:airline_section_y="%Y"


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

" Return clears higlight
nnoremap <CR> :noh<CR> :echo expand('%:p')<CR><CR>


"start visual mode with previous area reselected
vmap > >gv
vmap < <gv

" insert mode mapping for ctrl hjkl to move
imap <C-H> <Left>
imap <C-J> <Down>
imap <C-K> <Up>
imap <C-L> <Right>
imap <C-X> <del>


" Fugitive shortcuts
map <leader>s :Gstatus<CR>
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
highlight Visual ctermbg=239






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

autocmd BufRead,BufNewFile *.less setfiletype=less
autocmd BufNewFile,BufRead *.dust setfiletype=dust syntax=html
autocmd FileType javascript,less,dust setlocal autoindent tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab
autocmd BufRead,BufNewFile *.html,*.jsp,*.dust,*.less setlocal autoindent tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab

set laststatus=2                  " Show the status line all the time


" Tab mappings.
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>


map <Leader>q :q<cr>

" Open CtrlP
map <Leader>\ :CtrlP<CR>
map <Leader>o :CtrlPMixed<CR>
map <Leader>r :CtrlPMRU<cr>

" ignore
set wildignore+=node_modules,bower_components,*/public/components/*,*/cache/*

" Toggle Tagbar
map <Leader>= :TagbarToggle<CR>

" Remove all files in buffer
map <Leader>e :BufOnly<CR>


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


let NERDTreeIgnore = ['\.pyc$','cache$','node_modules$']



function! s:StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
" Strip trailing whitespace (/ss)
noremap <leader>ss :call StripWhitespace()<CR>
" Strip trailing whitespace (on write)
autocmd BufWritePre * call <SID>StripWhitespace()



" http://vim.wikia.com/wiki/Preserve_missing_end-of-line_at_end_of_text_files
" Preserve noeol (missing trailing eol) when saving file. In order
" to do this we need to temporarily 'set binary' for the duration of
" file writing, and for DOS line endings, add the CRs manually.
" For Mac line endings, also must join everything to one line since it doesn't
" use a LF character anywhere and 'binary' writes everything as if it were Unix.
" This works because 'eol' is set properly no matter what file format is used,
" even if it is only used when 'binary' is set.
augroup automatic_noeol
  au!
  au BufWritePre  * call <SID>TempSetBinaryForNoeol()
  au BufWritePost * call <SID>TempRestoreBinaryForNoeol()
augroup END

function! s:TempSetBinaryForNoeol()
  let s:save_binary = &binary
  if ! &eol && ! &binary
    let s:save_view = winsaveview()
    setlocal binary
    if &ff == "dos" || &ff == "mac"
      if line('$') > 1
        undojoin | exec "silent 1,$-1normal! A\<C-V>\<C-M>"
      endif
    endif
    if &ff == "mac"
      undojoin | %join!
      " mac format does not use a \n anywhere, so we don't add one when writing
      " in binary (which uses unix format always). However, inside the outer
      " if statement, we already know that 'noeol' is set, so no special logic
      " is needed.
    endif
  endif
endfunction

function! s:TempRestoreBinaryForNoeol()
  if ! &eol && ! s:save_binary
    if &ff == "dos"
      if line('$') > 1
        " Sometimes undojoin gives errors here, even when it shouldn't.
        " Suppress them for now...if you can figure out and fix them instead,
        " please update http://vim.wikia.com/wiki/VimTip1369
        silent! undojoin | silent 1,$-1s/\r$//e
      endif
    elseif &ff == "mac"
      " Sometimes undojoin gives errors here, even when it shouldn't.
      " Suppress them for now...if you can figure out and fix them instead,
      " please update http://vim.wikia.com/wiki/VimTip1369
      silent! undojoin | silent %s/\r/\r/ge
    endif
    setlocal nobinary
    call winrestview(s:save_view)
  endif
endfunction


" force reloading of filetype
filetype off
filetype on
