return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.routes = opts.routes or {}

      -- add the route filter which will make nvim ignore this specific rust analyzer error
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          error = true,
          find = "Invalid offset LineCol",
        },
        opts = {
          skip = true,
        },
      })

      return opts
    end,
  },
}
