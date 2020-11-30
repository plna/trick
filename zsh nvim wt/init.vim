call plug#begin("~/.vim/plugged")
  

" Plugin Section
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'editorconfig/editorconfig-vim'
Plug 'easymotion/vim-easymotion'
Plug 'Shougo/deoplete.nvim'     "auto complete
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'airblade/vim-rooter'
Plug 'ryanoasis/powerline-extra-symbols'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'         "multi pack language
Plug 'ryanoasis/vim-devicons'       "dev icon
Plug 'kaicataldo/material.vim'
Plug 'psliwka/vim-smoothie'         "smooth scroll ctr+d ctr+u
Plug 'junegunn/goyo.vim'            "editor mode :Goyo
Plug 'kevinhwang91/rnvimr'          "ranger mode with small window
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'        "dependency of ranger
Plug 'ap/vim-css-color'
Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'google/vim-searchindex'



call plug#end()


filetype plugin indent on
syntax on


set clipboard=unnamedplus
set updatetime=100
set autoread
set showcmd
set autoindent
set smartindent
set lazyredraw
set ruler
set number
set termguicolors
set relativenumber
"set mouse=a
set title
set background=dark
set wildmenu
set hlsearch
set hidden
set smartcase
set hlsearch
set cursorline
set showmatch
set showmode
set incsearch
set ignorecase    "searching is not case sensitive
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set t_ut=""
set signcolumn=yes
set encoding=UTF-8

set showtabline=2
set cmdheight=2
set modelines=0
set laststatus=2

set pastetoggle=<F2>


"Config Section
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


let g:rainbow_active = 1

let g:deoplete#enable_at_startup = 1

"shortcuts
map <F3> :NERDTreeToggle<CR>
nnoremap <F4> :Buffers<CR>

"Change to current file directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

"theme
let g:material_terminal_italics = 1
let g:material_theme_style = 'ocean'
colorscheme material


" AIRLINE theme, git icon, status
let g:airline_theme='material'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1


"background 
hi Normal guibg=NONE ctermbg=black
"reset cursor blink when quit nvim
au VimLeave * set guicursor=a:ver1-blinkon1

"open a NERDTree automatically when vim starts up if no files were specified
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"also opening a saved session
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''


" GitGutter
let g:gitgutter_highlight_lines = 1
let g:gitgutter_highlight_linenrs = 1


" FZF
" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-q': 'vsplit' }

let g:fzf_tags_command = 'ctags -R'
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"


"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)



