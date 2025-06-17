return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {}

    -- Keymap: <leader>E to toggle nvim-tree
    vim.keymap.set('n', '<leader>E', ':NvimTreeToggle<CR>', { noremap = true, silent = true, desc = 'Toggle File Explorer' })
  end,
}
