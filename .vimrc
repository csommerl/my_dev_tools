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

" Keep undo history in ~/.vim/undodir
set undofile
set undodir=~/.vim/undodir

" }}}

" {{{ COLORSCHEME

" True colors
set termguicolors

" scheme: catpuccin_frappe/latte
hi Normal guibg=NONE ctermbg=NONE
colorscheme catppuccin_frappe
"colorscheme catppuccin_latte

" scheme: everforest
"options: 'hard', 'medium'(default), 'soft'
"let g:everforest_background = 'soft'
"options: light, dark
"set background=dark
" For better performance
"let g:everforest_better_performance = 1
"colorscheme everforest

" scheme: gruvbox
"options: 'hard', 'medium'(default), 'soft'
"let g:gruvbox_material_background = 'soft'
"options: light, dark
"set background=dark
" For better performance
"let g:gruvbox_material_better_performance = 1
"colorscheme gruvbox-material

" Underline/highlight current line
set cursorline

" Show column marking 80 character length
set colorcolumn=80

" Color options for color column
"highlight ColorColumn ctermbg=white guibg=black

" }}}

" APPEARANCE {{{

" Show filename in title bar
set title

" Show line numbers
set number

" Use relative numbers in normal mode only for an active buffer; use absolute numbers everywhere else.
" https://www.reddit.com/r/vim/comments/t9lm4x/whats_your_best_autocmd/
augroup number_toggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Show commands in bottom right
set showcmd

" Avoid |hit-enter| prompts caused by file messages; alt: set cmdheight=2
set shortmess=a

" Sign column
set signcolumn=auto

" Display at least 6 lines above and below cursor when scrolling
set scrolloff=6

" Turn off word wrap
set nowrap

" Word wrap, line breaks, & spellcheck for Markdown & text files
augroup file_type_formatting
  autocmd!
  autocmd FileType markdown setlocal wrap linebreak spell
  autocmd FileType text setlocal wrap linebreak spell
augroup END

" Show only top 15 options, so that the window isn't taken over
set spellsuggest=15

" Display special characters for whitespace, etc.
set list
set listchars=tab:│·,nbsp:␣,trail:·,extends:⟩,precedes:⟨
" But don't show trailing whitespace in insert mode
augroup no_insert_trailing_whitespace
  autocmd!
  autocmd InsertEnter * set listchars-=trail:·
  autocmd InsertLeave * set listchars+=trail:·
augroup END

" }}}

" SYNTAX HIGHLIGHTING {{{

" Syntax highlighting
syntax enable

" Apply syntax highlighting within code blocks
" https://www.benpickles.com/articles/88-vim-syntax-highlight-markdown-code-blocks
let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'html', 'css', 'vim', 'bash']

" Highlighting for bold & italics
" https://vi.stackexchange.com/questions/4669/markdown-how-to-syntax-highlight-bold-and-italic-in-different-color-than-normal
highlight htmlBold gui=bold guifg=DarkCyan ctermfg=cyan
highlight htmlItalic gui=italic guifg=SlateBlue ctermfg=cyan

" Highlighting for code snippets
" https://raw.githubusercontent.com/tpope/vim-markdown/master/syntax/markdown.vim
highlight markdownCode guifg=DarkYellow ctermfg=green
highlight markdownCodeDelimiter guifg=DarkYellow ctermfg=green

" Change color of misspelled words
"highlight SpellBad guibg=lightred ctermbg=lightred guifg=black ctermfg=black

" show matching brace
set showmatch matchtime=2

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

" NETRW {{{
" https://github.com/changemewtf/no_plugins/blob/master/no_plugins.vim

" Disable netrw banner
let g:netrw_banner=0

" Default to tree view
" let g:netrw_liststyle=3

" Hide stuff
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" Line numbering when browsing directories
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

" }}}

" FUZZY FILE FINDER {{{
" https://github.com/changemewtf/no_plugins
" https://www.youtube.com/watch?v=XA2WjJbmmoM&t

