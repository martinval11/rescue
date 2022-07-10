" ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗
" ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║
" ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║
" ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║
" ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║
" ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝

set number relativenumber
set colorcolumn=152
set laststatus=0
set smartindent
set autoindent
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set showtabline=2
set formatoptions-=cro
set hidden
set wrap
set encoding=utf-8
set fileencoding=utf-8
set ruler
set t_Co=256
set mouse=a
set cursorline
set splitbelow
set splitright
set clipboard=unnamedplus
set background=dark
set autochdir
syntax enable
filetype on
filetype indent on
filetype plugin on

augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" KEYBINDINGS {{{

imap ii <Esc>

map <C-q> :q<CR>
map <C-s> :w<CR>
map <C-z> :undo<CR>
map <C-y> :redo<CR>
map <C-f> :Ag<CR>
map <C-r> :Files!<CR>
map <C-g> :FloatermNew<CR>
map <C-t> :tabnew<CR>
map <C-l> :tabnext<CR>
map <C-h> :tabprevious<CR>
map <C-w> :tabclose<CR>
map <A-m> :Prettier<CR>
map <A-c> :Minimap<CR>
map <A-d> :MinimapClose<CR>
map <C-b> :CocCommand explorer --width 32<CR>

" TABS (INSERT MODE)
imap <C-t> <C-O>:tabnew<cr>
imap <C-l> <C-O>:tabnext<cr>
imap <C-h> <C-O>:tabprevious<cr>
imap <C-w> <C-O>:tabclose<cr>

imap <C-g> <C-O>:FloatermNew<cr>

" }}}

" PLUGINS {{{

call plug#begin("/home/martin/.vim/plugged")
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'yggdroot/indentline'
Plug 'neoclide/coc.nvim'
Plug 'voldikss/vim-floaterm'
Plug 'nikvdp/ejs-syntax'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'raimondi/delimitmate'
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'ervandew/supertab'
Plug 'mxw/vim-jsx'
Plug 'mg979/vim-visual-multi'
Plug 'cocopon/iceberg.vim'
Plug 'styled-components/vim-styled-components'
Plug 'kien/ctrlp.vim'
Plug 'weirongxu/coc-explorer'
Plug 'gorodinskiy/vim-coloresque'
Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'jbgutierrez/vim-better-comments'
call plug#end()

" }}}

" VIM SETTINGS {{{

colorscheme iceberg

let g:rainbow#max_level = 16

let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

autocmd FileType * RainbowParentheses

" AIRLINE

let g:airline_theme='iceberg'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

" NERDTREE

let NERDTreeMapOpenVSplit="v"
let NERDTreeMapOpenSplit="h"
let NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen = 1

" }}}