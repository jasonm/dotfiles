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
set number
set relativenumber
function! ToggleRelativeNumber()
  if g:relativenumber == 0
    let g:relativenumber = 1
    set norelativenumber
    set number
  else
    let g:relativenumber = 0
    set relativenumber
    set number
  endif
endfunction
map <C-L> :call ToggleRelativeNumber()<cr>

" http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
" autocmd FocusLost * :set number
" autocmd FocusLost * :set norelativenumber
" 
" autocmd FocusGained * :set nonumber
" autocmd FocusGained * :set relativenumber
" 
" autocmd InsertEnter * :set number
" autocmd InsertEnter * :set norelativenumber
" 
" autocmd InsertLeave * :set nonumber
" autocmd InsertLeave * :set relativenumber

macmenu File.Print key=<nop>

" requires Vim 7.4.399 or later per `:help 'cm'`
set cryptmethod=blowfish2
