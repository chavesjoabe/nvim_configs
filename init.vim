" Author: @theteachr - @joabechaves

" Plugins {{{
call plug#begin()

	" Vimspector
	Plug 'puremourning/vimspector'
	" quality of life
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-surround'
	" LSP Support
	Plug 'neovim/nvim-lspconfig'                           " Required
	Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'} " Optional
	Plug 'williamboman/mason-lspconfig.nvim'               " Optional
	   " Autocompletion
	Plug 'hrsh7th/nvim-cmp'     " Required
	Plug 'hrsh7th/cmp-nvim-lsp' " Required
	Plug 'L3MON4D3/LuaSnip'     " Required
	Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}
	
	" syntax
	"  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	"  Plug 'nvim-treesitter/playground'
	
	" telescope
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	
	" colorschemes
	" Plug 'ajh17/spacegray.vim'
	Plug 'arcticicestudio/nord-vim'
	Plug 'ayu-theme/ayu-vim'
	Plug 'bluz71/vim-nightfly-guicolors'
	Plug 'ghifarit53/tokyonight-vim'
	Plug 'nanotech/jellybeans.vim'
	Plug 'sainnhe/everforest'
	Plug 'sainnhe/gruvbox-material'
	Plug 'sainnhe/sonokai'
	Plug 'EdenEast/nightfox.nvim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	" Markdowns support and preview
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
	
call plug#end()

" }}}

" Treesitter Settings {{{

" lua require 'nvim-treesitter.configs'.setup { highlight = { enable = true }}

" ignore TS Errors
highlight link TSError Normal

" }}}

" Options {{{

set showcmd
" set cursorline cursorlineopt=number
set cursorline
set incsearch
set ruler
set tabstop=2
set shiftwidth=2
set smartcase
set smarttab
set ignorecase
set expandtab
" set noexpandtab
" set nohlsearch
set smartindent
set autoread
set hidden
set nowrap
set relativenumber
set shortmess+=IFT
"set termguicolors
set inccommand=split
set laststatus=0
set splitright
set splitbelow
set noswapfile
set nobackup
set nowritebackup
set listchars=tab:→\ ,eol:¬,space:·,trail:•,extends:⟩,precedes:⟨

" }}}

" Filetype Settings {{{

filetype plugin on
filetype indent on

" }}}

" Keymaps {{{
noremap <SPACE> <Nop>
let mapleader = "\<Space>"

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <silent> <leader>s :set hlsearch!<CR>
nnoremap <silent> <leader>n :set relativenumber!<CR>
vnoremap Y "+y

" split window
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

" buffer navigation
nnoremap <silent> <leader>. :bn<CR>
nnoremap <silent> <leader>, :bp<CR>

" telecope bindings
nnoremap <leader>F <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>

" show list
nnoremap <silent> <Esc> :set list!<CR>

" normal escape in terminal
tnoremap <Esc> <C-\><C-n>

" }}}

" Custom Text Objects {{{

omap ae :<C-U>silent! normal! ggVG<CR>
vnoremap ae :<C-U>silent! normal! ggVG<CR>

" }}}

" Colorscheme Settings {{{

" everforest
let g:everforest_background = 'hard'

" gruvbox
let g:gruvbox_background = 'hard'

" ayu [mirage|dark|light]
let ayucolor = 'dark'

" sonokai [default|atlantis|andromeda|shusia|maia|espresso]
let g:sonokai_style = 'espresso'

colorscheme sonokai

" }}}

" Airline properties {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_left_sep = '>'
let g:airline_symbols_ascii = 1
" }}}

" Vimspector configs
let g:vimspector_enable_mappings = 'HUMAN'

function CreateVimspectorFile()
  let vimspectorContent = '{"configurations": {"run": {"adapter": "vscode-node","breakpoints": {"exception": {"all": "N","uncaught": "N"}},"configuration": {"request": "attach","type": "node","stopOnEntry": false,"console": "integratedTerminal","program": "${workspaceFolder}/build/index.js","skipFiles": ["node_modules/*/.js", "<node_internals>/*/.js"],"processId": "${processId}"}}}}'
:call writefile([vimspectorContent], '.vimspector.json', 'a')
endfunction

nnoremap <leader>dcf :call CreateVimspectorFile()<CR>
nnoremap <leader>D :call vimspector#Launch()<CR>
nnoremap <leader>dR :call vimspector#Reset()<CR>
nnoremap <leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>dT :call vimspector#ClearBreakpoints()<CR>
nnoremap <leader>dC :call vimspector#Continue()<CR>

nmap <Leader>dr <Plug>VimspectorRestart
nmap <leader>dj <Plug>VimspectorStepOver
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto

" Markdown Preview Configs
nnoremap <leader>mdp :MarkdownPreview<CR>
let g:mkdp_theme = 'light'

" remap CTRL-W command to use it inside tmux
nnoremap <C-e> <C-w>


lua <<EOF
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
   lsp.default_keymaps({buffer = bufnr})
     vim.keymap.set({'n', 'x'}, '<leader>ff', function()
             vim.lsp.buf.format({async = false, timeout_ms = 10000})
                 end)
     end)

     -- (Optional) Configure lua language server for neovim
     require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

     lsp.setup()
EOF
