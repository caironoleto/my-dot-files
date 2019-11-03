set langmenu=en_US.UTF-8
set nocompatible     " be iMproved, required
set number           " shows line numbers
set cursorline       " highlight cursor line
set laststatus=2     " this is needed for airline
let &colorcolumn="100,".join(range(120,256),",")"   " column with 100
set wildmode=list:longest,full    " expand and folders/tabs when opening a file
set backspace=2      " makes backspace work as it should work
set mouse=a
set wildignore+=*/public/*,*/tmp/*,*/deps/*
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|public\|deps\|_build\|fonts\|ath\.\*'
set clipboard=unnamed " copy to clipboard (works on mac)
let g:NERDTreeIgnore = ['^build$']

filetype off         " required
let mapleader=","

" Vundle config
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-rails'
"Plugin 'vim-ruby/vim-ruby'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'elixir-lang/vim-elixir'
Plugin 'DataWraith/auto_mkdir'
Plugin 'jiangmiao/auto-pairs'
Plugin 'sickill/vim-pasta'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'leshill/vim-json'
" ale is Asynchronous Lint Engine
Plugin 'isRuslan/vim-es6'
Plugin 'ervandew/supertab'
Plugin 'kchmck/vim-coffee-script'
Plugin 'matze/vim-move'
Plugin 'tpope/vim-fugitive'
Plugin 'rhysd/vim-grammarous'

call vundle#end()            " required
filetype on
filetype plugin indent on    " required
syntax enable

" Color scheme
" colorscheme molokai
colorscheme Tomorrow-Night-Bright
set background=dark
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
