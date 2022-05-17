" Idk
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Plugins
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Plug 'Yggdroot/indentLine'
Plug 'psliwka/vim-smoothie'
Plug 'elkowar/yuck.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neovimhaskell/haskell-vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'rktjmp/lush.nvim'
Plug 'ap/vim-css-color'

call plug#end()

" Config vars
set updatetime=300
set nu
set fillchars=vert:\┃
set mouse=a
set termguicolors

let g:indent_blankline_show_first_indent_level = v:false
let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_show_trailing_blankline_indent = v:false
let g:NERDTreeWinSize = 35
let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'
let g:haskell_indent_if = 0

let mapleader = ";"

syntax on
filetype indent on
set shiftwidth=4
set expandtab
set splitbelow

set guicursor=n-v-c:block,i-ci-ve:hor20,r-cr:ver25,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

colorscheme mono

" Aliases
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
call SetupCommandAlias("W","w")
call SetupCommandAlias("nt","NERDTree")
call SetupCommandAlias("term","12sp <bar> terminal")
call SetupCommandAlias("config","e ~/.config/nvim/init.vim")

" Mappings
map <F8> :NERDTreeToggle<CR>
map <leader>j ddp
map <leader>k ddkkp
map <c-y> "+y
map <c-p> "+p
map <leader>h <c-w><
map <leader>l <c-w>>
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

" coc.nvim stuff
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

" Autocmds
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd TermOpen * setlocal nonumber


