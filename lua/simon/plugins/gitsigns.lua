return {
  'lewis6991/gitsigns.nvim',
  event = 'BufReadPre',
  opts = function()
    require('gitsigns').setup {
      signs = {
        add = { text = '│' },
        change = { text = '│' },
        delete = { text = '󰍵' },
        topdelete = { text = '‾' },
        changedelete = { text = '󱗜' },
        untracked = { text = '│' },
      },
      signcolumn = true, -- Show git status in the sign column
      linehl = false, -- Highlight lines with git changes
      conflict = {
        enable = true, -- Enable conflict highlights
      },
    }

    local wk = require 'which-key'
    -- Toggle function to toggle both signcolumn and linehl
    --
    wk.add {
      '<leader>gt',
      function()
        require('gitsigns').toggle_signs()
        require('gitsigns').toggle_deleted()
        require('gitsigns').toggle_linehl()
      end,
      desc = ' Toggle git signs',
    }

    --
    -- -- Toggle individual features (if needed)
    -- vim.api.nvim_set_keymap('n', '<leader>gs', ':lua require("gitsigns").toggle_signs()<CR>', { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap('n', '<leader>gl', ':lua require("gitsigns").toggle_linehl()<CR>', { noremap = true, silent = true })
  end,
  config = function(_, opts) end,
}
