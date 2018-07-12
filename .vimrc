
" If no screen, use color term
if ($TERM == 'vt100')
	"ref: : help color, search for Tera Term Pro settings or ETerm settings
		" TeraTermPro
	" set t_co=16
	" set t_AB=^[[%?%pl%{8}%<%t%pl%{40}%+%e%pl%{32}%+5;%;%dm
	" set t_AF=^[[%?%pl%{8}%<%t%pl%{30}%+%e%pl%{22}%+1;%;%dm
	" Eterm
	
	"xterm-color / screen
	set t_Co=256
	set t_AF=^[[1;3%pl%dm
	set t_AB=^[[4%pl%dm
endif

syntax on
set expandtab
set nocompatible
set nowrap
set wildmenu
set backupdir=~/tmp,.,/var/tmp/vi,/tmp
set directory=~/tmp,/var/tmp/vi,/tmp,.
set backup		" keep a backup file
set backupcopy=yes " for brunch
"set textwidth=78
set shiftwidth=4
set tabstop=4
set shiftwidth=4
set bs=2		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
set nu
set cursorline
"set background=dark	" another is 'light'
"set mouse=a
set ruler
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
set showmatch
set bg=dark

set formatoptions+=r
set history=100
set incsearch


if version >= 600
    set nohlsearch
	" set foldcolumn=2
    " set foldmethod=syntax
    set foldmethod=indent
	set nofoldenable
    set foldlevel=1
	set foldcolumn=2
    set encoding=utf-8
    set fileencodings=big5,utf-8,ucs-bom,latin1
    set termencoding=utf-8
else
    set fileencoding=utf-8
endif
au BufNewFile,BufRead *.less set filetype=less
let Tlist_Sort_Type = "order"
let Tlist_WinWidth = 30
let Tlist_Inc_Winwidth = 0
"let Tlist_Use_Right_Window = 1
runtime taglist.vim

"set winminheight=0
"set winminwidth=0
"runtime bufexplorer.vim

" Diff
nnoremap <silent> <C-G>	:diffget<CR>
nnoremap <silent> <C-P>	:diffput<CR>

" Window
nnoremap <silent> <Tab>	:wincmd w<CR>
nnoremap <silent> <C-H>	:wincmd h<CR>
nnoremap <silent> <C-J>	:wincmd j<CR>
nnoremap <silent> <C-K>	:wincmd k<CR>
nnoremap <silent> <C-L>	:wincmd l<CR>
nnoremap <silent> +	:wincmd +<CR>
nnoremap <silent> -	:wincmd -<CR>
nnoremap <silent> <	:wincmd <<CR>
nnoremap <silent> >	:wincmd ><CR>

" IDE
"nnoremap <silent> <F5>	:cwindow<CR>
"nnoremap <silent> <F6>	:make<CR>
"nnoremap <silent> <F7>	:TlistUpdate<CR>
"nnoremap <silent> <F8>	:Tlist<CR>
"nnoremap <silent> <F9>	:edit .<CR>
"nnoremap <silent> <F10>	:BufExplorer<CR>

"hi Comment ctermfg = LightMagenta 

" If no screen, use color term
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
syntax enable
set background=dark
colorscheme beth
"colorscheme srcery-drk 


let g:neocomplcache_enable_at_startup = 1

" Plugins
" Plugin 'tomlion/vim-solidity'

" vi:sw=4:ts=4
