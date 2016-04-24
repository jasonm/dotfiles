set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line

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
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

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

" Maps autocomplete to tab
imap <Tab> <C-P>

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

" http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" ~/.vim/bundle/python-mode
let g:pymode_folding = 0


" https://github.com/kien/rainbow_parentheses.vim
au VimEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound

" Also let space be leader, easy on the fingers
nmap <Space> <leader>

" Try this for a while
let g:jedi#completions_enabled = 0

