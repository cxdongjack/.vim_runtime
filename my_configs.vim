set nu
set mouse= 
inoremap jk <esc>

" Add a bit extra margin to the left
set foldcolumn=0

" build
autocmd BufWritePost *.tpl execute '!~/kits/bin/tpl %'

" update the ctags
"map <leader>a :call vimproc#system("cd " . FindGitRoot(bufname("%")) . ";ctag -R .")

" Switch CWD to the directory of the open buffer
autocmd BufEnter * :exe "cd".FindGitRoot(bufname("%"))

" Switch CWD to the directory of the open buffer
" map <leader>cg :exe "cd".FindGitRoot(bufname("%"))<cr>

map <leader>bb :execute 'Unite bookmark'<cr>

nmap <leader>tg :!(bash gen-tags.sh)<cr>
