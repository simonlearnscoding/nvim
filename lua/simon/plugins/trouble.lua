return {
  'folke/trouble.nvim',
  event = "VeryLazy",

  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      vim.keymap.set("n", "<leader>df", "<cmd>TroubleToggle document_diagnostics<cr>"),
      vim.keymap.set("n", ':Trouble diagnostics<cr>', { desc = ' [d]iagnostic' }),
    }
  end
}
