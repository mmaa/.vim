set guifont=Menlo:h11
colorscheme solarized
set background=dark

set guioptions-=T
set guioptions-=r
set guioptions-=L

set wrap

if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> <Plug>PeepOpen
  imap <D-t> <Esc>:CommandT<CR>
endif
