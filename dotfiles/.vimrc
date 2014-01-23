set nocompatible	" Use Vim defaults (much better!)
"call pathogen#infect()
"filetype plugin on
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'derekwyatt/vim-scala'
Bundle 'gre/play2vim'
Bundle 'taglist.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'digitaltoad/vim-jade'
Bundle 'groenewege/vim-less'
"Bundle 'mjwall/clj-vim'
filetype plugin indent on     " required!

syn on
set nu
set ai
"set ts=2 sts=2 sw=2 noexpandtab
set ts=2 sts=2 sw=2 expandtab
set showmatch
set mouse=a 
set title
set incsearch hlsearch
"set cinoptions={s,>2s,n-s,^-s
set smartindent
set ruler
set showcmd
set showmode
set autowrite
set noerrorbells
set novisualbell
set bg=dark
set exrc
"set t_Co=256
set backspace=2	
"set fileencodings=utf-8
set fileencodings=utf-8,cp949,euc-kr
set encoding=utf-8
set termencoding=utf-8

" for comments.
map f I//<ESC>
map F ^2x
vmap cc :s/^/\/\//g<ENTER><ESC>:noh<CR>
vmap cu :s/^\/\///g<ENTER><ESC>:noh<CR>

" for me
set tags=./tags,../tags,../../tags
map T :Tlist<CR>
map t :tabnew<CR>
map <TAB> :tabnext<CR>
map <S-TAB> :tabprev<CR>
map <F9> :set noai nosi paste<CR>
map <F10> :set ai si nopaste<CR>
map <F11> :nohl<CR>

" php는 종료전에 syntax 검사를 한다.
"au BufWriteCmd *.php :exe "!clear; php -l %"

let g:LargeFile=1000

"file type set
au BufNewfile,BufRead *.xsp         set filetype=html syntax=aspvbs
au BufNewfile,BufRead *.xfs         set filetype=javascript
au BufNewfile,BufRead *.java        set noexpandtab

au FileType c	call SetCol80()
au FileType cpp call SetCol80()

function! SetCol80()
	if exists('+colorcolumn')
		set cc=80
	else
		au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
	endif
endfunction

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
	 \ if line("'\"") > 0 && line("'\"") <= line("$") |
	 \   exe "normal! g`\"" |
	 \ endif
