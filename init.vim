call plug#begin("~/.vim/plugged")
  

" Plugin Section
Plug 'dracula/vim'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'easymotion/vim-easymotion'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'





call plug#end()



set lazyredraw
set t_ut=""
set number
set relativenumber
set ruler
set termguicolors
colorscheme dracula
set background=dark


"Config Section

highlight Normal


autocmd vimenter * NERDTree

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif

let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = 'C:\Python3\python.exe'
















