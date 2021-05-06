call plug#begin('~/.vim/plugged')

" Cool git plugin
Plug 'tpope/vim-fugitive'

" Autocomplete
Plug 'Valloric/YouCompleteMe'

" Syntax checking plugin
Plug 'vim-syntastic/syntastic'

" It shows which lines have been added, modified, or removed.
Plug 'airblade/vim-gitgutter'

" NERDTree file browsing
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'

" CtrlP matcher based on python
Plug 'FelikZ/ctrlp-py-matcher'

" Full path fuzzy finder.
Plug 'ctrlpvim/ctrlp.vim'

" Python black formater
Plug 'psf/black', { 'branch': 'stable' }

" Support Jinja2 syntax
Plug 'Glench/Vim-Jinja2-Syntax'

" Rust plugin
Plug 'rust-lang/rust.vim'

" Go plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Tagbar
Plug 'majutsushi/tagbar'

" Command-line fuzzy finder.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Simpler way to use some motions
Plug 'easymotion/vim-easymotion'

" Vim solarized colorscheme
Plug 'altercation/vim-colors-solarized'

" A collection of language packs for Vim.
Plug 'sheerun/vim-polyglot'

" Comment vim-plugin
Plug 'tomtom/tcomment_vim'

" Indent Guides
Plug 'nathanaelkane/vim-indent-guides'

" Markdown Vim Mode
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Challenger Deep Theme
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

call plug#end()

syntax on
filetype plugin indent on

set term=xterm-256color
" set termguicolors         " Enable GUI colors for the terminal to get truecolor
set t_Co=256                " Enable 256 colors
set history=500
set shortmess+=I
set nocompatible
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set scrolloff=10
set tw=0 wm=0
set backspace=indent,eol,start
set foldlevelstart=99
set wrap!
set smartindent
set cindent
set wildmenu
set autochdir
set nobackup
set nonumber
set incsearch
set hlsearch
set number

" colorscheme challenger_deep
colorscheme deus
hi Normal guibg=NONE ctermbg=NONE

au BufRead,BufNewFile *.txt,*.md set tw=0 wm=0
au BufNewFile,BufRead *.html set ft=jinja

" bash-like TAB completion
set wildmode=longest,list

" enable mode keys in ru layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Highlight extra whitespaces at the end
highlight ExtraWhitespace ctermbg=red guibg=red
highlight RedundantWhitespace ctermbg=red guibg=red
match RedundantWhitespace /\s\+$\| \+\zs\t/

set fillchars+=vert:\|
hi Search guibg=peru guifg=wheat
hi vertsplit guifg=bg guibg=darkgrey

au BufNew,BufEnter,BufWinEnter,WinEnter,BufNew * match ExtraWhitespace /\s\+$/

" Exception for C, Go and yaml
au! BufNewFile,BufReadPost *.{c,h} set filetype=c
au! BufNewFile,BufReadPost *.{go} set filetype=go
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
au FileType c setlocal noexpandtab
au FileType c setlocal noexpandtab
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" PSF Black
let g:black_linelength = 120
nnoremap <F5> :Black<CR>

" On/off relativenumber
" nmap <F3> :set relativenumber! number!<CR>
nmap <F3> :set number!<CR>

function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction
nmap <F2> :call TrimWhiteSpace()<CR>

" Syntastic
let g:syntastic_python_checkers=['flake8']
" let g:syntastic_python_flake8_args='--ignore=E501,E225,W503,W504'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

nnoremap <F4> :SyntasticToggleMode<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Find and replace
nmap S :%s//g<Left><Left>

" noh
nmap <Leader><space> :noh<cr>

" Ctrlp
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nmap <C-f> :NERDTreeToggle<CR>

let g:NERDTreeWinSize = 30
let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
  \ "Staged"    : "#0ee375",
  \ "Modified"  : "#d9bf91",
  \ "Renamed"   : "#51C9FC",
  \ "Untracked" : "#FCE77C",
  \ "Unmerged"  : "#FC51E6",
  \ "Dirty"             : "#FFBD61",
  \ "Clean"             : "#87939A",
  \ "Ignored"   : "#808080"
  \ }

let g:NERDTreeIgnore = ['^node_modules$']

" YouCompleteMe
" nmap <F5> :YcmRestartServer<CR>

let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1

nmap <leader>j :YcmCompleter GoTo<CR>
nmap <leader>r :YcmCompleter GoToReferences<CR>
nmap <leader>f :YcmCompleter GoToDefinition<CR>
nmap <leader>d :YcmCompleter GoToDeclaration<CR>
nmap <leader>t :YcmCompleter GetType<CR>

" X copy-paste
command -range Gy :silent :<line1>,<line2>w !xsel -i -b
cabbrev gy Gy
command -range Gp :silent :r !xsel -o -b
cabbrev gp Gp

" Navigate 4x faster when holding down Ctrl
nmap <c-j> 4j
nmap <c-k> 4k
nmap <c-h> 4h
nmap <c-l> 4l
nmap <c-Down> 4<Down>
nmap <c-Up> 4<Up>
nmap <c-Left> b
nmap <c-Right> e
