autocmd BufRead,BufNewFile *.mi set filetype=mason
au BufNewFile,BufRead *.markdown,*.md,*.mdown,*.mkd,*.mkdn set ft=markdown
au BufRead,BufNewFile *.go   set ft=go
au BufRead,BufNewFile *.scss set ft=scss
au BufRead,BufNewFile *.less set ft=less
au BufRead,BufNewFile *.dust set ft=dust
au BufRead,BufNewFile *.html.erb set ft=rails_view
au BufRead,BufNewFile *.json set ft=javascript

au BufRead,BufNewFile *.html,*.jsp,*.dust setlocal autoindent tabstop=2 shiftwidth=2 softtabstop=0 expandtab

au FileType c setlocal foldmethod=syntax expandtab tabstop=2 shiftwidth=2
au FileType mason,ruby,rails_view setlocal foldmethod=syntax expandtab tabstop=2 shiftwidth=2
au FileType css,less,scss,dust  setlocal foldmethod=indent expandtab tabstop=2 shiftwidth=2

" Autocompletion
au FileType python set omnifunc=pythoncomplete#Complete
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS

au syntax mason so $VIMRUNTIME/syntax/mason.vim
