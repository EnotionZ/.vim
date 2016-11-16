au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.less set filetype=less
au BufNewFile,BufRead *.dust setfiletype=dust syntax=html
au FileType javascript,less,dust setlocal autoindent tabstop=4 shiftwidth=4 softtabstop=0 expandtab
au BufRead,BufNewFile *.html,*.jsp,*.dust,*.less setlocal autoindent tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab
au BufRead,BufNewFile *.go set filetype=go

au BufNewFile,BufRead *.markdown,*.md,*.mdown,*.mkd,*.mkdn
      \ if &ft =~# '^\%(conf\|modula2\)$' |
      \   set ft=markdown |
      \ else |
      \   setf markdown |
      \ endif

" Automatic fold settings for specific files. Uncomment to use.
autocmd FileType python setlocal foldmethod=syntax expandtab tabstop=2 shiftwidth=2
autocmd FileType ruby setlocal foldmethod=syntax expandtab tabstop=2 shiftwidth=2
autocmd FileType css  setlocal foldmethod=indent expandtab shiftwidth=4 tabstop=4
autocmd FileType less  setlocal foldmethod=indent expandtab shiftwidth=4 tabstop=4
autocmd FileType scss  setlocal foldmethod=indent expandtab shiftwidth=4 tabstop=4

" Autocompletion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

au syntax mason so $VIMRUNTIME/syntax/mason.vim
au BufNewFile,BufRead *.mi set ft=mason
autocmd FileType mason setlocal foldmethod=syntax expandtab tabstop=2 shiftwidth=2
