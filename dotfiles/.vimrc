set nocompatible	" Use Vim defaults (much better!)
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Bundle 'gmarik/vundle'
Bundle 'pangloss/vim-javascript'
Bundle 'groenewege/vim-less'
"Bundle 'fatih/vim-go'
Bundle 'leafgarland/typescript-vim'
Bundle 'altercation/vim-colors-solarized'
"Bundle 'digitaltoad/vim-jade'
"Bundle 'taglist.vim'
"Bundle 'tpope/vim-fugitive'
"Bundle 'bling/vim-airline'
"Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
"Bundle 'nvie/vim-flake8'
"Bundle 'gre/play2vim'
"Bundle 'derekwyatt/vim-scala'
"Bundle 'mjwall/clj-vim'
call vundle#end()
filetype plugin indent on     " required!

syn on
set nu
set ai
set ts=2 sts=2 sw=2 expandtab
set showmatch
"set mouse=a 
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
set t_Co=256
set backspace=2	
"set fileencodings=utf-8
set fileencodings=utf-8,cp949,euc-kr
set encoding=utf-8
set termencoding=utf-8

" theme
let g:solarized_termcolors=256
colorscheme solarized

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_javascript_eslint_exec = 'eslint_d'

" powerline
"set laststatus=2
" for macvim
"let &guifont='Meslo LG S for Powerline:h11'
" airline
"let g:airline_powerline_fonts=1
"let g:airline_extensions=['tabline']
"let g:airline#extensions#tabline#enabled=1

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

let g:LargeFile=1000

"file type set
au FileType go  setl ts=4 sts=4 sw=4
au FileType python  setl ts=4 sts=4 sw=4
"au FileType javascript  setl ts=4 sts=4 sw=4
au FileType php  setl ts=4 sts=4 sw=4
au FileType c	    call SetCol80()
au FileType cpp     call SetCol80()

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
