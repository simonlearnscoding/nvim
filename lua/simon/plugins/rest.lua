return {
  'mistweaverco/kulala.nvim',

  config = function()
    require('kulala').setup {
      -- your config
      vim.api.nvim_set_keymap('n', '<leader>ht', '<cmd>lua require"kulala".run()<CR>', { noremap = true, silent = true }),
    }
  end,

  opts = {},
}
