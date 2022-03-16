set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'Yggdroot/indentLine'
  
call plug#end()

let mapleader = ";"

map <F8> :NERDTreeToggle<CR>
map <c-y> "+y
map <c-p> "+p
map <c-s> <c-w><
map <c-a> <c-w>>
map <c-k> <c-w>+
map <c-m> <c-w>-
map <leader><cr> :source %<cr>
tnoremap <leader><Esc> <c-\><c-n>

autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
set guicursor=n-v-c:block,i-ci-ve:hor20,r-cr:ver25,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

autocmd TermOpen * setlocal nonumber

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"This expression seems to be responsible for coc formatting on enter
"inoremap <silent><expr> <cr> '\C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>'
"I this just says autocomplete with the first option if pop up menu is open.
"If it is not open, just do a regular tab.
inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"


set updatetime=300
set nu
set fillchars=vert:\▏
set mouse=a

let g:indentLine_char = '▏'

filetype indent on
set shiftwidth=4

colorscheme natural
