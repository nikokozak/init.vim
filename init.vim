let mapleader = " " " map leader to Space
" Escape term with Esc
tnoremap <Esc> <C-\><C-n>

call plug#begin('~/.config/nvim/plugged')

    " Fugitive
    Plug 'tpope/vim-fugitive'

    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'ryanoasis/vim-devicons'

    Plug 'vim-ruby/vim-ruby'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }

    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'

    Plug 'morhetz/gruvbox'
    Plug 'https://gitlab.com/yorickpeterse/vim-paper.git'
    Plug 'cocopon/iceberg.vim'

    Plug 'leafgarland/typescript-vim'

    Plug 'vim-airline/vim-airline'

    Plug 'sotte/presenting.vim'

    " Vlime
    " Plug 'vlime/vlime', {'rtp': 'vim/'}
    
    " Slimv
    Plug 'tpope/vim-dispatch'
    Plug 'kovisoft/slimv'

    " Carp
    Plug 'hellerve/carp-vim'

    " Incremental Search
    Plug 'haya14busa/incsearch.vim'

    " Emmet
    Plug 'mattn/emmet-vim'

call plug#end()

" Use deoplete.
let g:deoplete#enable_at_startup = 1
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" Python issues
let g:python3_host_prog='/usr/local/bin/python3'
let g:python_host_prog='/usr/bin/python'

" Slimv
let g:slimv_impl = 'sbcl'
let g:slimv_repl_split = 2
let g:slimv_repl_split_size = 15

" With TMUX
" let g:slimv_swank_cmd = 'Start! tmux new-window -d -n REPL-SBCL \"sbcl --load ~/.config/nvim/plugged/slimv/slime/start-swank.lisp"'
" With Terminal
let g:slimv_swank_cmd = '!osascript -e "tell application \"Terminal\" to do script \"sbcl --load ~/.config/nvim/plugged/slimv/slime/start-swank.lisp\""'

" Colorscheme
colorscheme iceberg
set background=light

" Font
"set guifont=Cousine\ Nehttps://github.com/kovisoft/slimvrd\ Font\ Mono\ Regular\ 18

" Sensible Defaults

set nocompatible
set showmatch
set ignorecase
set hlsearch
set incsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set number
set wildmode=longest,list
set cc=80

filetype plugin on
filetype plugin indent on
syntax on
syntax enable
set clipboard=unnamedplus
set cursorline
set ttyfast
set noswapfile

if (has("termguicolors"))
    set termguicolors
endif

set splitright
set splitbelow

" NerdTree

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusLine = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <Tab> :NERDTreeFocus<CR>

" Panel Switching
nnoremap <silent> <leader>l <C-w>l 
nnoremap <silent> <leader>k <C-w>k 
nnoremap <silent> <leader>j <C-w>j 
nnoremap <silent> <leader>h <C-w>h 
nnoremap <silent> <leader>c <C-w>c
nnoremap <silent> <leader>s <C-w>s
nnoremap <silent> <leader>v <C-w>v

" Tab Switching
map <leader>T :tabnew<cr>
map <leader>tp :tabnext<cr>
map <leader>tn :tabnext<cr>
map <leader>tm :tabmove<cr>
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <leader>f :ZoomToggle<CR>

" Fuzzy Finding
nnoremap <leader>' :Files<CR>
nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <C-b> :Buffers<CR>

let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit'
            \}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Incremental Search

map / <Plug>(incsearch-forward)
let g:incsearch#auto_nohlsearch = 1
" Unhighlight:
nnoremap <Esc><Esc> :noh<CR>:ccl<CR>

" Buffer Switching
map gn :bn<cr>
map gp :bp<cr>

" Carp paredit
au FileType carp call PareditInitBuffer()

" Carp lisp indentation
au FileType carp set lisp

" Emmet Config
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key=','

" Sass
autocmd FileType scss,sass setlocal noexpandtab sts=0 ts=2

" LC
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

