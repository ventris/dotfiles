return {
    "williamboman/mason-lspconfig.nvim",

    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        "zbirenbaum/copilot-cmp",
        "stevearc/conform.nvim",
    },

    config = function()
        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "tsserver",
                "rust_analyzer",
                "pyright",
                "gopls",
            },
            handlers = {
                function(server_name)
                    local cmp_lsp = require("cmp_nvim_lsp")
                    local capabilities = vim.tbl_deep_extend(
                        "force",
                        {},
                        vim.lsp.protocol.make_client_capabilities(),
                        cmp_lsp.default_capabilities())

                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup({
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" },
                                },
                            },
                        },
                    })
                end,
            }
        })

        require("conform").setup({
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
            -- rust
            ["rust"] = {
                {
                    name = "rustfmt",
                    format = "rustfmt",
                    check = "rustfmt",
                },
            },
            -- go
            ["go"] = {
                {
                    name = "gofmt",
                    format = "gofmt",
                    check = "gofmt",
                },
                {
                    name = "goimports",
                    format = "goimports",
                    check = "goimports",
                },
                {
                    name = "golines",
                    format = "golines",
                    check = "golines",
                },
                {
                    name = "goimports -local github.com/zbirenbaum",
                    format = "goimports",
                    check = "goimports",
                    args = { "-local", "github.com/zbirenbaum" },
                },
            },
            -- Python
            ["python"] = {
                {
                    name = "black",
                    args = { "--quiet", "--fast", "--line-length", "79" },
                    format = "black",
                    check = "black",
                },
            },
            -- Lua
            ["lua"] = {
                {
                    name = "stylua",
                    format = "stylua",
                    check = "stylua",
                },
            },
        })

        require("luasnip/loaders/from_vscode").load({})

        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'copilot' },
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        -- Set configuration for specific filetype.
        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
            })
        })
    end
}
