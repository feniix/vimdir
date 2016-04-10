" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle "MarcWeber/vim-addon-mw-utils"
NeoBundle "Valloric/YouCompleteMe"
NeoBundle "altercation/vim-colors-solarized"
NeoBundle "bling/vim-airline"
NeoBundle "ctrlpvim/ctrlp.vim"
NeoBundle "ekalinin/Dockerfile.vim"
NeoBundle "elzr/vim-json"
NeoBundle "ervandew/supertab"
NeoBundle "fatih/vim-go"
NeoBundle "kien/rainbow_parentheses.vim"
NeoBundle "marijnh/tern_for_vim"
NeoBundle "markcornick/vim-terraform"
NeoBundle "mhinz/vim-signify"
NeoBundle "ntpeters/vim-better-whitespace"
NeoBundle "robbles/logstash.vim"
NeoBundle "rodjek/vim-puppet"
NeoBundle "scrooloose/Syntastic"
NeoBundle "sjl/gundo.vim"
NeoBundle "stephpy/vim-yaml"
NeoBundle "tfnico/vim-gradle"
NeoBundle "tomtom/tlib_vim"
NeoBundle "tpope/vim-classpath"
NeoBundle "tpope/vim-endwise"
NeoBundle "tpope/vim-git"
NeoBundle "tpope/vim-repeat"
NeoBundle "tpope/vim-salve"
NeoBundle "tpope/vim-surround"
NeoBundle "tpope/vim-unimpaired"
NeoBundle "vim-ruby/vim-ruby"
NeoBundle "vim-scripts/L9"
NeoBundle "vim-scripts/Specky"
NeoBundle "vim-scripts/Tabular"

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

syntax on

" Last edited line when reopening
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set history=1000

set shiftwidth=2
set tabstop=2
set expandtab
set smarttab
set fileformat=unix
set encoding=utf-8
set hls
set autoindent

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set laststatus=2

" autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(
" autocmd FileType python set tags+=$HOME/.vim/tags/python.ctags
" autocmd FileType python compiler pylint
autocmd FileType json setlocal shiftwidth=2
autocmd FileType json setlocal tabstop=2

" Save global variables, those whose names are all uppercase
" Remember the marks used in the past 1000 edited files
" Remember 1000 lines of each register between sessions
" Don’t highlight the last search when starting a new session
" Store the file as ~/.vim/viminfo
set viminfo=!,'1000,<1000,h,n~/.vim/viminfo

" Display invisible characters
"
" For utf-8 use the following characters
"
"   ▸ for tabs
"   . for trailing spaces
"   ¬ for line breaks
"
" otherwise, fall back to
"
"   > for tabs
"   . for trailing spaces
"   - for line breaks
"
if &encoding == "utf-8"
  set listchars=tab:▸\ ,trail:.,eol:¬
else
  set listchars=tab:>\ ,trail:.,eol:-
endif
nmap <leader>l :set list!<CR>
nmap <leader>n :setlocal number!<CR>
nmap <leader>q :nohlsearch<CR>

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
    set t_Co=256
endif

filetype on
filetype plugin on
" Auto completion via ctrl-space (instead of the nasty ctrl-x ctrl-o)
inoremap <Nul> <C-x><C-o>

set nocompatible               " be iMproved

filetype plugin indent on     " required!

let g:syntastic_python_checkers=['flake8']

let g:solarized_termcolors=256
set background=dark
colorscheme solarized

let g:vim_json_syntax_conceal=0

let g:airline_powerline_fonts = 1
set laststatus=2

autocmd BufNewFile,BufRead Packerfile set filetype=json

autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

set backspace=indent,eol,start

nnoremap <F5> :GundoToggle<CR>
