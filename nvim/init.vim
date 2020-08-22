syntax on
set encoding=utf-8
set swapfile
set dir=~/.swapfiles

" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/autocomplete.vim
source $HOME/.config/nvim/syntastic.vim
source $HOME/.config/nvim/nerdtree.vim
source $HOME/.config/nvim/black.vim
source $HOME/.config/nvim/configurations.vim

colorscheme codedark

let g:airline_theme = 'codedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" PSF Black
let g:black_linelength = 80

" Use system clipboard
set clipboard+=unnamedplus

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:indentLine_color_term = 10
let g:indent_guides_auto_colors = 0

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=lightgrey
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=text
autocmd BufNewFile,BufRead *.html set ft=jinja

" trim spaces
function TrimWhiteSpace()
  %s/\s*$//
  '
endfunction
nnoremap <F2> :call TrimWhiteSpace()<CR>
nnoremap <F3> :set relativenumber! number!<CR>
nnoremap <Leader><space> :noh<cr>
nnoremap S :%s//g<Left><Left>
