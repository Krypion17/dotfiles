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
Plug 'LnL7/vim-nix'
Plug 'lambdalisue/suda.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

"Neo tree
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'

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
let g:airline_powerline_fonts = 2
let g:airline_left_sep = "\uE0B4"
let g:airline_left_alt_sep = "\uE0B5"
let g:airline_right_sep = "\uE0B6"
let g:airline_right_alt_sep = "\uE0B7"
let g:airline_theme='catppuccin'
let g:haskell_indent_if = 0
let g:coc_max_treeview_width = 20
let g:coc_borderchars = ['─', '│', '─', '│', '╭', '╮', '╯', '╰']
let bufferline = get(g:, 'bufferline', {})
let g:bufferline.auto_hide = v:true

let g:neo_tree_remove_legacy_commands = 1

let mapleader = ";"

syntax on
filetype indent on
set shiftwidth=4
set expandtab
set splitbelow

set guicursor=n-v-c:block,i-ci-ve:hor20,r-cr:ver25,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

" colorscheme mono
" Neotree

lua << EOF
require("catppuccin").setup {
    dim_inactive = {
        enabled = true,
        shade = "dark",
    },
    custom_highlights = function(colors)
        return {
            VertSplit = { bg = "#181825", fg = "#181825" }
        }
    end,
    integrations = {
        neotree = true,
        barbar = true,
    }
}

require("neo-tree").setup({
    close_if_last_window = true,
    add_blank_line_at_top = true,
    default_component_configs = {
        indent = {
            with_expanders = true,
        },
    },

})
callback = vim.schedule_wrap(function() 
    vim.cmd("Neotree show")
end)
callback()
EOF
colorscheme catppuccin-mocha

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

" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>

" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>

" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>

" coc.nvim stuff
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? "\<C-p>" : "\<C-h>"

"This expression seems to be responsible for coc formatting on enter
" inoremap <silent><expr> <cr> '\C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>'
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"I this just says autocomplete with the first option if pop up menu is open.
"If it is not open, just do a regular tab.
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"

" Autocmds
" autocmd VimEnter * NERDTree | wincmd p
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd TermOpen * setlocal nonumber nobuflisted
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']
