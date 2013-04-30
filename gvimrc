set guifont=Menlo:h11
colorscheme solarized
set background=light
set linespace=3

set guioptions-=r
set guioptions-=L

set wrap

if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CtrlPMixed<CR>
endif
