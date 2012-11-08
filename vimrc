runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

set autoread
set nobackup
set nowritebackup
set noswapfile
set hidden

set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8

set t_Co=256
set background=light
colorscheme solarized

set wrap
set tabstop=4                         " a hard tab is four spaces
set softtabstop=2                     " a soft tab is two spaces
set shiftwidth=2                      " an autoindent (with <<) is two spaces
set expandtab                         " use spaces, not tabs
set list listchars=tab:▶\ ,trail:·    " a tab should display as "  ", trailing whitespace as "·"
set backspace=indent,eol,start        " backspace through everything in insert mode
let macvim_hig_shift_movement = 1     " mvim shift-arrow-keys (required in vimrc)

set nohlsearch  " don't highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

autocmd BufWritePost .vimrc source $MYVIMRC

set completeopt=menu,preview,longest

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/bin/*

set tags=./tags

set wildmenu
set laststatus=2  " always show the status bar
set statusline=%n:\ %<%f\ %m\ %=%l/%L\ %P

filetype plugin indent on " Turn on filetype plugins (:help filetype-plugin)

" In Makefiles, use real tabs, not tabs expanded to spaces
au FileType make set noexpandtab

" Set the Ruby filetype for a number of common Ruby files without .rb
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" Treat JSON files like JavaScript
au BufNewFile,BufRead *.json set ft=javascript

au BufNewFile,BufRead *.pig set filetype=pig syntax=pig

let mapleader = ","

let g:ctrlp_map = '<Leader>t'
let g:ctrlp_cmd = 'CtrlP'

nmap <C-j> <C-e>
nmap <C-k> <C-y>

nmap <silent> <C-n> :cn<cr>
nmap <silent> <C-p> :cp<cr>

" Opens the directory browser for the directory of the current path.
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk
nnoremap j gj
nnoremap k gk


" Map <Leader><Leader> to ZoomWin
map <Leader><Leader> :ZoomWin<CR>

map <Leader>f :Ack<space>

" Delete current buffer and go to previous
command! BD :bprevious <bar> :bd#
command! BDA :bufdo bd

" Tab through buffers
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>

" Clear search
nnoremap <leader><space> :noh<cr>

" NERDTree configuration
let NERDTreeIgnore=['^tags$', '\.lock$', '\.out$', '\.pyc$', '\.rbc$', '\~$']
let NERDTreeDirArrows=1
map <Leader>n :NERDTreeToggle<CR>

let NERDSpaceDelims=1

" Trim trailing whitespace on command
command! TW %s/\s\+$//g

" Convert Ruby hash syntax
command! RH %s/([^\w^:]):([\w\d_]+)\s*=>/\1\2:/g
