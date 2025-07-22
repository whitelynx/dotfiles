--== Python integration ==
-- To set this up:
--
--    pyenv virtualenv default neovim
--    pyenv activate neovim
--    pip install pynvim neovim pyflakes yapf
--    ln -s (pyenv which pyflakes) (pyenv which yapf) ~/bin/

-- Set the path to the Python executable, in its virtualenv.
vim.g.python3_host_prog = vim.env.HOME .. '/.pyenv/versions/neovim/bin/python'
