"
"  _ __ | |_   _  __ _(_)_ __  ___
" | '_ \| | | | |/ _` | | '_ \/ __|
" | |_) | | |_| | (_| | | | | \__ \
" | .__/|_|\__,_|\__, |_|_| |_|___/
" |_|            |___/

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
Plug 'SirVer/ultisnips'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sebdah/vim-delve'

" Startup Profiling
Plug 'dstein64/vim-startuptime'
Plug 'rhysd/git-messenger.vim'

" Misc
Plug 'KabbAmine/vCoolor.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'dylanaraps/wal.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'godlygeek/tabular'
Plug 'janko/vim-test'

" Calm the ADHD
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" All Hail TPope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-markdown'
" Plug 'tpope/vim-dadbod'

" Colors and Whatnot
Plug 'norcalli/nvim-colorizer.lua' " This brings me the most joy
Plug 'norcalli/nvim-terminal.lua'
Plug 'arcticicestudio/nord-vim'

" Jedi
Plug 'davidhalter/jedi-vim'

" Syntax checking plugin
Plug 'vim-syntastic/syntastic'

" It shows which lines have been added, modified, or removed.
Plug 'airblade/vim-gitgutter'

" Full path fuzzy finder.
Plug 'ctrlpvim/ctrlp.vim'

" Python black formater
Plug 'psf/black', { 'branch': 'stable' }

" Support Jinja2 syntax
Plug 'Glench/Vim-Jinja2-Syntax'

" Rust plugin
Plug 'rust-lang/rust.vim'

" Command-line fuzzy finder.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Simpler way to use some motions
Plug 'easymotion/vim-easymotion'

" NERDTree file browsing
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Status/tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
