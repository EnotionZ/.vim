au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.less set filetype=less
autocmd BufNewFile,BufRead *.dust setfiletype=dust syntax=html
autocmd FileType javascript,less,dust setlocal autoindent tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab
autocmd BufRead,BufNewFile *.html,*.jsp,*.dust,*.less setlocal autoindent tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab
au BufRead,BufNewFile *.go set filetype=go
