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
