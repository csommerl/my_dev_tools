"colorscheme slate
set nocompatible
filetype on
filetype plugin on
set signcolumn=auto
set syntax=on
set cmdheight=2
set shortmess=a
set number
set relativenumber
set hidden
set expandtab
set nowrap
set scrolloff=8
set incsearch
set colorcolumn=80
highlight ColorColumn ctermbg=lightblue guibg=black
set hlsearch
set showcmd

"Indentation, need to investigate
set smartindent
filetype indent on
" Change indentation for file type
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4

" change cursorline for mode
"autocmd InsertEnter * set cul
"autocmd InsertLeave * set nocul

" change cursor for mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" WSL yank support
" https://www.reddit.com/r/bashonubuntuonwindows/comments/be2q3l/comment/el2vx7u/
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
