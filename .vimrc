" UNCATEGORIZED SETTINGS
set expandtab
set nowrap
set nowrapscan
set scrolloff=6
" set cmdheight=2

"------------------------------------------------------------------------------

" GENERAL

" Turn off backwards compatibility with vi
set nocompatible

" Enable file type detection
filetype on

" Enable plugins for file types
filetype plugin on

" Hides instead of discarding)unsaved files when opening a new buffer
set hidden

" No sound on errors
set belloff=all

"------------------------------------------------------------------------------

" APPEARANCE

" Syntax highlighting
syntax enable

" Show commands in bottom right
set showcmd

" Color theme
colorscheme slate

" Keep terminal background color
hi Normal guibg=NONE ctermbg=NONE

" Sign column
set signcolumn=auto

" Avoid all the |hit-enter| prompts caused by file messages
set shortmess=a

" Show column marking 80 character length
set colorcolumn=80
highlight ColorColumn ctermbg=white guibg=black

" Word Wrap for Markdown and text files
autocmd FileType markdown setlocal wrap
autocmd FileType text setlocal wrap

"------------------------------------------------------------------------------

" LINE NUMBERING

" Show line numbers
set number

" Show relative line numbers
set relativenumber

" Line numbering when browsing directories
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

"------------------------------------------------------------------------------

" INDENTATION

" Set to indent based on filetype
filetype indent on
set smartindent

" Settings for filetypes
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2

"------------------------------------------------------------------------------

" SEARCH SETTINGS

" Highlight matches as the search term is being typed
set incsearch
hi IncSearch cterm=NONE ctermbg=cyan ctermfg=black

" Highlight search matches
set hlsearch
hi Search ctermbg=cyan ctermfg=black

" Ignore case in search except when typing capital characters 
set ignorecase smartcase

"------------------------------------------------------------------------------

" WSL SETTINGS

" WSL yank support 
" from https://www.reddit.com/r/bashonubuntuonwindows/comments/be2q3l/comment/el2vx7u/
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

"------------------------------------------------------------------------------

" STATUSLINE

" from https://www.reddit.com/r/vim/comments/gexi6/a_smarter_statusline_code_in_comments/
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

"------------------------------------------------------------------------------

" FOLDING

" JavaScript folding
" from https://alldrops.info/posts/vim-drops/2018-04-25_javascript-folding-on-vim/
set foldmethod=syntax  " syntax highlighting items specify folds
set foldcolumn=1       " defines 1 col at window left, to indicate folding
let javaScript_fold=1  " activate folding by JS syntax
set foldlevelstart=99  " start file with all folds opened

"------------------------------------------------------------------------------

" MARKDOWN

" Apply syntax highlighting within code blocks
" from https://www.benpickles.com/articles/88-vim-syntax-highlight-markdown-code-blocks
let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'html', 'css']

" Highlighting for bold & italics
" from https://vi.stackexchange.com/questions/4669/markdown-how-to-syntax-highlight-bold-and-italic-in-different-color-than-normal
highlight htmlBold gui=bold guifg=#af0000 ctermfg=yellow
highlight htmlItalic gui=italic guifg=#ff8700 ctermfg=red

" Highlighting for code snippets
" from https://raw.githubusercontent.com/tpope/vim-markdown/master/syntax/markdown.vim
highlight markdownCode guifg=#ff8700 ctermfg=green
highlight markdownCodeDelimiter guifg=#ff8700 ctermfg=green

"------------------------------------------------------------------------------

" KEY MAPPINGS

" H & L = start & end of line in Normal, Visual, Select, Operator-pending
noremap H ^
noremap L $

" n & N = next & previous search result, at top of screen, in Normal
" from https://stackoverflow.com/questions/45866451/put-the-search-results-at-the-top-of-the-screen-in-vi
nnoremap n nzt
nnoremap N Nzt

" BS = top of previous buffer, in Normal
" Shift BS = next buffer
nnoremap <BS> <C-^>zt
nnoremap <S-BS> :bnext<cr>

" <C-u> & <C-d>: keep cursor at top
nnoremap <C-u> <C-u>zt
nnoremap <C-d> <C-d>zt

" <CR> = colon, except in quickfix in Normal, Visual, Select, Operator-pending
noremap <CR><CR> <CR>
noremap <CR> :
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" PageUp & PageDown = half up & down in Normal, Visual, Select, Operator-pending
noremap <PageUp> <C-u>zt
noremap <PageDown> <C-d>zt

"------------------------------------------------------------------------------

" LEADER MAPPINGS

" Leader to space
nnoremap <SPACE> <Nop>
let mapleader=" "

" leader b = list the available buffers and prepare :b for you.
nnoremap <Leader>b :ls<CR>:b<Space>

" leader d = shell
nnoremap <Leader>d :sh<CR>

" leader e = explorer
nnoremap <Leader>e :e <C-d>

" leader f = show ex command history
nnoremap <Leader>f : <C-f>

" leader h = toggle search highlighting
" https://stackoverflow.com/questions/9054780/how-to-toggle-vims-search-highlight-visibility-without-disabling-it
let hlstate=0
nnoremap <Leader>h :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<cr>

" leader q = quit
nnoremap <Leader>q :q<CR>

" leader s = write
nnoremap <Leader>s :w<CR>
