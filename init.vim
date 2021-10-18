let mapleader = " " " map leader to Space
" Escape term with Esc
tnoremap <Esc> <C-\><C-n>

call plug#begin('~/.config/nvim/plugged')

    " Fugitive
    Plug 'tpope/vim-fugitive'

    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'ryanoasis/vim-devicons'

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    Plug 'morhetz/gruvbox'
    Plug 'https://gitlab.com/yorickpeterse/vim-paper.git'
    Plug 'cocopon/iceberg.vim'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

call plug#end()

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

filetype plugin indent on
filetype plugin on
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
nnoremap <C-p> :FZF<CR>
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

" Coc Servers

let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-solargraph']

" Buffer Switching
map gn :bn<cr>
map gp :bp<cr>

" Carp paredit
au FileType carp call PareditInitBuffer()

" Carp lisp indentation
au FileType carp set lisp
