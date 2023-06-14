set nocompatible
set syntax=on
colorscheme slate
filetype on
filetype plugin on
set belloff=all
set signcolumn=auto
set shortmess=a
set number
set relativenumber
set hidden
set expandtab
set nowrap
set scrolloff=5

set colorcolumn=80
highlight ColorColumn ctermbg=white guibg=black

set hlsearch
hi Search ctermbg=cyan ctermfg=black

set incsearch
hi IncSearch cterm=NONE ctermbg=cyan ctermfg=black

set showcmd

" Indentation
set autoindent "set autoindent
set smartindent
filetype indent on
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2

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

" Word Wrap for Markdown
autocmd FileType markdown setlocal wrap
autocmd FileType text setlocal wrap


"set cmdheight=2

" Below from https://www.reddit.com/r/vim/comments/gexi6/a_smarter_statusline_code_in_comments/
set laststatus=2
hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black
hi Modified guibg=orange guifg=black ctermbg=lightred ctermfg=black

function! MyStatusLine(mode)
    let statusline=""
    if a:mode == 'Enter'
        let statusline.="%#StatColor#"
    endif
    let statusline.="\(%n\)\ %f\ "
    if a:mode == 'Enter'
        let statusline.="%*"
    endif
    let statusline.="%#Modified#%m"
    if a:mode == 'Leave'
        let statusline.="%*%r"
    elseif a:mode == 'Enter'
        let statusline.="%r%*"
    endif
    let statusline .= "\ (%l/%L,\ %c)\ %P%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]\ \ "
    return statusline
endfunction

au WinEnter * setlocal statusline=%!MyStatusLine('Enter')
au WinLeave * setlocal statusline=%!MyStatusLine('Leave')
set statusline=%!MyStatusLine('Enter')

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi StatColor guibg=orange ctermbg=lightred
  elseif a:mode == 'r'
    hi StatColor guibg=#e454ba ctermbg=magenta
  elseif a:mode == 'v'
    hi StatColor guibg=#e454ba ctermbg=magenta
  else
    hi StatColor guibg=red ctermbg=red
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black
