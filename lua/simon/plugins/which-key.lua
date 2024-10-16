return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    vim.o.timeoutlen = 500
    local wk = require 'which-key'
    wk.add { '<leader>d', group = 'diagnostics' }
  end,
}
