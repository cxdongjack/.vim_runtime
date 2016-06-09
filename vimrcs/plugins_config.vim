"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important: 
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" => Load NeoBundle
""""""""""""""""""""""""""""""
"call pathogen#infect('~/.vim_runtime/sources_forked/{}')
"call pathogen#infect('~/.vim_runtime/sources_non_forked/{}')
"call pathogen#helptags()

let neobundle_readme=expand('~/.vim_runtime/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    echo "Installing NeoBundle..."
    echo ""
    silent !mkdir -p ~/.vim_runtime/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim.git ~/.vim_runtime/bundle/neobundle.vim
endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim_runtime/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim_runtime/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Let NeoBundle manage local plugin
call neobundle#local('~/.vim_runtime/sources_forked', {})
call neobundle#local('~/.vim_runtime/sources_non_forked', {})

" Add or remove your Bundles here:
"NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'docunext/closetag.vim'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
"map <leader>nn :NERDTreeToggle<cr>
"map <leader>nb :NERDTreeFromBookmark 
"map <leader>nf :NERDTreeFind<cr>
map <leader>tt :NERDTreeToggle<cr>
map <leader>tf :NERDTreeFind<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NeoCompeteSnippet
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UniteFileNavigator
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" search
noremap <C-p> :MySearchFinder<CR> 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UniteGrep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use ag in unite grep source. 
let g:unite_source_grep_command ='ag'
let g:unite_source_grep_default_opts = '--skip-vcs-ignores --nocolor --nogroup --ignore-case --ignore log'            
let g:unite_source_grep_recursive_opt = ''
map <leader>gg :Unite grep:.::<CR>

" shortcut
vnoremap <silent> gs :call SearchSelection('gs', '')<CR>
function! SearchSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", ' ')

    if a:direction == 'gs'
        exe "Unite grep:.:-Q:" . l:pattern
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => js beautify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" or
autocmd FileType javascript noremap <buffer>  <leader>ft :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <leader>ft :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <leader>ft :call CSSBeautify()<cr>
