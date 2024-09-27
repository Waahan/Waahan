" Colour related varibles
syntax on
colorscheme default 

" Make sure long lines don't wrap
set nowrap

" Search related varibles
set hlsearch
set incsearch
set smartcase

" Tabs and spaces configuration
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set tabstop=4
set softtabstop=4

" History related varibles
set history=20

" Stops vi compatiblity issues
set nocompatible

" Disable bell
set noerrorbells
set novisualbell
set t_vb=

" Disables modelines because of security concerns
set modelines=0

" Auto completion
set wildmenu
set wildmode=longest:full,full

" Smooth and fast rendering
set ttyfast

" Status line: filepath     line colum percent
set statusline=%F\ %=\ %l\,%c\ %p%%
set laststatus=1
highlight StatusLine ctermfg=blue

" Folding
set foldmethod=manual
