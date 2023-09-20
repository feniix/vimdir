if &compatible
  set nocompatible               " Be iMproved
endif

let g:python3_host_prog = '/opt/homebrew/opt/python@3.10/bin/python3.10'

" disable python 2
let g:loaded_python_provider = 0

call plug#begin('~/.vim/plugged')

" generic / libraries
Plug 'vim-scripts/L9'

" colors and look and feel
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'

Plug 'folke/todo-comments.nvim'

" jsonnet
Plug 'google/vim-jsonnet'

" syntax highlight
Plug 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:loaded_syntastic_chef_foodcritic_checker = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['flake8']

" Asynchronous Lint Engine https://github.com/dense-analysis/ale
Plug 'dense-analysis/ale'

" adds closing char or word for some languages
Plug 'tpope/vim-endwise'

" pretty icons for filetypes
Plug 'ryanoasis/vim-devicons'

if has('nvim')
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/completion-treesitter'
" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
endif

" typescript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Quramy/tsuquyomi'
Plug 'Quramy/vim-dtsm'
Plug 'Quramy/vim-js-pretty-template'
Plug 'jason0x43/vim-js-indent'
Plug 'leafgarland/typescript-vim'
Plug 'mhartington/vim-typings'

" kotlin
Plug 'udalov/kotlin-vim'

" Tag sidebar
Plug 'majutsushi/tagbar'

" basic vim/terraform integration
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
let g:terraform_align=0
" (Optional) Enable terraform plan to be include in filter
let g:syntastic_terraform_tffilter_plan = 1
" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1
" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 0
let g:terraform_fmt_on_save=1
autocmd FileType terraform setlocal commentstring=#%s
autocmd BufNewFile,BufRead *.hcl set filetype=terraform

Plug 'ekalinin/Dockerfile.vim'

" json syntax highlight
Plug 'elzr/vim-json'

" Rainbow Parentheses Improved
Plug 'luochen1990/rainbow'

" vim git diff + and -
Plug 'airblade/vim-gitgutter'

" causes all trailing whitespace characters to be highlighted
Plug 'ntpeters/vim-better-whitespace'

" ruby lang support
Plug 'vim-ruby/vim-ruby'

" puppet support
Plug 'rodjek/vim-puppet'

" better yaml support
Plug 'stephpy/vim-yaml'

" gradle support
Plug 'hdiniz/vim-gradle'

" toml support
Plug 'cespare/vim-toml'

" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

let mapleader = ','

" Required:
filetype plugin indent on

" Last edited line when reopening
if has('autocmd')
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set autoindent                  " Enabile Autoindent
set autoread                    " Automatically read changed files
set autowrite                   " Automatically save before :next, :make etc.
set backspace=indent,eol,start  " Makes backspace key more powerful.
set backupdir=~/.vim/tmp/backup/
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set encoding=utf-8              " Set default encoding to UTF-8
set expandtab
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set formatoptions=qn2           " Format comments gq
set hidden                      " Buffer should still exist if window is closed
set history=1000
set hls
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set incsearch                   " Shows the match while typing
set laststatus=2                " Show status line always
set lazyredraw                  " Wait to redraw
set matchtime=2                 " for 2 seconds (default 5)
set nobackup                    " Don't create annoying backup files
set nocompatible                " Enables us Vim specific features
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
set nocursorline                " Do not highlight cursor (speeds up highlighting)
set noerrorbells                " No beeps
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set noswapfile                  " Don't use swapfile
set nowritebackup
set number                      " Show line numbers
set pumheight=10                " Completion window max size
set pyxversion=3
set scrolloff=2                 " keep 2 lines between cursor and edge
set shiftwidth=2
set showcmd                     " Show me what I'm typing
set showmatch                   " flash to the matching paren
set showmode
set smartcase                   " ... but not it begins with upper case
set smarttab
set softtabstop=2
set splitbelow                  " Horizontal windows should split to bottom
set splitright                  " Vertical windows should be split to right
set tabstop=2
set textwidth=80                " consider PEP8 by default
set title                       " vim sets terminal title
set ttyfast                     " Indicate fast terminal conn for faster redraw
if !has('nvim')
  set ttymouse=xterm2             " Indicate terminal type for mouse codes
  set ttyscroll=3                 " Speedup scrolling
endif
set visualbell                  " Flash screen not bell
set wildmenu
set wildmode=list:longest
set wrap                        " Wrap long lines

" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

" use separate undo files for neovim and vim
if !has('nvim')
  " This enables us to undo files even if you exit Vim.
  set undodir=$HOME/.vim/tmp/undo     "directory where the undo files will be stored
  set undofile                    "turn on the feature
else
  set undodir=$HOME/.local/share/nvim/tmp/undo     "directory where the undo files will be stored
  set undofile                    "turn on the feature
endif

syntax on

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection

autocmd FileType json setlocal shiftwidth=2
autocmd FileType json setlocal tabstop=2

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
let g:go_list_type = 'quickfix'
let g:go_test_timeout = '10s'
let g:go_fmt_command = 'goimports'
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

" Save global variables, those whose names are all uppercase
" Remember the marks used in the past 1000 edited files
" Remember 1000 lines of each register between sessions
" Don’t highlight the last search when starting a new session
" Store the file as ~/.vim/viminfo
if !has('nvim')
  set viminfo=!,'1000,<1000,h,n~/.vim/viminfo
endif

if &encoding == 'utf-8'
  set listchars=tab:▸\ ,trail:.,eol:¬
else
  set listchars=tab:>\ ,trail:.,eol:-
endif
nmap <leader>l :set list!<CR>
nmap <leader>n :setlocal number!<CR>
nmap <leader>q :nohlsearch<CR>

if $TERM == 'xterm-256color' || $TERM == 'screen-256color' || $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

filetype on
filetype plugin on
" Auto completion via ctrl-space (instead of the nasty ctrl-x ctrl-o)
" inoremap <Nul> <C-x><C-o>

let g:solarized_termcolors=256
set background=dark
colorscheme solarized

let g:vim_json_syntax_conceal=0

let g:airline_powerline_fonts = 1

autocmd BufNewFile,BufRead Packerfile set filetype=json

let g:rainbow_active = 1

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

set backspace=indent,eol,start

nnoremap <F5> :GundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""
" Go settings
"""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = 'goimports'
let g:go_autodetect_gopath = 1
let g:go_list_type = 'quickfix'

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction


" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1
let g:rustfmt_autosave = 1
let g:racer_experimental_completer = 1

let g:mix_format_on_save = 1
