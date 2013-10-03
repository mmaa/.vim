set guifont=Menlo:h13
set linespace=2

set guioptions-=r
set guioptions-=L

if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CtrlPMixed<CR>
endif
