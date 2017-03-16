set nocompatible     " be iMproved, required
set number           " shows line numbers
set hlsearch         " highlight search results
set cursorline       " highlight cursor line
set laststatus=2     " this is needed for airline
let &colorcolumn="80,".join(range(90,256),",")"   " column with 80
set wildmode=list    " expand and folders/tabs when opening a file
set backspace=2      " makes backspace work as it should work
set mouse=a
set wildignore+=*/public/*,*/tmp/*
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|public'

filetype off         " required
let mapleader=","

" Vundle config
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rking/ag.vim'
"Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-dispatch'
Plugin 'airblade/vim-gitgutter'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'junegunn/vim-easy-align'
Plugin 'Konfekt/FastFold'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/syntastic'
Plugin 'elixir-lang/vim-elixir'
Plugin 'mattreduce/vim-mix'
Plugin 'majutsushi/tagbar'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'DataWraith/auto_mkdir'
Plugin 'jodosha/vim-greenbar'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'tpope/vim-commentary'
Plugin 'fatih/vim-go'
Plugin 'rhysd/vim-crystal'
" Plugin 'eagletmt/ghcmod-vim'
" Plugin 'Shougo/vimproc.vim'
Plugin 'ngmy/vim-rubocop'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'sickill/vim-pasta'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'isRuslan/vim-es6'
Plugin 'ervandew/supertab'
Plugin 'mileszs/ack.vim'
Plugin 'kchmck/vim-coffee-script'

call vundle#end()            " required
filetype on
filetype plugin indent on    " required
syntax enable

" Color scheme
colorscheme molokai
set background=dark
let g:solarized_contrast="low"
let g:solarized_menu=0
let g:tmuxline_theme = 'iceberg'

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

" Airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

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
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" RSpec.vim mappings
au FileType ruby map <Leader>t :call RunCurrentSpecFile()<CR>
au FileType ruby map <Leader>s :call RunNearestSpec()<CR>
au FileType ruby map <Leader>l :call RunLastSpec()<CR>
au FileType ruby map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "!bundle exec rspec {spec} --format=progress"

" ==== NERD tree
" " Open the project tree and expose current file in the nerdtree with Ctrl-\
nnoremap <silent> <C-\> :NERDTreeFind<CR>:vertical<CR>

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

" Text objects
runtime macros/matchit.vim

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

" Tagbar
nmap <F9> :TagbarToggle<CR>

" Resize
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" The Silver Searcher
" Inspired by http://robots.thoughtbot.com/faster-grepping-in-vim/
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --path-to-agignore\ $HOME/.agignore

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " bind K to grep word under cursor
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

  " bind , (backward slash) to grep shortcut
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

  map <Leader>f :Ag<SPACE>
endif
