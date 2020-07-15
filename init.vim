call plug#begin("~/.vim/plugged")
  

" Plugin Section
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'easymotion/vim-easymotion'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'lifepillar/vim-solarized8'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'ryanoasis/powerline-extra-symbols'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'sheerun/vim-polyglot'


call plug#end()

set showcmd
set autoindent
set lazyredraw
set t_ut=""
set ruler
set termguicolors
set number
set relativenumber
"set cursorline
"set mouse=a
set title
set background=dark
set wildmenu
set showtabline=2
"set noshowmode


filetype plugin indent on
syntax on
"syntax enable
colorscheme solarized8



hi Normal ctermbg=16 guibg=#000000
hi LineNr ctermbg=16 guibg=#000000




" AIRLINE theme, git icon, status
let g:airline_theme='simple'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


" set font terminal font or set gui vim font
" to a Nerd Font (https://github.com/ryanoasis/nerd-fonts):
set guifont=DroidSansMono\ Nerd\ Font\ 12

" testing rounded separators (extra-powerline-symbols):
let g:airline_left_sep = "\uE0B0"
let g:airline_right_sep = "\uE0B2"


set  rtp+=/cocacola/.local/lib/python3.8/site-packages/powerline/bindings/bash/powerline.sh
set laststatus=2
set t_Co=256


let g:fzf_colors =
			\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }



"Config Section


" DISABLE AUTOMATIC COMMENT example double quote
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"autocmd vimenter * NERDTree

let g:deoplete#enable_at_startup = 1

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <C-o> :NERDTreeToggle<CR>

let g:closetag_filenames = '*.html,*.js,*.jsx'




