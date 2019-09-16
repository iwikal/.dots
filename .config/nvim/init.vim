if &compatible
  set nocompatible
endif

let s:settings = {}
let s:settings.cache_dir = $HOME . '/.cache'
let s:settings.dein_dir = s:settings.cache_dir . '/dein'
let s:settings.dein_repo_dir = s:settings.dein_dir . '/repos/github.com/Shougo/dein.vim'

" Add the dein installation directory into runtimepath
let &runtimepath .= ',' . s:settings.dein_repo_dir

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:settings.dein_repo_dir)
    execute '!git clone --depth 1 https://github.com/Shougo/dein.vim ' . s:settings.dein_repo_dir
  endif
  execute 'set rtp^=' . fnamemodify(s:settings.dein_repo_dir, ':p')
endif

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('frankier/neovim-colors-solarized-truecolor-only')
  call dein#add('neoclide/coc.nvim', {'build': './install.sh nightly'})
  call dein#add('sheerun/vim-polyglot')
  call dein#add('tpope/vim-fugitive')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

set termguicolors
set background=dark
colorscheme solarized

" transparent background
hi Normal guibg=NONE ctermbg=NONE

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

" always show signcolumns
set signcolumn=yes

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
