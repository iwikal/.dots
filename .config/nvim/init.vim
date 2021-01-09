if &compatible
  set nocompatible
endif

let s:settings = {}
let s:settings.cache_dir = $HOME . '/.cache'
let s:settings.dein_dir = s:settings.cache_dir . '/dein'
let s:settings.dein_repo_dir = s:settings.dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:settings.dein_installed = 1

" Add the dein installation directory into runtimepath
if &runtimepath !~# '/dein.vim'
  execute 'set rtp^=' . fnamemodify(s:settings.dein_repo_dir, ':p')
endif

if !isdirectory(s:settings.dein_repo_dir)
  execute '!git clone --depth 1 https://github.com/Shougo/dein.vim ' . s:settings.dein_repo_dir
  let s:settings.dein_installed = 0
endif

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Chiel92/vim-autoformat')

  " call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('MaxMEllon/vim-jsx-pretty')
  call dein#add('delphinus/vim-firestore')
  call dein#add('frankier/neovim-colors-solarized-truecolor-only')
  " call dein#add('iwikal/typescript-vim')
  call dein#add('neoclide/coc.nvim', {'build': 'yarn install --frozen-lockfile'})
  call dein#add('pangloss/vim-javascript')
  " call dein#add('neovim/nvim-lsp')
  call dein#add('reasonml-editor/vim-reason-plus')
  call dein#add('ron-rs/ron.vim')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-unimpaired')

  call dein#end()
  call dein#save_state()
endif

if s:settings.dein_installed == 0
  call dein#install()
endif

" lua require'nvim_lsp'.rust_analyzer.setup{}

" Use LSP omni-completion in Rust files
autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc

" autocmd BufWrite * :Autoformat

autocmd BufRead,BufNewFile *.scn setlocal filetype=ron

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

filetype plugin indent on
syntax enable

set guifont=Monospace:h15
set termguicolors
set background=dark
let g:solarized_termtrans= 1
colorscheme solarized

set colorcolumn=80
set number

set ignorecase
set smartcase

set expandtab
set shiftwidth=2
set softtabstop=2

let mapleader = " "

nnoremap Ä :
nnoremap <silent> <leader>sc :noh<cr>
nmap <leader>w <C-w>

nnoremap Q gq

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

nmap <leader>rn <Plug>(coc-rename)

" always show signcolumns
set signcolumn=yes
set colorcolumn=+2

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
"nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
"nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
"nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
"nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
"nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
