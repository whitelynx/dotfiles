-- Install needed packages:
--   paru -S helm-ls-bin yaml-language-server php terraform-ls
--   npm install -g awk-language-server bash-language-server dockerfile-language-server-nodejs @microsoft/compose-language-service fish-lsp vscode-langservers-extracted perlnavigator-server typescript typescript-language-server svelte-language-server sql-language-server vim-language-server @vue/language-server
--   cargo install gitlab-ci-ls openscad-lsp tree-sitter-cli
--   go install github.com/arduino/arduino-language-server@latest github.com/wader/jq-lsp@master
--   ~/.pyenv/versions/neovim/bin/pip install nginx-language-server "python-lsp-server[yapf]" rope
--   curl -Lo ~/bin/phpactor https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar; chmod +x ~/bin/phpactor
--   rustup component add rust-analyzer

vim.lsp.enable('arduino_language_server')
vim.lsp.enable('awk_ls')
vim.lsp.enable('bashls')
vim.lsp.enable('clangd')
vim.lsp.enable('dockerls')
vim.lsp.enable('docker_compose_language_service')
vim.lsp.enable('eslint')
vim.lsp.enable('fish_lsp')
vim.lsp.enable('gitlab_ci_ls')
vim.lsp.enable('helm_ls')
vim.lsp.enable('html')
vim.lsp.enable('jsonls')
vim.lsp.enable('jqls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('nginx_language_server')
vim.lsp.enable('openscad_lsp')
vim.lsp.enable('perlnavigator')
vim.lsp.enable('phpactor')
vim.lsp.enable('pylsp')
vim.lsp.enable('rust_analyzer')
--vim.lsp.enable('salt_ls') -- This currently won't install.
vim.lsp.enable('sqlls')
vim.lsp.enable('svelte')
vim.lsp.enable('terraformls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('vimls')
vim.lsp.enable('vue_ls')
vim.lsp.enable('yamlls')
