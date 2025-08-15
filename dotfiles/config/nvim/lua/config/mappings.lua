-- Resync syntax
--nnoremap <Leader>s :<C-u>syntax sync fromstart<CR>
vim.keymap.set('n', '<Leader>sy', ':<C-u>syntax sync fromstart<CR>', { desc = 'Resync syntax highlighting' })

-- Split windows
vim.keymap.set('n', '<Leader>v', ':<C-u>vsplit<CR>', { desc = 'Split current window vertically' })

-- Open a scratch buffer in a split window
--nnoremap <Leader>S :<C-u>call ScratchBuffer()<CR>
vim.keymap.set('n', '<Leader>sc', ':<C-u>call ScratchBuffer()<CR>', { desc = 'Open scratch buffer' })

-- Toggle the 'paste' option (useful for pasting text in a terminal)
--nnoremap <Leader>p :<C-u>set paste!<CR>
vim.keymap.set('n', '<Leader>p', ':<C-u>set paste!<CR>', { desc = 'Toggle `paste` setting' })

-- Toggle the 'list' option (display whitespace characters)
vim.keymap.set('n', '<Leader>d', ':<C-u>set list!<CR>', { desc = 'Toggle visual whitespace' })

-- Join {motion} lines (like J, but accepts a {motion})
vim.keymap.set('n', '<Leader>j', ':<C-u>set opfunc=JoinOperator<CR>g@', { desc = 'Join {motion} lines' })

-- Navbuddy
vim.keymap.set('n', '<Leader>n', ':<C-u>Navbuddy<CR>', { desc = 'Show Navbuddy' })

-- VimWiki
vim.keymap.set('n', '<Leader>W', ':<C-u>VimwikiIndex<CR>', { desc = 'Show VimWiki' })

-- fzf-lua
vim.keymap.set('n', '<Leader>l', function() FzfLua.quickfix() end, { desc = 'Browse quickfix' })
vim.keymap.set('n', '<Leader>L', function() FzfLua.loclist() end, { desc = 'Browse loclist' })
vim.keymap.set('n', '<Leader>b', function() FzfLua.buffers() end, { desc = 'Browse open buffers' })
vim.keymap.set('n', '<Leader>f', function() FzfLua.git_files() end, { desc = 'Browse files managed by git' })
vim.keymap.set('n', '<Leader>F', function() FzfLua.files() end, { desc = 'Browse files in current directory' })
vim.keymap.set('n', '<Leader>/', function() FzfLua.live_grep_native() end, { desc = 'Grep in directory (native)' })
vim.keymap.set('n', '<Leader>g/', function() FzfLua.grep_project() end, { desc = 'Grep in project' })
vim.keymap.set('n', '<Leader>gw', function() FzfLua.grep_cword() end, { desc = 'Grep for current word' })
vim.keymap.set('n', '<Leader>gW', function() FzfLua.grep_cWORD() end, { desc = 'Grep for current word, surrounded by whitespace only' })
vim.keymap.set('n', '<Leader>sp', function() FzfLua.spell_suggest() end, { desc = 'Show spelling suggestions for current word' })
vim.keymap.set('n', '<Leader>SP', function() FzfLua.spellcheck() end, { desc = 'Browse spelling suggestions in document' })
vim.keymap.set('n', '<Leader>h', function() FzfLua.helptags() end, { desc = 'Browse NeoVim help tags' })
vim.keymap.set('n', '<Leader>H', function() FzfLua.manpages() end, { desc = 'Browse manpages' })
vim.keymap.set('n', '<Leader>m', function() FzfLua.marks() end, { desc = 'Browse marks' })
vim.keymap.set('n', '<Leader>t', function() FzfLua.lsp_finder() end, { desc = 'LSP finder (?)' })
vim.keymap.set('n', '<Leader>o', function() FzfLua.lsp_document_symbols() end, { desc = 'Browse symbols in document (LSP)' }) -- "overview"?
vim.keymap.set('n', '<Leader>c', function() FzfLua.lsp_incoming_calls() end, { desc = 'Browse incoming calls (LSP)' })
vim.keymap.set('n', '<Leader>C', function() FzfLua.lsp_outgoing_calls() end, { desc = 'Browse outgoing calls (LSP)' })

-- mini.git
vim.keymap.set({'n', 'v'}, '<Leader>gh', function() MiniGit.show_range_history() end, { desc = 'Show git history in range' })
vim.keymap.set('n', '<Leader>gg', function() MiniGit.show_at_cursor() end, { desc = 'Show git history at cursor' })

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