" Search through every subdirectory, recursively
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Ignore these files & directories
set wildignore+=*.git/*,*node_modules/*,package-lock.json,package.json

" }}}

" SEARCH {{{

" Ignore case in search except when typing capital characters (also applies to autocomplete)
set ignorecase smartcase

" Search does not wrap around end of file
set nowrapscan

" Highlight matches as the search term is being typed
set incsearch
hi IncSearch cterm=NONE ctermbg=cyan ctermfg=black

" Highlight search matches
set hlsearch
hi Search ctermbg=cyan ctermfg=black

" Vim looks tags file in current directory first and up & up until it finds it.
set tags=./tags,tags;

" }}}

" SPLITS {{{

" change the direction of new splits
set splitbelow
set splitright

" }}}

" FOLDING {{{

" start file with all folds open
set foldlevelstart=99

" Markdown folding
let g:markdown_folding = 1

augroup my_folding
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker foldmarker={{{,}}}
  autocmd FileType javascript setlocal foldmethod=marker foldmarker={,}
augroup END

" }}}

" {{{ SESSIONS

" to make my font changes for markdown persist, among other things
set sessionoptions-=options

" Remember folds: https://stackoverflow.com/questions/37552913/vim-how-to-keep-folds-on-save
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END

" prevent working directory from changing due to the above
set viewoptions-=curdir

" }}}

" INDENTATION {{{

" Set to indent based on filetype
set autoindent
filetype indent on

" test
set smarttab

" Insert space characters when tab is pressed
set expandtab

" Settings for filetypes
augroup filetype_indentation
  autocmd!
  autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END

" Set to round to proper indentation based on shiftwidth when using <>
set shiftround

" }}}

" TAB AUTOCOMPLETE {{{
" https://vim.fandom.com/wiki/Smart_mapping_for_tab_completion

" Remap TAB to keyword completion
function! InsertTabWrapper(direction)
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  elseif "backward" == a:direction
    return "\<c-p>"
  elseif "forward" == a:direction
    return "\<c-n>"
  else
    return "\<c-x>\<c-k>"
  endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper ("forward")<CR>
inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<CR>
inoremap <c-tab> <c-r>=InsertTabWrapper ("startkey")<CR>

" }}}

" LINTING {{{
" https://gist.github.com/romainl/ce55ce6fdc1659c5fbc0f4224fd6ad29

augroup js_linting
  autocmd!
  " Set compiler / linter to ESLint
  autocmd FileType javascript compiler eslint
  " Open quickfix window whenever quickfix command is executed (like :make) AND there are valid errors to display
  autocmd QuickFixCmdPost [^l]* cwindow 
  " run :make on the current file matching <pattern> whenever you :write it
  " autocmd BufWritePost *.js silent make! <afile> | silent redraw!
augroup END

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

" KEY MAPPINGS {{{

" [b & ]b = previous buffer and next buffer, at top of screen, in Normal mode
nnoremap [b :bprevious<CR>zt
nnoremap ]b :bnext<CR>zt

" remap up and down to navigate wordwraps, in Insert, Normal, and Visual modes
inoremap <up> <C-O>gk
inoremap <down> <C-O>gj
nnoremap <up> gk
nnoremap <down> gj
vnoremap <up> gk
vnoremap <down> gj

" H & L = start & end of line, in Normal, Visual, Select, Operator-pending modes
noremap H ^
noremap L $

" M & K = backward and forward in changelist, at top of screen, in Normal mode
nnoremap M g;zt
nnoremap K g,zt

" n & N = next & previous search result, at top of screen, in Normal mode
" https://stackoverflow.com/questions/45866451/put-the-search-results-at-the-top-of-the-screen-in-vi
nnoremap n nzt
nnoremap N Nzt

" U = redo, in Normal, Visual, Select, Operator-pending modes
noremap U <C-r>

" Y = yank to end of line, in Normal, Visual, Select, Operator-pending modes
noremap Y y$

" using < and > keep selection, in Visual mode
vmap > >gv
vmap < <gv

" BS = go back in jump list, in Normal mode
nnoremap <BS> <C-o>zt

" Enter/<CR> = colon, except in quickfix, in Normal, Visual, Select, Operator-pending modes
noremap <CR><CR> <CR>
noremap <CR> :
autocmd! BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" PageUp & PageDown = half up & down, in Normal, Visual, Select, Operator-pending modes
noremap <PageUp> <C-u>zt
noremap <PageDown> <C-d>zt

" <C-u> & <C-d> keep cursor at top, in Normal mode
nnoremap <C-u> <C-u>zt
nnoremap <C-d> <C-d>zt

" <C-h> = repositions to top of screen, in Insert and Normal modes
inoremap <C-h> <C-o>zt
noremap <C-h> zt

" <ctrl-j> and <ctrl-k> = Move current lines up and down, in Normal, Insert, and Visual modes
" warning: remapping <ctrl-k> in insert mode replaces insertion of digraphs
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" <C-s> = fixes the last spelling mistake and returns cursor position, in Insert mode
" TOUSE
inoremap <C-s> <c-g>u<Esc>[s1z=`]a<c-g>u

" <C-Left> and <C-Right> switch between tabs (equivalent to using ctrl with PageUp and PageDown), in Normal mode
" TOUSE
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" F1 = open vimrc
" TOUSE
nnoremap <F1> :e ~/.vimrc<CR>

" F2 = source vimrc
" TOUSE
nnoremap <F2> :source ~/.vimrc<CR>

" map <F3> and <F4> to jump between locations in a quickfix list, or differences if in window in diff mode
" TOUSE
nnoremap <expr> <silent> <F4> (&diff ? "]c" : ":cnext\<CR>")
nnoremap <expr> <silent> <F3> (&diff ? "[c" : ":cprev\<CR>")

" F7 = toggle relative & absolute line numbers
" TOUSE
nnoremap <F7> :set invrnu

" Closing braces
" inoremap ( ()<Left>
" inoremap [ []<Left>
" autocmd! FileType javascript inoremap { {<CR>}<ESC>kA

" }}}

" LEADER MAPPINGS {{{

" space = leader
nnoremap <SPACE> <Nop>
let mapleader=" "

" leader space = top of previous buffer, in Normal
nnoremap <Leader><SPACE> <C-^>zt

" leader backspace = switch window
nnoremap <Leader><BS> <C-w>w

" leader b = list the available buffers and prepare :b for you
nnoremap <Leader>b :ls<CR>:b<Space>

" leader c = comment out and leader C = undo comment
augroup commenting
  autocmd!
  autocmd FileType javascript noremap <Leader>c :norm 0i// <CR>
  autocmd FileType javascript noremap <Leader>C :norm 03x<CR>
  autocmd FileType python noremap <Leader>c :norm 0i# <CR>
  autocmd FileType python noremap <Leader>C :norm 02x<CR>
augroup END

" leader d = delete without replacing register
" TOUSE
nnoremap <Leader>d "_d

" leader e = explorer and show directory
nnoremap <Leader>e :e <C-d>

" leader E = show ex command history
" TOUSE
nnoremap <Leader>E : <C-f>

" leader f = toggle fold
nnoremap <Leader>f za

" leader h = toggle search highlighting
nnoremap <Leader>h :set hlsearch!<CR>

" leader k = save session
nnoremap <Leader>k :mks!<CR>

" leader m = make current file
nnoremap <Leader>m :make %<CR>

" leader p = fuzzy file finder
nnoremap <Leader>p :find *

" leader r = run program
augroup run_program
  autocmd!
  autocmd FileType javascript nnoremap <Leader>r :! node %<CR>
  autocmd FileType python nnoremap <Leader>r :! python3 %<CR>
augroup END

" leader s = write
nnoremap <Leader>s :w<CR>

" leader t = shell/terminal
nnoremap <Leader>t :sh<CR>

" leader wv = vsplit
nnoremap <Leader>wv :vsplit 

" leader z = open current split in own tab and keep cursor pos
" https://vi.stackexchange.com/questions/36795/how-to-toggle-back-after-previous-view-when-using-only-command-on-vim
nnoremap <Leader>z mx:tabedit %<CR>g`x

" }}}

" {{{ ABBREVIATIONS

" Eatchar function
" https://stackoverflow.com/questions/11858927/preventing-trailing-whitespace-when-using-vim-abbreviations
func Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc
" iabbr <silent> if if ()<Left><C-R>=Eatchar('\s')<CR>

" .,b = code block in Markdown
autocmd! FileType markdown iabbrev .,b ```<CR>```<ESC>kA<C-R>=Eatchar('\s')<CR>

" add: fo = for of, fl = for loop, fi = for in

" .,p = print statement
" https://vonheikemen.github.io/devlog/tools/using-vim-abbreviations/
augroup print_statement
  autocmd!
  autocmd FileType javascript iabbrev .,p console.log();<Left><Left><C-R>=Eatchar('\s')<CR>
  autocmd FileType python iabbrev .,p print()<Left><C-R>=Eatchar('\s')<CR>
  autocmd FileType markdown iabbrev .,p console.log();<Left><Left><C-R>=Eatchar('\s')<CR>
augroup END

" }}}
