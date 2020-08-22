set history=500
set shortmess+=I

" from the https://wiki.python.org/moin/Vim
set tabstop=8
set expandtab
set softtabstop=4
" end form the wiki.python.org

" set tabstop=4
set shiftwidth=4
set colorcolumn=88
set autoindent
set smartindent
set cindent
set termguicolors
set backspace=indent,eol,start
set laststatus=2
set autochdir
set nobackup
set noundofile

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

set scrolloff=10
set nonumber
set path+=** " search down into subfolders (for tab-complete)
set wildmenu " display all matching files for tab-complete
filetype on
filetype indent on
" set cursorline
" set cursorcolumn
"
" required for autocompletion
filetype plugin on " enable plugins

set nocp " non vi compatible mode
set tags=./tags,tags;
