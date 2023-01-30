"Plugins session
call plug#begin()
	Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
	Plug 'davidosomething/vim-colors-meh'
  Plug 'frenzyexists/aquarium-vim', { 'branch': 'develop' }
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'preservim/nerdtree'
	Plug 'ryanoasis/vim-devicons'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
	Plug 'puremourning/vimspector'
  Plug 'frenzyexists/aquarium-vim', { 'branch': 'develop' }
  Plug 'sainnhe/sonokai'
  Plug 'tpope/vim-fugitive'
  Plug 'sonph/onehalf', { 'rtp': 'vim' }
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

nnoremap <C-f> :NERDTreeFind<CR>	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
call plug#end()

" General configs
set number
set guifont='SourceCodePro'
colorscheme sonokai
set path+=**
set encoding=utf-8
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a
set cursorline
set splitbelow
"set SPACE as leader key
noremap <SPACE> <Nop>
let mapleader = "\<Space>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'

"TODO -> insert GIT and Version Controll extentions
"TODO -> insert fzf
"NerdTree configurations
nnoremap <leader>e :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Telescope configs
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" set buffer navigation
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bD :%bd<CR>

" clear search results
nnoremap <leader>sc :noh<CR>

" split terminal configs
nnoremap <leader>t :split \| terminal <CR>:10winc -<CR>
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <Esc> <C-\><C-n>
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j

" COC-Prettier
nnoremap <leader>f :CocCommand prettier.formatFile <CR>

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

