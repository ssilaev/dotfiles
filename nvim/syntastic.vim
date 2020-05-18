
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

nnoremap <F4> :SyntasticToggleMode<CR>

let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E225'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" syntastic c/c++ settings
let g:syntastic_quiet_messages = {"regex": ["pragma once"] }
let g:syntastic_c_compiler = 'g++'
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_c_check_header = 1
let g:syntastic_cpp_check_header = 1

" this will be overwritten if a .syntastic file 
" exists in the current directory or parentdirectory of where vim 
" is executed
let g:syntastic_cpp_config_file = '~/.syntastic' 
let g:syntastic_c_config_file = '~/.syntastic' 

" load a local vim file
if !exists("*LoadSyntasticConfig")
  function! LoadSyntasticConfig()
    let vimrcFile = findfile(".syntastic", ".;")

    if !empty(vimrcFile)
      let g:syntastic_cpp_config_file = l:vimrcFile
      let g:syntastic_c_config_file = l:vimrcFile
    endif

  endfunction
endif

autocmd DirChanged * :call LoadSyntasticConfig()

call LoadSyntasticConfig()
