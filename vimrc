set langmenu=en_US.UTF-8
set nocompatible     " be iMproved, required
set number           " shows line numbers
set cursorline       " highlight cursor line
set laststatus=2     " this is needed for airline
" let &colorcolumn="100,".join(range(120,256),",")"   " column with 100
set wildmenu
set wildmode=list:longest,full    " expand and folders/tabs when opening a file
set backspace=2      " makes backspace work as it should work
set mouse=a
set wildignore+=*/public/*,*/tmp/*,*/deps/*
set clipboard=unnamed " copy to clipboard (works on mac)

filetype off         " required
let mapleader=","

" Plug setup
call plug#begin()

Plug 'flazz/vim-colorschemes'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'elixir-editors/vim-elixir'
Plug 'honza/vim-snippets'
Plug 'isRuslan/vim-es6'
Plug 'leshill/vim-json'
Plug 'pangloss/vim-javascript'

Plug 'airblade/vim-gitgutter'
Plug 'DataWraith/auto_mkdir'
Plug 'jiangmiao/auto-pairs'
Plug 'sickill/vim-pasta'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'c-brenn/fuzzy-projectionist.vim'
Plug 'caironoleto/vim-projectionist-elixir'

call plug#end()
" End Plug setup

syntax on
filetype on
filetype plugin indent on    " required

" Color scheme
" colorscheme molokai
colorscheme Tomorrow-Night-Bright
" set background=dark
hi Normal guibg=NONE ctermbg=NONE
" let g:solarized_contrast="low"
" let g:solarized_menu=0
" let g:tmuxline_theme = 'iceberg'

" Airline config
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1
let g:airline_section_y = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#fileformat#enabled = 0

" tags
" set tags=./.tags;,~/.vimtags

" ctags
map <silent> <Leader>rt :!retag<cr>

" Set indentation
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Set folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

" scrolling
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" search
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set smartcase       " ...unless we type a capital

" ==== NERD tree
" " Open the project tree and expose current file in the nerdtree with Ctrl-\
nnoremap <silent> <C-\> :NERDTreeFind<CR>:vertical<CR>
let NERDTreeIgnore = ['build$']

"Move back and forth through previous and next buffers
"with ,z and ,x
nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>

" opens/closes folds
nnoremap <Space> za

" ,q to toggle quickfix window (where you have stuff like Ag)
" ,oq to open it back up (rare)
nmap <silent> ,qc :cclose<CR>
nmap <silent> ,qo :copen<CR>

function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" shortcuts for changing windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Resize
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Javascript config

let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

" Snips config
"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Vim move config
"
let g:move_key_modifier = 'C'
