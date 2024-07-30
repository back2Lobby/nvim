return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            "folke/neodev.nvim",
        },
        config = function()

            require("neodev").setup({})

            local cmp = require('cmp')
            local cmp_lsp = require("cmp_nvim_lsp")
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_lsp.default_capabilities())
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "tsserver",
                    "rust_analyzer",
                    "tailwindcss",
                    "intelephense",
                    "emmet_ls",
                    "volar"
                },
                handlers = {
                    function (server_name)
                        if server_name == "rust_analyzer" then
                            return
                        end
                        require("lspconfig")[server_name].setup {
                            capabilities = capabilities
                        }
                    end,
                    ["lua_ls"] = function ()
                        local lspconfig = require("lspconfig")
                       lspconfig.lua_ls.setup {
                            settings = {
                                Lua = {
                                    hint = {
                                        enable = true
                                    },
                                    diagnostics = {
                                        globals = { "vim" }
                                    },
                                    workspace = {
                                        library = vim.api.nvim_get_runtime_file("", true)
                                    }
                                }
                            }
                        }
                    end,
                    ["emmet_ls"] = function ()
                        local lspconfig = require("lspconfig")
                        lspconfig.emmet_ls.setup {
                            filetypes = {
                                "css", "eruby", "html", "javascript", "javascriptreact", "blade", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue"
                            }
                        }
                    end

                }
            })

            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ['<C-Space>'] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }, -- For luasnip users.
                }, {
                        { name = 'buffer' },
                    })
            })
        end},
    {
        "j-hui/fidget.nvim",
        opts = {
            -- options
        },
    },
    {
        "lvimuser/lsp-inlayhints.nvim",
        event = "LspAttach",
        config = function() require("lsp-inlayhints").setup() end
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
        config = function()
            vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>")
        end
    }
}

