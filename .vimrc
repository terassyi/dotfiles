filetype on
filetype plugin indent on


" set background=dark
set termguicolors
set relativenumber
set wildmenu

set ruler
" set cursorline
" set cursorcolumn
set number
set hidden

set nobackup
set noswapfile
set noerrorbells

set incsearch
set wrapscan
set hlsearch

set laststatus=2

set autoindent
set tabstop=4
set shiftwidth=4

set mouse=a

"dein scripts---------------------------
if &compatible
	set nocompatible
endif

set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('$HOME/.cache/dein')
	call dein#begin('$HOME/.cache/dein')
		call dein#add('preservim/nerdtree')
		call dein#add('tpope/vim-fugitive')
		call dein#add('majutsushi/tagbar')
		call dein#add('nathanaelkane/vim-indent-guides')
		call dein#add('junegunn/fzf', {'build': './install --all'})
		call dein#add('junegunn/fzf.vim')
		call dein#add('vim-airline/vim-airline')
		call dein#add('vim-airline/vim-airline-themes')
		call dein#add('Shougo/unite.vim')

		call dein#add('prabirshrestha/vim-lsp')
		call dein#add('mattn/vim-lsp-settings')
		call dein#add('prabirshrestha/asyncomplete.vim')
		call dein#add('prabirshrestha/asyncomplete-lsp.vim')
		call dein#add('Shougo/deoplete.nvim')
		call dein#add('lighttiger2505/deoplete-vim-lsp')
		" call dein#add('cohama/lexima.vim')

		call dein#add('doums/darcula')
		call dein#add('sainnhe/sonokai')
	call dein#end()
endif

if dein#check_install()
	call dein#install()
endif


" nerd tree settings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Indent highlighit
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" color
colorscheme darcula
" colorscheme sonokai

autocmd VimEnter,ColorScheme * highlight Comment ctermfg=235 ctermbg=237
syntax enable

nnoremap <silent> <Leader>g :<C-u>silent call <SID>find_rip_grep()<CR> 
function! s:find_rip_grep() abort
    call fzf#vim#grep(
                \   'rg --ignore-file ~/.ignore --column --line-number --no-heading --hidden --smart-case .+',
                \   1,
                \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%', '?'),
                \   0,
                \ )
endfunction

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'


if has('vim_starting')
	let &t_SI .= "\e[6 q"
	let &t_EI .= "\e[2 q"
	let &t_SR .= "\e[4 q"
endif

noremap <C-Z> :Unite file_mru<CR>
noremap <C-N> :Unite -buffer-name=file file<CR>
noremap <C-P> :Unite buffer<CR>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"


nmap <buffer> gd <plug>(lsp-definition)
nmap <buffer> <C-]> <plug>(lsp-definition)
nmap <buffer> <Leader>d <plug>(lsp-type-definition)
nmap <buffer> <Leader>r <plug>(lsp-references)
nmap <buffer> <Leader>i <plug>(lsp-implementation)
nmap <buffer> <f2> <plug>(lsp-rename)
nmap <buffer> <Leader>e <plug>(lsp-document-diagnostics)

inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
