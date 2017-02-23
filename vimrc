set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line

" backslash, space, or comma for leader
let mapleader = '\'
nmap <space> \
nmap , \

call pathogen#infect() 

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

filetype plugin indent on

augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

" Color scheme
colorscheme vividchalk
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Numbers
set number
set numberwidth=5

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Tab completion options
set wildmode=list:longest,list:full
set complete=.,w,t

" Tags
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Cucumber navigation commands
autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

" Javascript navigation commands
autocmd User Rails Rnavcommand Jmodel app/assets/javascripts/models -glob=**/* -suffix=.js
autocmd User Rails Rnavcommand Jcontroller app/assets/javascripts/controllers -glob=**/* -suffix=.js
autocmd User Rails Rnavcommand Jview app/assets/javascripts/views -glob=**/* -suffix=.js
autocmd User Rails Rnavcommand Jcollection app/assets/javascripts/collections -glob=**/* -suffix=.js
autocmd User Rails Rnavcommand Jtemplate app/assets/templates -glob=**/* -suffix=.jst

" Get off my lawn
" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'


" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=escape(expand("%:p:h"), ' ') . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>te
map <Leader>te :tabe <C-R>=escape(expand("%:p:h"), ' ') . "/" <CR>

" Opens a vsplit command with the path of the currently edited file filled in
" Normal mode: <Leader>ve
map <Leader>vs :vsplit <C-R>=expand("%:p:h") . "/" <CR>

" No Help, please
nmap <F1> <Esc>

" rspec into iterm
" function! ZRSpec(args)
"  execute ":silent !run-in-iterm 'zeus rspec -fd " . a:args . " %'"
" endfunction
" 
" nmap <CR> :call ZRSpec("-l " . <C-r>=line('.')<CR>)<CR>
" nmap <Leader>ta :call ZRSpec("")<CR>

" http://vim.wikia.com/wiki/Different_syntax_highlighting_within_regions_of_a_file
source ~/.vim/regional-highlighting.vim

" https://github.com/Lokaltog/vim-powerline
let g:Powerline_symbols = 'fancy'

" python - TODO put in correct place
autocmd BufRead *.py set ai tabstop=4 shiftwidth=4

" Disable python folding
let g:pymode_folding = 0
let g:pymode_lint = 0


set wildignore=*.pyc,*node_modules/**

map <C-n> :NERDTreeToggle<CR>

au BufRead,BufNewFile *.md set filetype=markdown

" Get bash aliases, e.g. !gist == !gist --private
let $BASH_ENV = "~/.aliases"

" fswitch.vim
" https://github.com/derekwyatt/vim-fswitch/blob/master/doc/fswitch.txt
  augroup picassoviews
    au!
    au BufEnter *.js let b:fswitchdst  = 'hbs'
    au BufEnter *.js let b:fswitchlocs = 'reg:|client/app/javascripts/app/views|client/app/templates|'
    au BufEnter *.js let b:fswitchfnames = '/_view$//'

    au BufEnter *.hbs let b:fswitchdst  = 'js'
    au BufEnter *.hbs let b:fswitchlocs = 'reg:|client/app/templates|client/app/javascripts/app/views|'
    au BufEnter *.hbs let b:fswitchfnames = '/$/_view/'
  augroup END

  "  Switch to the file and load it into the current window
  nmap <silent> <Leader>of :FSHere<cr>

  "  Switch to the file and load it into the window on the right
  nmap <silent> <Leader>ol :FSRight<cr>

  "  Switch to the file and load it into a new window split on the right
  nmap <silent> <Leader>oL :FSSplitRight<cr>

  "  Switch to the file and load it into the window on the left
  nmap <silent> <Leader>oh :FSLeft<cr>

  "  Switch to the file and load it into a new window split on the left
  nmap <silent> <Leader>oH :FSSplitLeft<cr>

  "  Switch to the file and load it into the window above
  nmap <silent> <Leader>ok :FSAbove<cr>

  "  Switch to the file and load it into a new window split above
  nmap <silent> <Leader>oK :FSSplitAbove<cr>

  "  Switch to the file and load it into the window below
  nmap <silent> <Leader>oj :FSBelow<cr>

  "  Switch to the file and load it into a new window split below
  nmap <silent> <Leader>oJ :FSSplitBelow<cr>

iab ipdb import ipdb ; ipdb.set_trace()
iab pdb import pdb ; pdb.set_trace()
iab pudb import pudb ; pu.db

" Qargs from http://vimcasts.org/episodes/project-wide-find-and-replace/
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" https://github.com/davidhalter/jedi-vim
let g:jedi#show_call_signatures = 0
let g:jedi#completions_enabled = 0


autocmd FileType html setlocal shiftwidth=2 tabstop=2


