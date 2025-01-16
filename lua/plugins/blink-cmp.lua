return {
  -- disabling buffer text suggestions
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.sources = {
        -- all soruces except buffer
        default = { "lsp", "path" },
        cmdline = {},
      }

      return opts
    end,
  },
}
