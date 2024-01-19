return 	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    config = function()

        --local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        --parser_config.blade = {
        --    install_info = {
        --        url = "https://github.com/EmranMR/tree-sitter-blade",
        --        files = { "src/parser.c" },
        --        branch = "main",
        --    },
        --    filetype = "blade"
        --}

        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "lua", "javascript", "typescript", "tsx", "html", "rust", "c", "query", "php" },

            auto_install = true,

            sync_install = false,

            ignore_install = {},

            highlight = { enable = true },

            indent = { enable = true }

        })

    end
}
