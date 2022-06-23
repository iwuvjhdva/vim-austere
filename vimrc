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

" Basic configuration
if has("syntax")
  syntax on
endif

colorscheme gruvbox

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

set splitright
set splitbelow

set ruler
set number

set showcmd
set showmatch

set hlsearch

" Persistent undo
set undofile
set undodir=$HOME/.vim/.undo
set undolevels=1000
set undoreload=10000

" Buffers
nnoremap gp :bp<CR>
nnoremap gn :bn<CR>
nnoremap gl :ls<CR>:b<Space>
nnoremap gd :bp<bar>bd#<CR>

" GUI
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

" Search visually selected text
vnoremap // y/<C-R>"<CR>

" Quote and unquote words
" nnoremap <M-q>" gewi"<Esc>ea"<Esc>
" nnoremap <M-q>' gewi'<Esc>ea'<Esc>
" nnoremap <M-q>d daW"=substitute(@@,"'\\\|\"","","g")<CR>P

" Neomake
let g:neomake_open_list = 2
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_python_flake8_exe = '/usr/local/bin/flake8'

let g:neomake_java_enabled_makers = []

call neomake#configure#automake('rw')

" let g:syntastic_python_checkers=['flake8']
" let g:syntastic_python_flake8_exe='/usr/local/bin/flake8'
" let g:syntastic_javascript_eslint_exe = './node_modules/eslint/bin/eslint.js -c .eslintrc'
" let g:syntastic_javascript_eslint_exe = 'npm run lint'

" CtrlP
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|bower_components'

" deoplete
let g:deoplete#enable_at_startup = 1


" Tagbar
nmap <F8> :TagbarToggle<CR>

" Gutentags
set tags=./.tags,.tags;

let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_file_list_command = {
      \ 'markers': {
      \ '.git': 'git ls-files',
      \ },
      \ }
let g:gutentags_generate_on_new = 1

" closetag.vim
let g:closetag_filetypes = 'html,xhtml,xml,javascript.jsx'

" vim-javascript
" let g:jsx_ext_required = 1 
" let g:javascript_plugin_flow = 1

" neovim-fuzzy
nnoremap <C-p> :FuzzyOpen<CR>

" cscope
if has("cscope")
    set csprg=/usr/local/bin/cscope
    set csto=0
    set cst
    " add any database in current directory
    if filereadable("cscope.out")
        silent cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        silent cs add $CSCOPE_DB
    endif

    map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
    map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
endif


" GitGutter
nmap ghp <Plug>(GitGutterPreviewHunk)

" Jdtls
nnoremap <A-o> <Cmd>lua require'jdtls'.organize_imports()<CR>
nnoremap crv <Cmd>lua require('jdtls').extract_variable()<CR>
vnoremap crv <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
nnoremap crc <Cmd>lua require('jdtls').extract_constant()<CR>
vnoremap crc <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>
vnoremap crm <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>
nnoremap <leader>df <Cmd>lua require'jdtls'.test_class()<CR>
nnoremap <leader>dn <Cmd>lua require'jdtls'.test_nearest_method()<CR>

command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)
command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)
command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
command! -buffer JdtJol lua require('jdtls').jol()
command! -buffer JdtBytecode lua require('jdtls').javap()
command! -buffer JdtJshell lua require('jdtls').jshell()

" lsp-config
lua require("lsp-config")
