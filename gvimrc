" Font
set guifont=Monaco:h15.00

" No audible bell
set vb

" No toolbar
set guioptions-=T

" Use console dialogs
set guioptions+=c

" Local config
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif

" http://stackoverflow.com/questions/762515/vim-remap-key-to-toggle-line-numbering
" source: http://stackoverflow.com/questions/4387210/vim-how-to-map-two-tasks-under-one-shortcut-key
let g:relativenumber = 0
set nonumber
set relativenumber
function! ToggleRelativeNumber()
  if g:relativenumber == 0
    let g:relativenumber = 1
    set number
    set norelativenumber
  else
    let g:relativenumber = 0
    set nonumber
    set relativenumber
  endif
endfunction
map <C-L> :call ToggleRelativeNumber()<cr>
