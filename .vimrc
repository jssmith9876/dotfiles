"========================================================================
"			            Jordan Smith's .vimrc
"		            github: github.com/jssmith9876
"========================================================================

"""""""""""""""""""""
"      Plugins      "
"""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'dracula/vim',{'as':'dracula'}

call plug#end()

""""""""""""""""""""""
"  General Settings  "
""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set hidden
set number
set undofile
set spell
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set mouse=a
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set clipboard=unnamedplus
set confirm
set exrc
set updatetime=300
set redrawtime=10000



"""""""""""""""""""""
"     Key maps      "
"""""""""""""""""""""

" Quicker switching between windows
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l


" Quickly escape to normal mode
imap jj <esc>

" Easy insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

""""""""""""""""""""""""""
"  Coloring and Styling  "
""""""""""""""""""""""""""
colorscheme dracula
