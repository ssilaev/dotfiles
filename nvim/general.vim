set history=500
set shortmess+=I
set tabstop=8
set shiftwidth=8
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
