" set runtimepath+=~/.vim_runtime

" source ~/.vim_runtime/vimrcs/basic.vim
" source ~/.vim_runtime/vimrcs/filetypes.vim
" source ~/.vim_runtime/vimrcs/plugins_config.vim
" source ~/.vim_runtime/vimrcs/extended.vim

" Color and highlighting
set background=dark
packadd! dracula    " Make sure to add the dracula theme package https://draculatheme.com/vim
syntax enable
colorscheme dracula
hi CursorLine cterm=none ctermbg=242

" Sets the line numbers 
set number

" Allows the mouse to interact with the file
set mouse=a

" General things
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent
set nowrap
set sidescrolloff=5

" Search settings
set incsearch
set ignorecase
set smartcase
set showmatch 
set hlsearch

" Menubar things
set showcmd
set showmode
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.img,*.xlsx

if has('wildmenu')
   set wildmenu
   if exists('+wildmode')
     set wildmode=longest:full,full
   endif
   set wildcharm=<C-Z>
   map <F10> :emenu <C-Z>
   imap <F10> <C-O>:emenu <C-Z>
   if !has('gui_running')
     runtime! menu.vim
   endif " !has('gui_running')
 endif " 'wildmenu'

" Misc things
set nobackup
set noerrorbells
set history=1000

" Syntax stuff
set nocompatible
filetype on 
filetype plugin on 
filetype indent on

" try
" source ~/.vim_runtime/my_configs.vim
" catch
" endtry
