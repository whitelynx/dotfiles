return {
    { "echasnovski/mini.nvim", version = false },
    "folke/neodev.nvim",
    "folke/which-key.nvim",
    "sheerun/vim-polyglot",
    {
        "https://gitlab.com/skewed-aspect/redux.vim.git",
        config = function()
            vim.cmd "colorscheme redux"
        end,
    },
    --{
    --    "neanias/everforest-nvim",
    --    version = false,
    --    lazy = false,
    --    priority = 1000, -- make sure to load this before all the other start plugins
    --    -- Optional; default configuration will be used if setup isn't called.
    --    config = function()
    --        require("everforest").setup({
    --            -- Your config here
    --        })
    --        require("everforest").load()
    --    end,
    --},
    --{
    --    "nvim-lualine/lualine.nvim",
    --    dependencies = { "nvim-tree/nvim-web-devicons" }
    --},
    --{
    --    "sschleemilch/slimline.nvim",
    --    opts = {}
    --},
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "SmiteshP/nvim-navbuddy",
                dependencies = {
                    "SmiteshP/nvim-navic",
                    "MunifTanjim/nui.nvim"
                },
                opts = { lsp = { auto_attach = true } }
            }
        },
    },
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        branch = "main",
        build = ":TSUpdate"
    },
    {
        "vimwiki/vimwiki",
        init = function()
            vim.g.vimwiki_list = {
                {
                    syntax = "markdown",
                    ext = "md",
                    path = "~/Nextcloud/Notes/",
                }
            }
        end
    },
    --"duane9/nvim-rg",
    {
        "ibhagwan/fzf-lua",
        dependencies = { { "echasnovski/mini.nvim", version = false } },
        opts = {}
    },
    {
        "linrongbin16/gitlinker.nvim",
        cmd = "GitLink",
        opts = {},
        keys = {
            { "<leader>ghc", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Yank git link" },
            { "<leader>gho", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link" },
        },
    },
    {
        "saghen/blink.cmp",
        -- optional: provides snippets for the snippet source
        dependencies = { "rafamadriz/friendly-snippets" },

        -- use a release tag to download pre-built binaries
        version = "1.*",
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = "cargo build --release",
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = "nix run .#build-plugin",

        ---@module "blink.cmp"
        ---@type blink.cmp.Config
        opts = {
            -- "default" (recommended) for mappings similar to built-in completions (C-y to accept)
            -- "super-tab" for mappings similar to vscode (tab to accept)
            -- "enter" for enter to accept
            -- "none" for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = { preset = "super-tab" },

            appearance = {
                -- "mono" (default) for "Nerd Font Mono" or "normal" for "Nerd Font"
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = "mono"
            },

            -- (Default) Only show the documentation popup when manually triggered
            completion = { documentation = { auto_show = false } },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    },
}
