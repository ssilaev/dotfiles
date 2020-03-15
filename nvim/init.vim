syntax on
set encoding=utf-8

" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

call plug#begin()
Plug 'vim-syntastic/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
Plug 'preservim/nerdtree'
Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdcommenter'
Plug 'Valloric/YouCompleteMe'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/tagalong.vim'
Plug 'Yggdroot/indentLine'
Plug 'python/black'
Plug 'Glench/Vim-Jinja2-Syntax'
call plug#end()

set history=500
set expandtab
set nowrap
set autoread
set shiftwidth=4
set softtabstop=4
set scrolloff=8
set termguicolors
set cursorline
set cursorcolumn
set number relativenumber
set colorcolumn=80
set hidden
set wildmode=longest,list,full
set splitbelow splitright

colorscheme codedark
let g:airline_theme = 'codedark'

" trim spaces
function TrimWhiteSpace()
  %s/\s*$//
  '
endfunction

" PSF Black
let g:black_linelength = 80

nnoremap <F2> :call TrimWhiteSpace()<CR>
nnoremap <F3> :set number! relativenumber!<CR>

" open NERDTree at start
" autocmd VimEnter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nmap <C-f> :NERDTreeToggle<CR>

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

" Use system clipboard
set clipboard+=unnamedplus

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" ------Vim Auto Closetag------
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.tmpl,*.jinja'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.tmpl,*.jinja'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml,js,tmpl,jinja'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

let g:indentLine_color_term = 10
let g:indent_guides_auto_colors = 0
let g:airline#extensions#tabline#enabled = 1
"let g:indentLine_char = '┊'
"
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=lightgrey
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=text
autocmd BufNewFile,BufRead *.html set ft=jinja

nnoremap <F4> :SyntasticToggleMode<CR>
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E225'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" psf black
let g:black_linelength = 80
nnoremap <F5> :Black<CR>

nnoremap <F6> :hi Normal guibg=NONE ctermbg=NONE<CR>
nnoremap <F7> :hi Normal guibg=#1E1E1E<CR>

" html
autocmd FileType html noremap <leader>d i<!DOCTYPE html><CR><html><CR><head><CR><meta charset="utf-8"><CR><title></title><CR></head><CR><body><CR></body><CR></html>
autocmd FileType html inoremap ,1 <h1></h1><CR><CR><++><Esc>?</h1<CR>i
autocmd FileType html inoremap ,1 <h1></h1><CR><Esc>?</h1<CR>i
autocmd FileType html inoremap ,2 <h2></h2><CR><Esc>?</h2<CR>i
autocmd FileType html inoremap ,3 <h3></h3><CR><Esc>?</h3<CR>i
autocmd FileType html inoremap ,4 <h4></h4><CR><Esc>?</h4<CR>i
autocmd FileType html inoremap ,5 <h5></h5><CR><Esc>?</h4<CR>i
autocmd FileType html inoremap ,6 <h6></h6><CR><Esc>?</h4<CR>i
autocmd FileType html inoremap ,d <div><CR></div><CR><Esc>?</div<CR><S-o>
autocmd FileType html inoremap ,fo <form action=""><CR></form><CR><CR><Esc>?"<CR>i
autocmd FileType html inoremap ,in <input type="" name="" placeholder=""/><Esc>?""<CR>li
autocmd FileType html inoremap ,te <textarea rows="" col="" placeholder=""/></textarea><Esc>?s=""<CR>llli
autocmd FileType html inoremap ,bu <button type=""></button><Esc>?"<CR>i
