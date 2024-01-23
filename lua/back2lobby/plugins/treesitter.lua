return 	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    config = function()

        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "lua", "javascript", "typescript", "tsx", "html","css","javascript", "rust", "c", "query", "php" },

            auto_install = true,

            sync_install = false,

            ignore_install = {},

            highlight = { enable = true },

            indent = { enable = true }

        })

    end
}
