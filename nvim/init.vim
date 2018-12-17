set number
set encoding=utf8
set ignorecase
set hlsearch
set autoindent
set autoread
set statusline+=%F
set relativenumber

set cc=120
set cursorline
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set smartindent
set backspace=2

set t_Co=256
colorscheme gruvbox
set background=dark

let g:mapleader=','

" IndentLine
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_char = '⎸'
let g:indentLine_color_term = 239

" airline
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '⭡'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.readonly = '⭤'

let g:used_javascript_libs = 'jquery,vue'

let g:ackprg = 'ag --nogroup --nocolor --column'

nmap <Leader><space> :nohl<CR>
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>
nmap <F8> :TagbarToggle<CR>

map <C-k><C-b> :NERDTreeToggle<CR>
map <C-n><C-n> :NERDTreeFocus<CR>
map <C-n><C-f> :NERDTreeFind<CR>

" FZF
nmap <leader>f :Files<CR>
nmap ; :Buffers<CR>
nmap <Leader>t :Tags<CR>
map <C-f> :Ack!<space>
nmap \x :cclose<CR>
nmap <Leader>u :Ack! "\b<cword>\b" <CR>

" Move between open buffers.
map <C-n> :bnext<CR>
map <C-p> :bprev<CR>

" RSpec.vim mappings
map <Leader>r :call RunCurrentSpecFile()<CR>
map <Leader>l :call RunLastSpec()<CR>

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

call plug#begin('~/.config/nvim/plugged')

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'
Plug 'bbatsov/rubocop'
Plug 'elzr/vim-json'
Plug 'slashmili/alchemist.vim'
Plug 'othree/html5.vim'
Plug 'slim-template/vim-slim'
Plug 'hail2u/vim-css3-syntax'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'ekalinin/dockerfile.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Code support
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'docunext/closetag.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'yggdroot/indentline'
Plug 'luochen1990/rainbow'
Plug 'mattesgroeger/vim-bookmarks'
Plug 'raimondi/delimitmate'
Plug 'valloric/youcompleteme'
Plug 'w0rp/ale'
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'
Plug 'mileszs/ack.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'

" Decor
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'

" Tools
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-unimpaired'
Plug 'qpkorr/vim-bufkill'

call plug#end()
