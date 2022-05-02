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
Plug 'psliwka/vim-smoothie'
Plug 'elkowar/yuck.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neovimhaskell/haskell-vim'
  
call plug#end()

let mapleader = ";"

map <F8> :NERDTreeToggle<CR>
map <leader>j ddp
map <leader>k ddkkp
map <c-y> "+y
map <c-p> "+p
map <c-s> <c-w><
map <c-a> <c-w>>
map <c-k> <c-w>+
map <c-m> <c-w>-
map <leader><cr> :source %<cr>
map <Space> :noh<cr>

tnoremap <Esc> <c-\><c-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
noremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


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

fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
call SetupCommandAlias("W","w")
call SetupCommandAlias("nt","NERDTree")

set updatetime=300
set nu
set fillchars=vert:\┃
set mouse=a

let g:indentLine_char = '│' "▏'
let g:NERDTreeWinSize = 35
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:haskell_indent_if = 0

syntax on
filetype indent on
set shiftwidth=4
set expandtab

colorscheme natural
