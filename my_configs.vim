set nu

" Add a bit extra margin to the left
set foldcolumn=0

" build
autocmd BufWritePost *.tpl execute '!~/browser-fe/common/build/tpl.py %'

" update the ctags
"map <leader>a :call vimproc#system("cd " . FindGitRoot(bufname("%")) . ";ctag -R .")

" Switch CWD to the directory of the open buffer
map <leader>cg :exe "cd".FindGitRoot(bufname("%"))<cr>
