" GENERAL {{{

" Turn off backwards compatibility with vi
set nocompatible

" Enable file type detection
filetype on

" Enable plugins for file types
filetype plugin on

" Hides (instead of discarding) unsaved files when opening a new buffer
set hidden

" No sound on errors
set belloff=all

" }}}

" APPEARANCE {{{

" Transparent background
hi Normal guibg=NONE ctermbg=NONE

" True colors
set termguicolors

" Syntax highlighting
syntax enable

" Color theme
colorscheme catppuccin_macchiato

" Show line numbers
set number

" Show relative line numbers
set relativenumber

" Line numbering when browsing directories
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

" Show commands in bottom right
set showcmd

" Avoid |hit-enter| prompts caused by file messages; alt: set cmdheight=2
set shortmess=a

" Sign column
set signcolumn=auto

" Underline/highlight current line
set cursorline

" Show column marking 80 character length
set colorcolumn=80

" Color options for color column
"highlight ColorColumn ctermbg=white guibg=black

" Display at least 6 lines above and below cursor when scrolling
set scrolloff=6

" Turn off word wrap
set nowrap

" Word wrap for Markdown and text files
autocmd FileType markdown setlocal wrap
autocmd FileType text setlocal wrap

" }}}

" INDENTATION {{{

" Set to indent based on filetype
filetype indent on
set smartindent

" Insert space characters when tab is pressed
set expandtab

" Settings for filetypes
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2

" }}}

" SEARCH {{{

" Ignore case in search except when typing capital characters 
set ignorecase smartcase

" Search does not wrap around end of file
set nowrapscan

" Highlight matches as the search term is being typed
set incsearch
hi IncSearch cterm=NONE ctermbg=cyan ctermfg=black

" Highlight search matches
set hlsearch
hi Search ctermbg=cyan ctermfg=black

" }}}

" WSL {{{

" WSL yank support 
" https://www.reddit.com/r/bashonubuntuonwindows/comments/be2q3l/comment/el2vx7u/
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" }}}

" STATUSLINE {{{

" https://www.reddit.com/r/vim/comments/gexi6/a_smarter_statusline_code_in_comments/
set laststatus=2
hi StatColor guibg=lightgreen guifg=black ctermbg=lightgreen ctermfg=black
hi Modified guibg=lightred guifg=black ctermbg=lightred ctermfg=black

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
    hi StatColor guibg=lightred ctermbg=lightred
  elseif a:mode == 'r'
    hi StatColor guibg=magenta ctermbg=magenta
  elseif a:mode == 'v'
    hi StatColor guibg=magenta ctermbg=magenta
  else
    hi StatColor guibg=red ctermbg=red
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi StatColor guibg=lightgreen guifg=black ctermbg=lightgreen ctermfg=black

" }}}

" FOLDING {{{

set foldlevelstart=99

augroup vim_folding
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker foldmarker={{{,}}}
augroup END

augroup js_folding
  autocmd!
  autocmd FileType javascript setlocal foldmethod=marker foldmarker={,}
augroup END

" }}}

" MARKDOWN SYNTAX HIGHLIGHTING {{{

" Apply syntax highlighting within code blocks
" https://www.benpickles.com/articles/88-vim-syntax-highlight-markdown-code-blocks
let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'html', 'css']

" Highlighting for bold & italics
" https://vi.stackexchange.com/questions/4669/markdown-how-to-syntax-highlight-bold-and-italic-in-different-color-than-normal
highlight htmlBold gui=bold guifg=SlateBlue ctermfg=blue
highlight htmlItalic gui=italic guifg=DarkCyan ctermfg=cyan

" Highlighting for code snippets
" https://raw.githubusercontent.com/tpope/vim-markdown/master/syntax/markdown.vim
highlight markdownCode guifg=DarkYellow ctermfg=green
highlight markdownCodeDelimiter guifg=DarkYellow ctermfg=green

" }}}

" JAVASCRIPT ESLINT SUPPORT {{{
" https://gist.github.com/romainl/ce55ce6fdc1659c5fbc0f4224fd6ad29

augroup js_linting
  autocmd!
  " Set compiler / linter to ESLint
  autocmd FileType javascript compiler eslint
  " Open quickfix window whenever quickfix command is executed (like :make) AND there are valid errors to display
  autocmd QuickFixCmdPost [^l]* cwindow 
  " run :make on the current file matching <pattern> whenever you :write it
  autocmd BufWritePost *.js silent make! <afile> | silent redraw!
augroup END

" }}}

" KEY MAPPINGS {{{

" H & L = start & end of line in Normal, Visual, Select, Operator-pending
noremap H ^
noremap L $

" n & N = next & previous search result, at top of screen, in Normal
" https://stackoverflow.com/questions/45866451/put-the-search-results-at-the-top-of-the-screen-in-vi
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

" }}}

" LEADER MAPPINGS {{{

" Leader to space
nnoremap <SPACE> <Nop>
let mapleader=" "

" leader b = list the available buffers and prepare :b for you
nnoremap <Leader>b :ls<CR>:b<Space>

" leader d = delete without replacing register
nnoremap <Leader>d "_d

" leader e = explorer and show directory
nnoremap <Leader>e :e <C-d>

" leader E = show ex command history
nnoremap <Leader>E : <C-f>

" leader f = toggle fold
nnoremap <Leader>f za

" leader h = toggle search highlighting
" https://stackoverflow.com/questions/9054780/how-to-toggle-vims-search-highlight-visibility-without-disabling-it
let hlstate=0
nnoremap <Leader>h :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<cr>

" leader m = make current file
nnoremap <Leader>m :make %<CR>

" leader p = delete and paste without replacing register
noremap <Leader>p "_dP

" leader q = quit
nnoremap <Leader>q :q<CR>

" leader s = write
nnoremap <Leader>s :w<CR>

" leader t = shell
nnoremap <Leader>t :sh<CR>

" }}}
