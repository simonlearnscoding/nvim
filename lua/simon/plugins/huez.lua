-- Lazy

return {
  event = 'BufWinEnter',
  'vague2k/huez.nvim',
  dependencies = {
    -- You probably already have this installed, highly reccomended you do.
    'nvim-telescope/telescope.nvim',
    -- If using vim.ui, this plugin will give you a better experience
    'stevearc/dressing.nvim',
  },
  config = function()
    require('huez').setup()
    local colorscheme = require('huez.api').get_colorscheme()
    vim.cmd('colorscheme ' .. colorscheme)
    vim.keymap.set('n', '<leader>co', '<cmd>Huez<CR>', {})
  end,
}
