"Plugins session
call plug#begin(stdpath('data') . '/plugged')
	Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
	Plug 'davidosomething/vim-colors-meh'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'preservim/nerdtree'
	Plug 'ryanoasis/vim-devicons'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
	Plug 'puremourning/vimspector'

nnoremap <C-f> :NERDTreeFind<CR>	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
call plug#end()

" General configs
set number

colorscheme meh
set encoding=utf-8

"set SPACE as leader key
noremap <SPACE> <Nop>
let mapleader = "\<Space>"

"Tab Spaces
let tabstop=2

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = 'arrow'
let g:airline#extensions#tabline#left_alt_sep = '|'

"TODO -> insert GIT and Version Controll extentions
"TODO -> insert fzf
"NerdTree configurations
nnoremap <leader>e :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Telescope configs
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Launch Vimspector << DEBUGGER
nmap <Leader>db <Plug>VimspectorBreakpoints

