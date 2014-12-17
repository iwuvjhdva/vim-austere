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

set mouse=a

set ruler
set number

set showcmd
set showmatch

set hlsearch

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

set guifont=Monospace\ 12
set clipboard=unnamedplus

"if has("gui_running") 
"    set spell spelllang=en_us
"endif

set paste

" Local leader key
let maplocalleader = "\<M-x>"

" Hide certain files in Explore mode
let g:netrw_list_hide = '.pyc,.swp'

" Temporarily disable search highlighting on Space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Quote and unquote words
nnoremap <M-q>" gewi"<Esc>ea"<Esc>
nnoremap <M-q>' gewi'<Esc>ea'<Esc>
nnoremap <M-q>d daW"=substitute(@@,"'\\\|\"","","g")<CR>P

" Tabs bindings
nnoremap <M-t>n :tabnew<CR>
nnoremap <M-t>o :tabonly<CR>
nnoremap <M-t>c :tabclose<CR>
nnoremap <M-t>f :tabfirst<CR>
nnoremap <M-t>l :tablast<CR>
nnoremap <M-t>s :tab split<CR>

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

" syntastic
let g:syntastic_check_on_open = 1
" let g:syntastic_auto_loc_list = 1

let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_exe='/usr/local/bin/flake8'

cmap E<CR> Explore<CR>

" CtrlP
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|bower_components'
