return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    --dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local harpoon = require("harpoon")

        harpoon.setup()

        vim.keymap.set("n", "<A-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        vim.keymap.set("n", "<A-u>", function() harpoon:list():append() end)
        vim.keymap.set("n", "<A-7>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<A-8>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<A-9>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<A-0>", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<A-p>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<A-n>", function() harpoon:list():next() end)
    end
}
