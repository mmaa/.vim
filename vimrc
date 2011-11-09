runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

set autoread
set nobackup
set nowritebackup
set noswapfile

set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8

set wrap
set tabstop=2                         " a tab is two spaces
set shiftwidth=2                      " an autoindent (with <<) is two spaces
set expandtab	                        " use spaces, not tabs
set list listchars=tab:\ \ ,trail:·   " a tab should display as "  ", trailing whitespace as "·"
set backspace=indent,eol,start        " backspace through everything in insert mode
let macvim_hig_shift_movement = 1     " mvim shift-arrow-keys (required in vimrc)

set hlsearch    " highlight matches (TODO: Map something convenient to nohlsearch)
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

set tags=./tags

set laststatus=2  " always show the status bar
set statusline=%n:\ %<%f\ %m\ %=%l/%L\ %P

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

filetype plugin indent on " Turn on filetype plugins (:help filetype-plugin)

" In Makefiles, use real tabs, not tabs expanded to spaces
au FileType make set noexpandtab

" Set the Ruby filetype for a number of common Ruby files without .rb
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" Treat JSON files like JavaScript
au BufNewFile,BufRead *.json set ft=javascript

au BufNewFile,BufRead *.pig set filetype=pig syntax=pig

let mapleader = ","

" Opens the directory browser for the directory of the current path.
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

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
command! TW :call <SID>StripTrailingWhitespaces()<CR>

function! <SID>StripTrailingWhitespaces()
  " Save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Restore previous search history, and cursor position.
  let @/=_s
  call cursor(l, c)
endfunction
