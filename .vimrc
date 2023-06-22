set nocompatible
syntax enable "set syntax=on
colorscheme slate

"keep terminal background color
hi Normal guibg=NONE ctermbg=NONE

filetype on
filetype plugin on
set belloff=all
set signcolumn=auto
set shortmess=a

"Line numbering
set number
set relativenumber
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

set hidden
set expandtab
set nowrap
set nowrapscan
set scrolloff=6

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

" WSL yank support from https://www.reddit.com/r/bashonubuntuonwindows/comments/be2q3l/comment/el2vx7u/
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" Word Wrap for Markdown
autocmd FileType markdown setlocal wrap
autocmd FileType text setlocal wrap

"set cmdheight=2

""" Below from https://www.reddit.com/r/vim/comments/gexi6/a_smarter_statusline_code_in_comments/
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

""" end statusline

" FOLDING from https://alldrops.info/posts/vim-drops/2018-04-25_javascript-folding-on-vim/
set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened

" https://www.benpickles.com/articles/88-vim-syntax-highlight-markdown-code-blocks
let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'html', 'css']

" Markdown bold & italics highlighting from https://vi.stackexchange.com/questions/4669/markdown-how-to-syntax-highlight-bold-and-italic-in-different-color-than-normal
highlight htmlBold gui=bold guifg=#af0000 ctermfg=yellow
highlight htmlItalic gui=italic guifg=#ff8700 ctermfg=red

" possible code snippet https://raw.githubusercontent.com/tpope/vim-markdown/master/syntax/markdown.vim
highlight markdownCode guifg=#ff8700 ctermfg=green
highlight markdownCodeDelimiter guifg=#ff8700 ctermfg=green

" https://stackoverflow.com/questions/45866451/put-the-search-results-at-the-top-of-the-screen-in-vi
nnoremap n nzt
nnoremap N Nzt

"Key mappings
"" Backspace to buffer
nnoremap <BS> <C-^>zt
noremap <S-BS> :bnext<cr>
"Enter to colon
nnoremap <CR><CR> <CR>
nnoremap <CR> :
" In the quickfix window, <CR> is used to jump to the error under the cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
"PageUp & PageDown
nnoremap <PageUp> <C-u>
nnoremap <PageDown> <C-d>
"H and L
nnoremap H ^
nnoremap L $

"Leader to space
nnoremap <SPACE> <Nop>
let mapleader=" "
"leader b = list the available buffers and prepare :b for you.
nnoremap <Leader>b :ls<CR>:b<Space>
"leader s = write
nnoremap <Leader>s :w<CR>
"leader d = shell
nnoremap <Leader>d :sh<CR>
