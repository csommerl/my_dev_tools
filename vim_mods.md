# Vim Mods

- Alphabetize vimrc?

## Sources

[Frequents](https://www.reddit.com/r/vim/comments/oyqkkd/your_most_frequently_used_mapping/)
[Space, Enter, and BS](https://www.reddit.com/r/vim/comments/3egaqw/spacebar_backspace_and_enter_are_all_fairly/)
[Other](https://www.reddit.com/r/vim/comments/btyjhh/whats_your_shift_hjkl_normal_mode_mappings/)

## To Look Into
Search r/vim for things
use plugins with nvim

## Keys to Remap

- tab
- hyphen
- back tick
- caps lock
- quote
- M
- l, h
- K (to %?)
- Q, q
- Y to Y$
- =
- shift enter
- delete

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

