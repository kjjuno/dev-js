"////////////////////////////
"// Vim settings
"// No plugins needed ...

syntax enable
filetype off                     " required
colorscheme industry
set encoding=utf-8
set nocompatible                 " be iMproved, required
set statusline+=%F               "Show the full path to the current file
set number                       "Show line numbers
set relativenumber               "Show relative line numbers
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
set showbreak=+++                " Wrap-broken line prefix
set showmatch                    " Highlight matching brace
set hlsearch                     " Highlight search results
set smartindent                  " Enable smart-indent
set undolevels=1000              " Number of undo levels
set ruler                        " Show row and column ruler information, but doesn't work with YCM

"This, from here - http://stackoverflow.com/questions/676600/vim-search-and-replace-selected-text -
"lets you highlight some text and replace after hitting ctrl-r
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

"////////////////////////////
"// Vundle installs

"To install these plugins, at terminal do `vim +PluginInstall +qall`, or in vim do `:PluginInstall`
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'kien/ctrlp.vim'          "Best used with ctags, install at terminal
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'w0rp/ale'

call vundle#end()                " required
filetype plugin indent on        " required

"////////////////////////////
"// CtrlP

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"The experience with CtrlP is enhance with ctags -- sudo apt-get install ctags
"Run ctags -R * at the root directory to generate a tags file.
"Ctrl] will take you to a definition file, and adds one to the visted tag stack, and ctrl-O pops one
"from the stack
set autochdir
set tags=tags;

"////////////////////////////
"// ale

let b:ale_linters = ['eslint']
let g:ale_linters_explicit = 1
let b:ale_fixers = ['prettier', 'eslint']
"let b:ale_fix_on_save = 1
