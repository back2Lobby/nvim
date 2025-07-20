-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- show current file name (useful when windows are splitted)
vim.opt.winbar = "%=%m %f"

-- hide the header/bander in netrw
vim.g.netrw_banner = 0

-- set intelephense as lsp for php
vim.g.lazyvim_php_lsp = "intelephense"
