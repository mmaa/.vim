runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

set autoread
set nobackup
set nowritebackup
set noswapfile
set hidden

set nocompatible      " use vim, no vi defaults
set number            " show line numbers
set ruler             " show line and column number
set encoding=utf-8    " set default encoding to UTF-8
set ffs=unix,dos,mac  " set unix as standard filetype
set history=999

syntax enable         " turn on syntax highlighting allowing local overrides
filetype plugin on    " enable filetype plugins
filetype indent on

set ignorecase  " searches are case insensitive...
set smartcase   " ...unless they contain at least one capital letter
set hlsearch    " highlight search results
set incsearch   " incremental searching
set magic       " for regular expressions
set lazyredraw  " don't redraw while executing macros
set showmatch   " show matching brackets
set mat=2       " tenths of a second to blink when matching brackets

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set t_Co=256
set background=light
colorscheme solarized

set nofoldenable
set foldcolumn=0                      " extra space left of line numbers
set so=7                              " space between cursor and top/bottom
set wrap
set autoindent
set smartindent
set tabstop=4                         " a hard tab is four spaces
set softtabstop=2                     " a soft tab is two spaces
set shiftwidth=2                      " an autoindent (with <<) is two spaces
set expandtab                         " use spaces, not tabs
set smarttab
set list listchars=tab:▶\ ,trail:·    " characters for tabs and trailing whitespace
set backspace=indent,eol,start        " backspace through everything in insert mode
set whichwrap+=<,>,h,l

set completeopt=menu,preview,longest  " show menu for completions

set tags=./tags

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/bin/*
set wildmenu

set laststatus=2  " always show the status bar
set statusline=\ %{HasPaste()}%n:\ %<%f\ %m\ %=%v\ %l/%L\ %P

" In Makefiles, use real tabs, not tabs expanded to spaces
au FileType make set noexpandtab

" Set the Ruby filetype for a number of common Ruby files without .rb
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
au BufNewFile,BufRead *.md set filetype=markdown syntax=markdown

let mapleader = ","

let g:ctrlp_map = '<Leader>t'
let g:ctrlp_cmd = 'CtrlP'

noremap <Leader><space> :set hlsearch! hlsearch?<CR>

nmap <silent> <C-n> :cn<cr>
nmap <silent> <C-p> :cp<cr>

" Opens the directory browser for the directory of the current path.
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk
nnoremap j gj
nnoremap k gk

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Map <Leader><Leader> to ZoomWin
map <Leader><Leader> :ZoomWin<CR>

map <Leader>f :Ag<space>

" Delete current buffer and go to previous
command! BD :bprevious <bar> :bd#
command! BDA :bufdo bd

" Tab through buffers
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>

" NERDTree configuration
let NERDTreeIgnore=['^tags$', '\.lock$', '\.out$', '\.pyc$', '\.rbc$', '\~$']
let NERDTreeDirArrows=1
map <Leader>n :NERDTreeToggle<CR>

let NERDSpaceDelims=1

" Trim trailing whitespace on command
command! TW %s/\s\+$//g

" Convert Ruby hash syntax
command! RH %s/([^\w^:]):([\w\d_]+)\s*=>/\1\2:/g

" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  en
  return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction
