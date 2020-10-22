call plug#begin("~/.vim/plugged")
  

" Plugin Section
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'editorconfig/editorconfig-vim'
Plug 'easymotion/vim-easymotion'
Plug 'Shougo/deoplete.nvim'		"auto complete
Plug 'junegunn/fzf.vim'
Plug 'numirias/semshi'            	"advance highlight color for python
Plug 'ryanoasis/powerline-extra-symbols'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'        	"multi pack language
Plug 'ryanoasis/vim-devicons'     	"dev icon
Plug 'kaicataldo/material.vim'
Plug 'psliwka/vim-smoothie'      	"smooth scroll ctr+d ctr+u
Plug 'junegunn/goyo.vim'        	"editor mode :Goyo
Plug 'kevinhwang91/rnvimr'     		"ranger mode with small window
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'       	"dependency of ranger
Plug 'ap/vim-css-color'


call plug#end()

set autoread
set showcmd
"set autoindent
set lazyredraw
set t_ut=""
set ruler
set number
set termguicolors
set relativenumber
"set mouse=a
set title
set background=dark
set wildmenu
set showtabline=2
set encoding=UTF-8
set hlsearch
set hidden
set cmdheight=2
set signcolumn=yes
set smartcase
set hlsearch
set cursorline
set showmatch
set showmode
set incsearch
set modelines=0


set pastetoggle=<F2>


filetype plugin indent on
syntax on
let g:material_terminal_italics = 1
let g:material_theme_style = 'ocean'
colorscheme material


hi Normal guibg=NONE ctermbg=NONE
"hi LineNr ctermbg=16 guibg=#000000



" AIRLINE theme, git icon, status
let g:airline_theme='material'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'



let g:airline_powerline_fonts = 1
" testing rounded separators (extra-powerline-symbols):
let g:airline_left_sep = "\uE0B0"
let g:airline_right_sep = "\uE0B2"


set laststatus=2


let g:deoplete#enable_at_startup = 1

" FZF FZF FZF FZF FZF FZF FZF FZF
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_buffers_jump = 1


let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp'  } }

" Always enable preview window on the right with 60% width
let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"

" Customize fzf colors to match your color scheme
"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)
" Make Ripgrep ONLY search file contents and not filenames
command! -bang -nargs=* Rg
			\ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --smart-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4.. -e'}, 'right:50%', '?'),
  \   <bang>0)
" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
			\ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)



"Config Section


" DISABLE AUTOMATIC COMMENT example double quote
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"autocmd vimenter * NERDTree


autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <F3> :NERDTreeToggle<CR>
nnoremap <F4> :Buffers<CR>

let g:closetag_filenames = '*.html,*.js,*.jsx'




