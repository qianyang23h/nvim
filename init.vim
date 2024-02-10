" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" ===
" === Base config
" ===
" Set the Leader key for keyboard mappings to ;
let mapleader=";" 

 " Display line numbers
set number

" Enable syntax highlighting
syntax on

" Tab
" Set the width of a tab character to 4 spaces
set tabstop=4

" Set the width of indentation for the >> and << commands in Normal mode to 4 spaces
set shiftwidth=4

" Set the number of spaces inserted for each <Tab> character in insert mode
set softtabstop=4 	


" Search
" Highlighting of search
set hlsearch

" ignore case
set ignorecase



" Enable true color support for the terminal
set termguicolors

" reletive number
set relativenumber

" 
set cursorline

" Enable showcmd to display partial command and keystrokes in the last line.
set showcmd

" Enable automaticline wrapping for better readability.
set wrap 



" ==================== Cursor Movement ====================
" K/J move 5 time than k/j
noremap <silent> K 5k
noremap <silent> J 5j


" W/B 
noremap <silent> W 5w
noremap <silent> B 5b








" ===
" === Install Plugins with vim-plug
" ===

call plug#begin('~/.config/nvim/plugged')

" support of language
" go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }

" theme
Plug 'ayu-theme/ayu-vim'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" code display
Plug 'altercation/vim-colors-solarized'

" tabline
Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'ryanoasis/vim-devicons'
call plug#end()



" ===
" === theme
" ===
set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu


" ===
" === vim-go
" ===
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0


" ===
" === coc.vim
" ===

" extensions list
let g:coc_global_extensions = [
	\ 'coc-json',
	\ 'coc-explorer',
	\ 'coc-tsserver',
	\ 'coc-vimlsp']


" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=100 

" se tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-o> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" se `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K t show documentation in preview window
nnoremap <silent> Z :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('Z', 'in')
  endif
endfunction

" coc-explorer 
nmap tt :CocCommand explorer<CR>



