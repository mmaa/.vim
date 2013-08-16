set guifont=Meslo\ LG\ M\ for\ Powerline:h13
colorscheme solarized
set background=dark

set guioptions-=r
set guioptions-=L

set wrap

if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CtrlPMixed<CR>
endif
