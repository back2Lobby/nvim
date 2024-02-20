return {
    {
        'tpope/vim-fugitive',
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                attach_to_untracked = true,
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    map('n', 'gp', gs.preview_hunk)
                end
            }
        end
    }
}
