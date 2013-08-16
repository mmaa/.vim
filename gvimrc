set guifont=Consolas:h14
colorscheme solarized
set linespace=2

set guioptions-=r
set guioptions-=L

set wrap

if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CtrlPMixed<CR>
endif
