set nocompatible
set ts=2
set sw=2
set laststatus=2
set ruler
set hidden
set encoding=utf-8
set fileencodings=utf-8,cp950,gb2312
set history=100		" keep 50 lines of command line history
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			                " than 50 lines of registers


set wildignore=*.bak,*.o,*.e,*~,*.so,*.a
set wildmode=list:longest
set ssop=curdir,folds,buffers
"set fdm=marker

call pathogen#infect() 
call pathogen#helptags() 

filetype on
filetype plugin on
filetype indent on

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

fu! FileEncoding()
	if &fileencoding == ''
		return "N/A"
	else
		return &fenc
	endif
endf 
let &statusline='%<[%n] %F %m%= %h%r %-19([%p%%] %3l,%02c%03V%)%y [%{FileEncoding()}]'

if &term == "xterm-256color" || &term == "screen-bce"
	set t_Co=256
	colorscheme railscasts.vim
	highlight CursorLine cterm=none ctermbg=DarkGrey
	hi PmenuSel ctermfg=black ctermbg=red
	hi Pmenu ctermfg=black ctermbg=white
else
	colorscheme elflord
	hi TabLine ctermfg=white ctermbg=blue
	hi TabLineSel ctermfg=yellow ctermbg=blue
	hi TabLineSel ctermfg=white ctermbg=LightMagenta

	hi PmenuSel ctermfg=black ctermbg=green
	hi Pmenu ctermfg=black ctermbg=white

	highlight Search term=reverse ctermbg=green ctermfg=7
	highlight StatusLine ctermfg=Green ctermbg=white
	highlight  matchparen NONE 
endif

set incsearch
set diffopt=filler,iwhite
set path+=/home/y/include/**,/home/y/share/pear/**,/usr/include/**,/usr/local/include/**,**

map <leader>ee :FufFileWithCurrentBufferDir <CR>
map <leader>ef :FufFileWithFullCwd <CR>
map <leader>bb :FufBuffer <CR>
map <leader>tt :TlistToggle<CR>

let Tlist_Exit_OnlyWindow=1
let Tlist_GainFocus_On_ToggleOpen=1

let TAGS_PATH = getcwd()
while strlen(TAGS_PATH) > 0
	if filereadable(TAGS_PATH . "/tags")
		execute "set tags^=" . TAGS_PATH . "/tags"
		break
	endif
	let TAGS_PATH = substitute(TAGS_PATH, '/[^/]*$', "", "")
endwhile


