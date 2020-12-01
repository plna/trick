call plug#begin("~/.vim/plugged")
  

" Plugin Section
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'editorconfig/editorconfig-vim'
Plug 'easymotion/vim-easymotion'
Plug 'Shougo/deoplete.nvim'             "auto complete
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'airblade/vim-rooter'
Plug 'ryanoasis/powerline-extra-symbols'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'             "multi pack language
Plug 'kaicataldo/material.vim'
Plug 'joshdick/onedark.vim'
Plug 'psliwka/vim-smoothie'             "smooth scroll ctr+d ctr+u
Plug 'junegunn/goyo.vim'                "editor mode :Goyo
Plug 'kevinhwang91/rnvimr'              "ranger mode with small window
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'            "dependency of ranger
Plug 'ap/vim-css-color'
Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'google/vim-searchindex'
Plug 'preservim/tagbar'
Plug 'ryanoasis/vim-devicons'           "dev icon


call plug#end()


filetype plugin indent on
syntax on

" set mouse=a                             " Enable your mouse
set autochdir
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus
set autoread
set showcmd
set lazyredraw
set ruler
set number
set termguicolors
set relativenumber
set title
set background=dark
set wildmenu
set hidden                              " Required to keep multiple buffers open multiple buffers
set smartcase
set hlsearch
set cursorline                          " Enable highlighting of the current line
set showmatch
set incsearch
set ignorecase                          "searching is not case sensitive
set tabstop=2
set shiftwidth=2
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set fileformat=unix                     " Prevent dos file make grep error
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
set updatetime=300                      " Faster completion
set showtabline=2                       " Always show tabs
set cmdheight=2                         " More space for displaying messages
set laststatus=2                        " Always display the status line
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set t_ut=""

"shortcuts
map <F3> :NERDTreeToggle<CR>
nnoremap <F4> :Buffers<CR>
nmap <F8> :TagbarToggle<CR>
set pastetoggle=<F2>
"Change to current file directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

"Config Section
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


let g:rainbow_active = 1
let g:deoplete#enable_at_startup = 1


"theme
" let g:material_terminal_italics = 1
" let g:material_theme_style = 'ocean'
colorscheme onedark

"background 
hi Normal guibg=NONE ctermbg=black

" AIRLINE theme, git icon, status
let g:airline_theme='simple'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'jsformatter'



let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" GitGutter
let g:gitgutter_highlight_lines = 1
let g:gitgutter_highlight_linenrs = 1


" paste without explicitly turning paste mode on/off
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

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




" Fix nerdtree have bracket when use with rainbow
let g:rainbow_conf = {'separately': {'nerdtree': 0,}}

