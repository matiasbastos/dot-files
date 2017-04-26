set encoding=utf8

"""" START Vundle Configuration 

" Disable file type for vundle
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Utility
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'

" Generic Programming Support 
Plugin 'Townk/vim-autoclose'

" Git Support
Plugin 'kablamo/vim-git-log'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
"Plugin 'jaxbot/github-issues.vim'

Plugin 'ryanoasis/vim-devicons'
Plugin 'itchyny/lightline.vim'
call vundle#end()            " required
filetype plugin indent on    " required
"""" END Vundle Configuration 

"""" START general conf and mappings 
syntax enable
set number
set nocompatible
set tabstop=4
set shiftwidth=4
set expandtab
set incsearch
set autoindent
set smartindent
set history=10000
set cursorline
set ruler
set laststatus=2
set textwidth=0
set nowrap
set scrolljump=5
set scrolloff=3
set backspace=2
" Turn on relative line numbers except for current line and uses absolute line
" numbers for insert mode.
set relativenumber
set number
autocmd InsertEnter * :set number norelativenumber
autocmd InsertLeave * :set number relativenumber
"end relative numbers
nmap Z :tabprevious<cr>
nmap X :tabnext<cr>
nmap <S-t> :tabnew<cr>
map <S-t> :tabnew<cr>
map Z :tabprevious<cr>
map X :tabnext<cr>
map D :NERDTreeToggle<cr>
nmap <silent> <C-g> :Gitv<CR>
nmap <silent> <C-up> :wincmd k<CR>
nmap <silent> <C-down> :wincmd j<CR>
nmap <silent> <C-left> :wincmd h<CR>
nmap <silent> <C-right> :wincmd l<CR>
nmap <silent> <A-left> :vertical resize -5<cr>
nmap <silent> <A-down> :resize +5<cr>
nmap <silent> <A-up> :resize -5<cr>
nmap <silent> <A-right> :vertical resize +5<cr>
nmap R :w<cr>:!!<cr>
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
"nmap A "aP
"nmap S "sp
set hlsearch
set t_Co=256
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
colorscheme desert
"""" END general conf and mappings 


"""" START plugins Configuration 
let g:user_emmet_leader_key=','
let NERDTreeQuitOnOpen=1
imap <S-CR> <ESC>:execute 'normal o' . EndToken()<CR>O
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_select_first = 0
autocmd FileType python setlocal completeopt-=preview
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$|env'

"""" END plugins Configuration 


"""" START lightline Configuration 
let g:lightline = {
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fugitive': 'MyFugitive',
      \   'fileformat': 'MyFileformat',
      \ }
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction
"""" END lightline Configuration 

execute pathogen#infect()
