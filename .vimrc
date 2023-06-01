"colorscheme slate
set nocompatible
filetype on
filetype plugin on
set belloff=all
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
highlight ColorColumn ctermbg=white guibg=black
set hlsearch
set showcmd

" Indentation
set autoindent "set autoindent
set smartindent
filetype indent on
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4

" change cursor for mode: https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[1 q"

" WSL yank support from https://www.reddit.com/r/bashonubuntuonwindows/comments/be2q3l/comment/el2vx7u/
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

"Switch to and from shell with ctrl d
nnoremap <C-d> :sh<CR>
