call plug#begin('~/.vim/plugged')

" Cool git plugin
Plug 'tpope/vim-fugitive'

" Autocomplete
Plug 'Valloric/YouCompleteMe'

" Syntax checking plugin
Plug 'vim-syntastic/syntastic'
"
" It shows which lines have been added, modified, or removed.
Plug 'airblade/vim-gitgutter'

" NERDTree file browsing
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'

" Status/tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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

" Vim colorschemes
Plug 'flazz/vim-colorschemes'

" A collection of language packs for Vim.
Plug 'sheerun/vim-polyglot'

" Comment vim-plugin
Plug 'tomtom/tcomment_vim'

" Indent Guides
Plug 'nathanaelkane/vim-indent-guides'

" Markdown Vim Mode
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Indent Guides
Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

syntax on
filetype plugin indent on

set history=500
set shortmess+=I
set nocompatible
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" set colorcolumn=88
" set termguicolors
set scrolloff=8
set tw=0 wm=0
set backspace=indent,eol,start
set smartindent
set cindent
set wildmenu
set autochdir
set nobackup
set nonumber
set background=dark
let g:seoul256_background = 234
colorscheme seoul256
hi Normal guibg=NONE ctermbg=NONE

au BufRead,BufNewFile *.txt,*.md set tw=0 wm=0
" au BufNewFile,BufRead *.html set ft=jinja

" set incsearch
set hlsearch
set number relativenumber

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

" vim-airline
let g:airline_theme = 'seoul256'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_highlighting_cache=1

" set ttyfast
" set lazyredraw

" indent-guides
"let g:indent_guides_auto_colors = 1
hi IndentGuidesOdd  guibg=#3B3B3B ctermbg=235
hi IndentGuidesEven guibg=#343434 ctermbg=236
let g:indent_guides_space_guides = 1
let g:indent_guides_enable_on_vim_startup = 1
" hi IndentGuidesOdd  ctermbg=black
" hi IndentGuidesEven ctermbg=darkgrey

" Add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml " foldmethod=indent
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" PSF Black
let g:black_linelength = 80

" On/off relativenumber
nmap <F3> :set relativenumber! number!<CR>

function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction
nmap <F2> :call TrimWhiteSpace()<CR>

" Syntastic
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E225'
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

let g:NERDTreeWinSize = 24
let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
    \ "Staged"    : "#0ee375",
    \ "Modified"  : "#d9bf91",
    \ "Renamed"   : "#51C9FC",
    \ "Untracked" : "#FCE77C",
    \ "Unmerged"  : "#FC51E6",
    \ "Dirty"     : "#FFBD61",
    \ "Clean"     : "#87939A",
    \ "Ignored"   : "#808080"
    \ }

let g:NERDTreeIgnore = ['^node_modules$']

" YouCompleteMe
nmap <F5> :YcmRestartServer<CR>

let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1

" Ycm colors
highlight Pmenu ctermfg=10 ctermbg=0 guifg=#aaaaaa guibg=#333233

nmap <leader>jj :YcmCompleter GoTo<CR>
nmap <leader>jr :YcmCompleter GoToReferences<CR>
nmap <leader>jf :YcmCompleter GoToDefinition<CR>
map <leader>jd :YcmCompleter GoToDeclaration<CR>

" Indent guides
nmap <F6> :IndentGuidesToggle<CR>

" Use system clipboard
" set clipboard+=unnamedplus
