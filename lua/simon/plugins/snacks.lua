return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true, animate = {
      duration = { step = 15, total = 100 },
      easing = 'linear',
    } },
    zen = { enabled = true },
  },

  keys = {
    {
      '<leader>z',
      function()
        Snacks.zen()
      end,
      desc = 'Toggle Zen Mode',
    },
  },
}
