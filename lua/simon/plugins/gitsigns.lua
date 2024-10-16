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
    }

    -- Toggle function to toggle both signcolumn and linehl
    -- vim.api.nvim_set_keymap(
    --   'n',
    --   '<leader>gt',
    --   ':lua require("gitsigns").toggle_signs()<CR>:lua require("gitsigns").toggle_linehl()<CR>',
    --   { noremap = true, silent = true }
    -- )
    --
    -- -- Toggle individual features (if needed)
    -- vim.api.nvim_set_keymap('n', '<leader>gs', ':lua require("gitsigns").toggle_signs()<CR>', { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap('n', '<leader>gl', ':lua require("gitsigns").toggle_linehl()<CR>', { noremap = true, silent = true })
  end,
  config = function(_, opts) end,
}
