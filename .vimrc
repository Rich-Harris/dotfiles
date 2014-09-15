" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Enable line numbers
set number

" Highlight current line
set cursorline

" Make tabs as wide as two spaces
set shiftwidth=2
set tabstop=2
set smartindent

" tree view
let g:netrw_liststyle=3

" syntax highlighting
syntax on

highlight comment ctermfg=grey
highlight netrwDir ctermfg=grey

" Enable mouse in all modes
set mouse=a

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" autocomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" base-style autocomplete filenames
set wildmenu
set wildmode=longest:full,full
