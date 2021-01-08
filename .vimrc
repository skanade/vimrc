syntax on
colorscheme desert

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

set nocompatible

runtime macros/matchit.vim

:iab sqlsel SELECT * FROM 
:iab sout System.out.println();
:iab linfo log.info();
:iab ilist List<Integer> list = new ArrayList<>();
:iab slist List<String> list = new ArrayList<>();
:iab llist List<Long> list = new ArrayList<>();
:iab jtest @Test public void test()

" sets 'path' to:
" - the directory of the current file
" - every subdirectory of the "current directory"
set path=.,**
" enables the wildmenu
set wildmenu

" ignore specific directories and files
"set wildignore+=*.min.*

" case-insensitive search
set wildignorecase

set spell

source ~/.vim/plugins.vim

au FileType java set tags=$HOME/dev/javasource/tags

" added these below after Learn Vimscript the Hard Way
" set matchtime=5

let mapleader=","
let maplocalleader=","

map <leader>- ddp
map <leader>_ ddkkp

set number

inoremap <c-u> <esc>gUwi
nnoremap <c-u> gUw

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

:iabbrev adn and
:iabbrev waht what
:iabbrev tehn then

nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
inoremap jk <esc>

nnoremap <leader>vsp :execute "rightbelow vsplit " . bufname("#")

" search for trailing whitespaces
nnoremap <leader>w :execute "normal! gg/ $\<cr>"

" following did NOT work
"nnoremap <leader>; :execute "normal! mqA;\<esc>`q"

" stop highlighting items from last search
nnoremap <leader>H :execute ":nohlsearch"

" search for word under the cursor
" nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

" shortcut for toggling showing line numbers
nnoremap <leader>n :setlocal number!<cr>
nnoremap <leader>fi :setlocal foldmethod=indent<cr>

augroup txt_file
    autocmd!
    :autocmd BufNewFile *.txt :write
augroup END
" indent HTML file automatically, turned off since we may not always want the following
" :autocmd BufWritePre *.html :normal gg=G

augroup html_file
    autocmd!
    :autocmd BufNewFile,BufRead *.html setlocal nowrap
augroup END

augroup javascript_file
    autocmd!
    :autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    :autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
augroup END

augroup java_file
    autocmd!
    :autocmd FileType java nnoremap <buffer> <localleader>c I//<esc>
"    :autocmd FileType java nnoremap <buffer> <localleader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " .java"<cr>:copen<cr>
nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
augroup END

augroup ruby_file
    autocmd!
    :autocmd FileType ruby nnoremap <buffer> <localleader>c I#<esc>
augroup END

augroup python_file
    autocmd!
    :autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
augroup END

set statusline=%f         " relative path to file
set statusline+=\ -\      " add a hyphen
set statusline+=FileType:
set statusline+=%y        " filetype
set statusline+=%=        " switch to right side
set statusline+=%c

set hlsearch
set incsearch

execute pathogen#infect()

nnoremap <leader>tt :TagbarToggle<CR>
