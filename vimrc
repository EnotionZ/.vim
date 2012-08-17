set nocompatible                  " Must come first because it changes other options.

" Make capital W also write to buffer
command W :w


if has("gui_running")
  set guioptions=egmrt
endif


highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
set colorcolumn=80


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



" enable pathongen
silent! call pathogen#runtime_append_all_bundles()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

"colorscheme VibrantInk
colorscheme peachpuff


"display invis chars
"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set listchars=tab:>-,extends:>,precedes:<
set list
hi SpecialKey ctermfg=0 guifg=#333333


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


"ConqueTerm
map <leader>x :ConqueTermTab bash<CR> source ~/.websrc && source ~/.myshell<CR>

" Fugitive shortcuts
map <leader>dg :diffget<CR>
map <leader>dp :diffput<CR>


" manually change to working directory
map <leader>cd :cd %:p:h<CR>:NERDTree %:p:h<CR>:pwd<CR>

" Use Ack for Grep
map <leader>g :Ack 






" Automatically remove trailing whitespace
" autocmd BufWritePre * :%s/\s\+$//e

" Color chart http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
"highlight Folded ctermfg=186 ctermbg=234
highlight JSLintError ctermbg=52
hi DiffChange ctermbg=234 ctermfg=129
hi Diffadd ctermbg=234 ctermfg=46
hi Diffdelete ctermbg=234 ctermfg=9
hi Visual ctermbg=239






" Autocompletion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list,longest,full    " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.
set cursorline

set numberwidth=5

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//.,  " Keep swap files in one location

" Automatically change the current directory
" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
" autocmd BufEnter * silent! lcd %:p:h

set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

"copy the indentation from the previous line
set autoindent
set copyindent


"Set tab autoindent
" http://vim.wikia.com/wiki/Indenting_source_code
set smartindent "automatically inserts one extra level of indentation in some cases
"set smarttab
"set tabstop=4 "with of tab character
"set shiftwidth=4
"set softtabstop=0
"set noexpandtab
"set preserveindent
"set shiftround " indent/outdent to nearest tabstops
"set cinkeys=0{,0},:,0#,!,!^F

autocmd FileType javascript setlocal autoindent tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab

set laststatus=2                  " Show the status line all the time


" Tab mappings.
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>


map <Leader>q :q<cr>
map <Leader>r :MRU<cr>
map <Leader>pp :NERDTreeToggle<cr>

" Toggle Tagbar
map <Leader>= :TagbarToggle<CR>

" Remove all files in buffer
map <Leader>e :BufOnly<CR>

" Open CommandT
map <Leader>\ :CommandT<CR>


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




" make tab do tabs at beginning and spaces elsewhere
function VaryTabs()
  if &expandtab
    return "\<Tab>"
  else
    let nonwhite = matchend(getline('.'),'\S')
    if nonwhite < 0 || col('.') <= nonwhite
      return "\<Tab>"
    else
      let pos = virtcol('.')
      let num = pos + &tabstop
      let num = num - (num % &tabstop) - pos +1
      return repeat(" ",num)
    endif
  endif
endfunction
inoremap <Tab> <C-R>=VaryTabs()<CR>





" disable end of line
"au BufWritePre * :set binary | set noeol
"au BufWritePost * :set nobinary | set eol
"
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

au BufWritePre  * call TempSetBinaryForNoeol()
au BufWritePost * call TempRestoreBinaryForNoeol()

fun! TempSetBinaryForNoeol()
  let s:save_binary = &binary
  if ! &eol && ! &binary
    setlocal binary
    if &ff == "dos" || &ff == "mac"
      undojoin | silent 1,$-1s#$#\=nr2char(13)
    endif
    if &ff == "mac"
      let s:save_eol = &eol
      undojoin | %join!
      " mac format does not use a \n anywhere, so don't add one when writing in
      " binary (uses unix format always)
      setlocal noeol
    endif
  endif
endfun

fun! TempRestoreBinaryForNoeol()
  if ! &eol && ! s:save_binary
    if &ff == "dos"
      undojoin | silent 1,$-1s/\r$/
    elseif &ff == "mac"
      undojoin | %s/\r/\r/g
      let &l:eol = s:save_eol
    endif
    setlocal nobinary
  endif
endfun

augroup END
