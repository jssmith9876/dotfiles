"========================================================================
"			            Jordan Smith's .vimrc
"		            github: github.com/jssmith9876
"========================================================================
"""""""""""""""""""""
"      Plugins      "
"""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'sainnhe/edge'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'

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
set textwidth=140
set mouse=a
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set clipboard=unnamed
set confirm
set exrc
set updatetime=300
set redrawtime=10000
set hlsearch
set noundofile
set noswapfile

if has("autocmd")
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
endif


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

" Better keybindings for NERDTree directory manager
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeToggle<CR>

""""""""""""""""""""""""""
"  Coloring and Styling  "
""""""""""""""""""""""""""
if $TERM == "xterm-256color"
    set t_Co=256
endif

set background=dark
if has('termguicolors') 
    set termguicolors
endif

" For italic styling
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
let g:nord_italic = 1

colorscheme nord
let g:airline_theme='nord'

" Fix highlighting in Visual mode so it's more visible
highlight Visual cterm=reverse ctermbg=NONE
