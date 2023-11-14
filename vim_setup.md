# Vim Mods

[function for swapping between dark and light modes](https://learnvim.irian.to/vimscript/vimscript_functions)

[Tags](https://learnvim.irian.to/basics/tags)
- universal ctags setup: https://askubuntu.com/questions/796408/installing-and-using-universal-ctags-instead-of-exuberant-ctags
- tagbar: https://github.com/preservim/tagbar
- https://github.com/changemewtf/no_plugins/blob/master/no_plugins.vim

autocomplete braces

No plugins: https://gist.github.com/chris-marsh/a482db63f8fdb42a05d5966b494d15dc

K = split line

shortcut to move lines up & down: https://vimtricks.com/p/vimtrick-moving-lines/

set up augroups

https://ankiweb.net/shared/info/1259461418

https://vim.fandom.com/wiki/Moving_lines_up_or_down

https://stackoverflow.com/questions/18702327/using-vim-as-a-javascript-sandbox-how-do-i-write-a-buffer-to-node-and-read-the

https://stackoverflow.com/questions/61166913/resize-window-in-vim-with-a-keyboard-map#:~:text=It%20should%20be%20noted%20that,by%201)%3A%20Ctrl%20%2D%20W%20%3E

https://www.bbkane.com/blog/vim-color-schemes/

https://github.com/frazrepo/vim-rainbow

https://learnvim.irian.to/

" leader right = move pane to right
nnoremap <Leader><Right> <C-w>L \| 45<C-w>\|

" leader down = move pane to bottom
nnoremap <Leader><Down> <C-w>J \| 5<C-w>\_

https://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/

## Plugins

- https://github.com/pangloss/vim-javascript
- https://github.com/sheerun/vim-polyglot

## How I installed VIM 9

- https://vi.stackexchange.com/questions/10817/how-can-i-get-a-newer-version-of-vim-on-ubuntu
- https://itsfoss.com/install-latest-vim-ubuntu/

## Sources

[Frequents](https://www.reddit.com/r/vim/comments/oyqkkd/your_most_frequently_used_mapping/)
[Space, Enter, and BS](https://www.reddit.com/r/vim/comments/3egaqw/spacebar_backspace_and_enter_are_all_fairly/)
[Other](https://www.reddit.com/r/vim/comments/btyjhh/whats_your_shift_hjkl_normal_mode_mappings/)
https://youtu.be/w7i4amO_zaE

## To Look Into
Search r/vim for things
use plugins with nvim

## Keys to Remap

K
M
Q
Z
Home to scroll up
End to scroll dow
- hyphen
- caps lock
- quote
- K (to %?)
- shift enter
- delete
\
|
_
-
+
@
alt
!
^
&
*


## Macros to add

- toggle highlighting with :....!
- search for TODO
- ignore case in search except for title case

## add comment to vimrc

- https://chrisyeh96.github.io/2017/12/18/vimrc.html

## Clipboard

- WSL yank support from https://www.reddit.com/r/bashonubuntuonwindows/comments/be2q3l/comment/el2vx7u/

## Statusline

- [Statusline](https://www.reddit.com/r/vim/comments/gexi6/a_smarter_statusline_code_in_comments/)

## Cursor for mode

- [Cursor](https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes)

## Javascript

- https://freshman.tech/vim-javascript/

## Folding and outlining:

- https://alldrops.info/posts/vim-drops/2018-04-25_javascript-folding-on-vim/
- https://stackoverflow.com/questions/4559571/how-can-i-automatically-fold-all-functions-in-a-file-with-vim
- https://vi.stackexchange.com/questions/5941/summary-of-functions-in-current-file
- https://www.unix.com/shell-programming-and-scripting/265944-vim-match-all-bracket-fold-them-zf.html

## Macros

- https://stackoverflow.com/questions/2024443/saving-vim-macros

## Color scheme

- https://github.com/altercation/vim-colors-solarized
- https://vi.stackexchange.com/questions/4669/markdown-how-to-syntax-highlight-bold-and-italic-in-different-color-than-normal
- https://www.benpickles.com/articles/88-vim-syntax-highlight-markdown-code-blocks

## change cursor for mode

[Source](https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes)

```vimscript
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[1 q"
```

## Neovim

Primeagen
https://www.freecodecamp.org/news/a-guide-to-modern-web-development-with-neo-vim-333f7efbf8e2/
