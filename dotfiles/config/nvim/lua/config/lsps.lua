-- Install needed packages:
--   paru -S php terraform-ls
--   yarn global add awk-language-server bash-language-server dockerfile-language-server-nodejs @microsoft/compose-language-service fish-lsp vscode-langservers-extracted perlnavigator-server typescript typescript-language-server svelte-language-server sql-language-server vim-language-server @vue/language-server yaml-language-server
--   cargo install gitlab-ci-ls openscad-lsp tree-sitter-cli
--   go install github.com/arduino/arduino-language-server@latest
--   go install github.com/wader/jq-lsp@master
--   ~/.pyenv/versions/neovim/bin/pip install nginx-language-server "python-lsp-server[yapf]" rope
--   curl -Lo ~/bin/phpactor https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar; chmod +x ~/bin/phpactor
--   curl -Lo ~/bin/helm_ls https://github.com/mrjosh/helm-ls/releases/download/master/helm_ls_linux_amd64; chmod +x ~/bin/helm_ls
--   rustup component add rust-analyzer

vim.lsp.enable('arduino_language_server')
vim.lsp.enable('awk_ls')
vim.lsp.enable('bashls')
vim.lsp.enable('clangd')
vim.lsp.enable('cssls')
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

npx_path = vim.env.HOME .. '/.nvm/versions/node/' .. io.open(vim.env.HOME .. '/.nvm/alias/neovim'):read():match('^%s*(.-)%s*$') .. '/bin/npx'
pyenv_bin_path = vim.env.HOME .. '/.pyenv/versions/neovim/bin/'

vim.lsp.config('awk_ls', { cmd = { npx_path, 'awk-language-server' } })
vim.lsp.config('bashls', { cmd = { npx_path, 'bash-language-server', 'start' } })
vim.lsp.config('cssls', { cmd = { npx_path, 'vscode-css-language-server', '--stdio' } })
vim.lsp.config('dockerls', { cmd = { npx_path, 'docker-langserver', '--stdio' } })
vim.lsp.config('docker_compose_language_service', { cmd = { npx_path, 'docker-compose-langserver', '--stdio' } })
vim.lsp.config('eslint', { cmd = { npx_path, 'vscode-eslint-language-server', '--stdio' } })
vim.lsp.config('fish_lsp', { cmd = { npx_path, 'fish-lsp', 'start' } })
vim.lsp.config('html', { cmd = { npx_path, 'vscode-html-language-server', '--stdio' } })
vim.lsp.config('jsonls', { cmd = { npx_path, 'vscode-json-language-server', '--stdio' } })
vim.lsp.config('sqlls', { cmd = { npx_path, 'sql-language-server', 'up', '--method', 'stdio' } })
vim.lsp.config('svelte', { cmd = { npx_path, 'svelteserver', '--stdio' } })
vim.lsp.config('ts_ls', { cmd = { npx_path, 'typescript-language-server', '--stdio' } })
vim.lsp.config('vimls', { cmd = { npx_path, 'vim-language-server', '--stdio' } })
vim.lsp.config('vue_ls', { cmd = { npx_path, 'vue-language-server', '--stdio' } })
vim.lsp.config('yamlls', { cmd = { npx_path, 'yaml-language-server', '--stdio' } })

vim.lsp.config('pylsp', { cmd = { pyenv_bin_path .. 'pylsp' } })
vim.lsp.config('nginx_language_server', { cmd = { pyenv_bin_path .. 'nginx-language-server' } })
