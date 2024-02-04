return {
    { "folke/neodev.nvim", opts = {} },
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"} },
    { "theHamsta/nvim-dap-virtual-text", dependencies = {"mfussenegger/nvim-dap"} , config = function()
        require("nvim-dap-virtual-text").setup({})
    end},
    { "nvim-telescope/telescope-dap.nvim", dependencies = {"mfussenegger/nvim-dap", "nvim-telescope/telescope.nvim","nvim-treesitter/nvim-treesitter" }, config = function()
        require("telescope").load_extension("dap")
    end},
    {
        -- it will change the current working directory to the project root
        -- so using telescope will show results from current project only
        "notjedi/nvim-rooter.lua",
        config = function()
            require("nvim-rooter").setup({})
        end
    }
}
