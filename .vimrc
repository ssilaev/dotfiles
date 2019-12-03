set nocompatible
filetype off
syntax on
set background=dark
colorscheme solarized

set regexpengine=1
set backspace=indent,eol,start
set expandtab
set shiftwidth=4
set softtabstop=4
set cursorline
set scrolloff=9
set cursorcolumn
set colorcolumn=100
set hlsearch
" set t_Co=256
if &term == "screen"
  set t_Co=256
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'jreybert/vimagit'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'rust-lang/rust.vim'
Plugin 'fatih/vim-go'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'python/black'
Plugin 'tpope/vim-fugitive'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on
highlight RedundantWhitespace ctermbg=red guibg=red
match RedundantWhitespace /\s\+$\| \+\zs\t/
hi Search guibg=peru guifg=wheat
nnoremap <F3> :set hlsearch!<CR>

set autoread
set nowrap
set number
set breakindent
set diffopt+=vertical
set backupdir=./.backup,.,~/tmp
set directory=.,./.backup,~/tmp
set swapfile
set dir=./.swp,~/tmp
set history=300
set foldmethod=manual
set foldnestmax=10
" set nofoldenable
set foldlevel=2
set relativenumber

function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction
nnoremap <F2> :call TrimWhiteSpace()<CR>
hi Normal guibg=NONE ctermbg=NONE
map <C-n> :NERDTreeToggle<CR>
highlight VertSplit ctermbg=NONE
highlight VertSplit ctermfg=NONE
"highlight ColorColumn ctermbg=8
"highlight ColorColumn ctermbg=59
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowBookmarks=0
let g:NERDTreeWinSize = 24
"autocmd vimenter * if !argc() | NERDTree | endif
let g:ycm_server_keep_logfiles=1
let g:ycm_warning_symbol='..'
let g:ycm_error_symbol='**'
let g:ycm_server_use_vim_stdout = 1
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_autoclose_preview_window_after_completion = 1
" Flake8
nnoremap <F4> :SyntasticToggleMode<CR>
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E225'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:indentLine_color_term = 10
let g:indent_guides_auto_colors = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=lightgrey
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=text
autocmd BufNewFile,BufRead *.html set ft=jinja
nnoremap <F5> :Black<CR>
