-- Have Vim jump to the last position when reopening a file
vim.cmd [[ autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exec "normal! g`\"" | endif ]]

-- Strip trailing whitespace on save if configured for the buffer.
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function()
        if vim.b.remove_trailing_whitespace_on_save then
            local viewInfo = vim.fn.winsaveview()

            -- Search and replace trailing whitespaces
            vim.cmd([[keeppatterns %s/\m\s\+$//e]])

            vim.fn.winrestview(viewInfo)
        end
    end,
})

