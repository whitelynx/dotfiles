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

-- fzf-lua
vim.keymap.set('n', '<Leader>l', function() FzfLua.quickfix() end)
vim.keymap.set('n', '<Leader>L', function() FzfLua.loclist() end)
vim.keymap.set('n', '<Leader>b', function() FzfLua.buffers() end)
vim.keymap.set('n', '<Leader>f', function() FzfLua.git_files() end)
vim.keymap.set('n', '<Leader>F', function() FzfLua.files() end)
vim.keymap.set('n', '<Leader>/', function() FzfLua.live_grep_native() end)
vim.keymap.set('n', '<Leader>g/', function() FzfLua.grep_project() end)
vim.keymap.set('n', '<Leader>gw', function() FzfLua.grep_cword() end)
vim.keymap.set('n', '<Leader>gW', function() FzfLua.grep_cWORD() end)
vim.keymap.set('n', '<Leader>s', function() FzfLua.spell_suggest() end)
vim.keymap.set('n', '<Leader>S', function() FzfLua.spellcheck() end)
vim.keymap.set('n', '<Leader>h', function() FzfLua.helptags() end)
vim.keymap.set('n', '<Leader>H', function() FzfLua.manpages() end)
vim.keymap.set('n', '<Leader>m', function() FzfLua.marks() end)
vim.keymap.set('n', '<Leader>t', function() FzfLua.lsp_finder() end)
vim.keymap.set('n', '<Leader>o', function() FzfLua.lsp_document_symbols() end) -- "overview"?
vim.keymap.set('n', '<Leader>c', function() FzfLua.lsp_incoming_calls() end)
vim.keymap.set('n', '<Leader>C', function() FzfLua.lsp_outgoing_calls() end)

-- mini.git
vim.keymap.set({'n', 'v'}, '<Leader>gh', function() MiniGit.show_range_history() end)
vim.keymap.set('n', '<Leader>gg', function() MiniGit.show_at_cursor() end)

--TODO:
--vim.keymap.set('n', '<Leader>ha', '<Plug>(GitGutterStageHunk)')
--vim.keymap.set('n', '<Leader>hs', '<Plug>(GitGutterStageHunk)')
--vim.keymap.set('n', '<Leader>hr', '<Plug>(GitGutterRevertHunk)')
--vim.keymap.set('n', '<Leader>ga', '<Plug>(GitGutterStageHunk)<cr>')
--vim.keymap.set('n', '<Leader>gr', '<Plug>(GitGutterRevertHunk)<cr>')
--vim.keymap.set('n', '<Leader>gp', '<Plug>(GitGutterPreviewHunk)<cr>')

--"nnoremap <Leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
--nnoremap <Leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
--nnoremap <Leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
--nnoremap <Leader>b :<C-u>Unite -no-split -buffer-name=buffer  -start-insert buffer<cr>
--nnoremap <Leader>/ :<C-u>Unite -no-split -buffer-name=grep    -start-insert grep:.<cr>
--nnoremap <Leader>g/ :<C-u>Unite -no-split -buffer-name=grep   -start-insert grep/git:.<cr>
