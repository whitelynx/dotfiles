-- Resync syntax
--nnoremap <Leader>s :<C-u>syntax sync fromstart<CR>
vim.keymap.set('n', '<Leader>s', ':<C-u>syntax sync fromstart<CR>')

-- Open a scratch buffer in a split window
--nnoremap <Leader>S :<C-u>call ScratchBuffer()<CR>
vim.keymap.set('n', '<Leader>S', ':<C-u>call ScratchBuffer()<CR>')

-- Toggle the 'paste' option (useful for pasting text in a terminal)
--nnoremap <Leader>p :<C-u>set paste!<CR>
vim.keymap.set('n', '<Leader>p', ':<C-u>set paste!<CR>')

-- Toggle the 'list' option (display whitespace characters)
vim.keymap.set('n', '<Leader>d', ':<C-u>set list!<CR>')

-- Join {motion} lines (like J, but accepts a {motion})
vim.keymap.set('n', '<Leader>j', ':<C-u>set opfunc=JoinOperator<CR>g@')

-- Navbuddy
vim.keymap.set('n', '<Leader>n', ':<C-u>Navbuddy<CR>')


--"nnoremap <Leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
--nnoremap <Leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/git:!<cr>
--nnoremap <Leader>F :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
--"nnoremap <Leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
--nnoremap <Leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
--nnoremap <Leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
--nnoremap <Leader>b :<C-u>Unite -no-split -buffer-name=buffer  -start-insert buffer<cr>
--nnoremap <Leader>/ :<C-u>Unite -no-split -buffer-name=grep    -start-insert grep:.<cr>
--nnoremap <Leader>g/ :<C-u>Unite -no-split -buffer-name=grep   -start-insert grep/git:.<cr>
