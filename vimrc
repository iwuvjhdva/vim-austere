" Vim Austere

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Pathogen load
filetype off

set nocp
call pathogen#infect()
call pathogen#helptags()

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

if has("syntax")
  syntax on
endif

colorscheme slate

set backspace=indent,eol,start
set listchars=tab:˛\ ,trail:┈
set fileencodings=utf-8,cp1251,koi8-r

set autoindent
set textwidth=120
set tabstop=4
set softtabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

set ruler
set number

set showcmd
set showmatch

set hlsearch

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

set guifont=Monospace\ 12

" terminal
if has("nvim")
    :tnoremap <Esc> <C-\><C-n>
    :tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
    :tnoremap <A-h> <C-\><C-N><C-w>h
    :tnoremap <A-j> <C-\><C-N><C-w>j
    :tnoremap <A-k> <C-\><C-N><C-w>k
    :tnoremap <A-l> <C-\><C-N><C-w>l
    :inoremap <A-h> <C-\><C-N><C-w>h
    :inoremap <A-j> <C-\><C-N><C-w>j
    :inoremap <A-k> <C-\><C-N><C-w>k
    :inoremap <A-l> <C-\><C-N><C-w>l
    :nnoremap <A-h> <C-w>h
    :nnoremap <A-j> <C-w>j
    :nnoremap <A-k> <C-w>k
    :nnoremap <A-l> <C-w>l
endif

" yank to clipboard
if has("clipboard")
    set clipboard=unnamed " copy to the system clipboard

    if has("unnamedplus") " X11 support
        set clipboard+=unnamedplus
    endif
endif

if has("gui_running") 
    set paste
    set mouse=a
endif

" Local leader key
let maplocalleader = "\<M-x>"

" Hide certain files in Explore mode
let g:netrw_list_hide = '.pyc,.swp'

" Remove NPM packages from find files
set wildignore+=**/node_modules/**
set wildignore+=**/flow-typed/**
set wildignore+=**/dist/**

" Temporarily disable search highlighting on Space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Quote and unquote words
" nnoremap <M-q>" gewi"<Esc>ea"<Esc>
" nnoremap <M-q>' gewi'<Esc>ea'<Esc>
" nnoremap <M-q>d daW"=substitute(@@,"'\\\|\"","","g")<CR>P

" Neomake
let g:neomake_open_list = 2
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
call neomake#configure#automake('nrwi', 500)

" let g:syntastic_python_checkers=['flake8']
" let g:syntastic_python_flake8_exe='/usr/local/bin/flake8'
" let g:syntastic_javascript_eslint_exe = './node_modules/eslint/bin/eslint.js -c .eslintrc'
" let g:syntastic_javascript_eslint_exe = 'npm run lint'

" CtrlP
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|bower_components'

" deoplete
let g:deoplete#enable_at_startup = 1
