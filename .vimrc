se nocp                 " Disable compatiblity with vi. Helps with cursor navigation
se tabstop=4
se shiftwidth=4
se expandtab
se incsearch            " incremental search 
se hlsearch             " highlight search
syn on                  " Syntax highlght 
colorscheme darkblue    " 
se cindent              " C Style indentation
se number               " show line numbering 
se is                   " 
se wildmenu             " wild-menu with command line completion 

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}

