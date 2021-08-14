
set number
set autoindent
set expandtab
set clipboard=unnamed
set hls
set splitright

set mouse=a

set nobackup
set noswapfile
set noerrorbells

filetype on
filetype plugin indent on

if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  		" color scheme
		call dein#add ('chriskempson/base16-vim')

  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
syntax enable

if dein#check_install()
	call dein#install()
endif

let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-default-dark
