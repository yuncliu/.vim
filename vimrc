set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-scripts/minibufexpl.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/autocomplpop'
Plugin 'omnicppcomplete'
Plugin 'tagbar'
Plugin 'https://github.com/Lokaltog/vim-powerline.git'
call vundle#end()

set nu
set nocp 
set cindent 
set autoindent 
set tabstop=4 
set expandtab
set shiftwidth=4
set ic
syntax on
set hlsearch
set cursorline
set cursorcolumn
set encoding=utf-8
colorscheme inkpot

"omnicppcomplete
let OmniCpp_SelectFirstItem=2
let OmniCpp_MayCompleteScpe=1
let OmniCpp_NamespaceSearch=1
let OmniCpp_DefaultNamespaces = ["std"]
set completeopt=menu
set tags+=~/.vim/stdcpp.tags

"Tlist
let Tlist_Use_Right_Window = 0
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1

"Minibufexpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1 

"powerline
set laststatus=2
set t_Co=256
"let g:Powerline_symbols='unicode'
"let g:Powerline_symbols='fancy'
let g:Powerline_symbols='compatible'
let g:Powerline_stl_path_style = 'relative'

"tagbar
let g:tagbar_width = 30

nnoremap <silent> <F1> :bp <CR>
nnoremap <silent> <F2> :bn <CR>
nnoremap <silent> <F3> :NERDTreeTabsToggle<CR>
nnoremap <silent> <F8> <C-W>w
"nnoremap <silent> <F12> :Tlist <CR>
nnoremap <silent> <F12> :TagbarToggle<CR>
