set nocompatible              " be iMproved, required

filetype plugin indent on

set number
set t_Co=256
syntax on
set background=dark
colorscheme gruvbox

let mapleader = " "
set nocompatible
" set noshowmode

set ls=2
set hlsearch

" Improve vim's scrolling speed
set ttyfast
set ttyscroll=3
set lazyredraw

set wildmenu			" show completion on the mode-line

" Whitespace
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

" Make ESC respond faster
set timeoutlen=1000
set ttimeoutlen=0

" Make searching better
set gdefault      " Never have to type /g at the end of search / replace again
set ignorecase    " case insensitive searching (unless specified)
set smartcase
set hlsearch
nnoremap <silent> <leader>, :noh<cr> " stop highlight after searching  
set incsearch
set showmatch

set autoindent    " indent on enter
set smartindent   " do smart indenting when starting a new line
set shiftround    " indent to the closest shiftwidth

set mouse=a       " enable the use of the mouse
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set sidescroll=1

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

"toggke relative numbering, and set to absolute on loss of focus or insert
set rnu
function! ToggleNumbersOn()
  set nu!
  set rnu
endfunction
function! ToggleRelativeOn()
  set rnu!
  set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

" faster pane navigation look tmux config
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/ctrlp.vim

" Highlight current line on the active window only
augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

execute pathogen#infect()
call pathogen#helptags()

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") |
let NERDTreDTreeQuitOnOpen=1
nnoremap <leader>n :NERDTreeToggle<CR>


"Java Script Syntax
Plugin 'morhetz/gruvbox'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'vim-airline/vim-airline'        " fancy statusline
Plugin 'vim-airline/vim-airline-themes' " themes for vim-airline

let g:ailine_powerline_fonts = 1

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git\|node_modules\|bin\|\.hg\|\.svn\|build\|log\|resources\|coverage\|doc\|tmp\|public/assets\|vendor\|Android',
  \ 'file': '\.jpg$\|\.exe$\|\.so$\|tags$\|\.dll$'
  \ }
nnoremap <C-b> :CtrlPBuffer<cr>
" CtrlP Delete

let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_multi_buffers = 1

nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
