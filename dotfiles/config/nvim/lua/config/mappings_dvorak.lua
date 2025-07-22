-- Clean up QWERTY keymap
--                                                                  [revert to]
pcall(function () vim.keymap.del({'n', 'i', 'v'}, 'j'    ) end) --  down (next _logical_ line)
pcall(function () vim.keymap.del({'n', 'i', 'v'}, 'k'    ) end) --  up (previous _logical_ line)
pcall(function () vim.keymap.del('n',             '<C-j>') end) --  unknown
pcall(function () vim.keymap.del('n',             '<C-k>') end) --  unknown
pcall(function () vim.keymap.del('n',             '<C-l>') end) --  unknown

-- Movement
--                         [new]     [old]       [description]
vim.keymap.set({'n', 'v'}, 'h',      'h')     -- left
vim.keymap.set({'n', 'v'}, 't',      'gj')    -- down (next display line)
vim.keymap.set({'n', 'v'}, 'n',      'gk')    -- up (previous display line)
vim.keymap.set({'n', 'v'}, 's',      'l')     -- right
vim.keymap.set({'n', 'v'}, 'H',      '0')     -- beginning of line
vim.keymap.set({'n', 'v'}, 'T',      'L')     -- bottom of screen
vim.keymap.set({'n', 'v'}, 'N',      'H')     -- top of screen
vim.keymap.set({'n', 'v'}, 'S',      '$')     -- end of line
vim.keymap.set({'n', 'v'}, '<Down>', 'gj')    -- down (next display line)
vim.keymap.set({'n', 'v'}, '<Up>',   'gk')    -- up (previous display line)

-- Searching
--                         [new] [old]    [description]
vim.keymap.set({'n', 'v'}, 'l',  'n')  -- repeat latest search
vim.keymap.set({'n', 'v'}, 'L',  'N')  -- repeat latest search, reversed

-- Window Navigation
--                  [new]    [old]        [description]
vim.keymap.set('n', '<C-h>', '<C-W>h') -- next window to the left of the current
vim.keymap.set('n', '<C-t>', '<C-W>j') -- next window below the current
vim.keymap.set('n', '<C-n>', '<C-W>k') -- next window above the current
vim.keymap.set('n', '<C-s>', '<C-W>l') -- next window to the right of the current

-- Folding
--                  [new]      [old]     [description]
vim.keymap.set('n', '<space>', 'za')  -- toggle the fold under the cursor
vim.keymap.set('v', '<space>', 'zf')  -- create a fold from the current visual selection

-- Buffer/tab switching
-- Use Alt+[number] to switch to the numbered buffer
vim.keymap.set('n', '<A-1>', ':<C-u>GoToBufferOrTab 1<CR>')
vim.keymap.set('n', '<A-2>', ':<C-u>GoToBufferOrTab 2<CR>')
vim.keymap.set('n', '<A-3>', ':<C-u>GoToBufferOrTab 3<CR>')
vim.keymap.set('n', '<A-4>', ':<C-u>GoToBufferOrTab 4<CR>')
vim.keymap.set('n', '<A-5>', ':<C-u>GoToBufferOrTab 5<CR>')
vim.keymap.set('n', '<A-6>', ':<C-u>GoToBufferOrTab 6<CR>')
vim.keymap.set('n', '<A-7>', ':<C-u>GoToBufferOrTab 7<CR>')
vim.keymap.set('n', '<A-8>', ':<C-u>GoToBufferOrTab 8<CR>')
vim.keymap.set('n', '<A-9>', ':<C-u>GoToBufferOrTab 9<CR>')
vim.keymap.set('n', '<A-0>', ':<C-u>GoToBufferOrTab 10<CR>')
-- Switch to buffer 11.
vim.keymap.set('n', '<A-[>', ':<C-u>GoToBufferOrTab 11<CR>')
-- Switch to the last buffer.
vim.keymap.set('n', '<A-]>', ':<C-u>LastBufferOrTab<CR>')

-- Use Ctrl+Tab to switch to the next buffer, and Ctrl+Shift+Tab to switch
-- to the previous buffer. This lets miniBufExpl do the bindings. (?)
vim.keymap.set('n', '<C-Tab>', ':<C-u>bn<CR>')
vim.keymap.set('n', '<C-S-Tab>', ':<C-u>bp<CR>')

-- Use Ctrl+u to switch to the next buffer, and Ctrl+o to switch to the
-- previous buffer.
vim.keymap.set('n', '<C-u>', ':<C-u>bn<CR>')
vim.keymap.set('n', '<C-o>', ':<C-u>bp<CR>')

-- Random fixes
vim.keymap.set('n', 'cs', 'cl') -- correct one character to the right

-- if vim-surround is installed, this will keep it from stealing 'cs' (should be the same as c<Right>)
--vim.api.nvim_create_autocmd('VimEnter',
--    {
--        callback = function(ev)
--            pcall(function () vim.keymap.del('n', 'cs') end)
--        end
--    })
