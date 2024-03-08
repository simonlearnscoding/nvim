return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "marilari88/neotest-vitest",
  },

  config = function()
    require("neotest").setup {
      test_framework = {
        filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
        command = "yarn test",
        split_window = true
      },

      discovery = {
        enabled = false,
      },
      adapters = {
        require('neotest-vitest')({
          vitestCommand = 'npm run test'
          
          --   filter_dir = function(name, rel_path, root)
          --   return name ~= "node_modules"
          -- end,
        }),
      }
    }

        -- Set up key mappings for running tests with Neotest
    vim.api.nvim_set_keymap(
      "n", 
      "<leader>twr", 
      "<cmd>lua require('neotest').run.run()<cr>", 
      { desc = "Run Watch" }
    )

    vim.api.nvim_set_keymap(
      "n",
      "<leader>twf",
      "<cmd>lua require('neotest').run.run({ vim.fn.expand('%'), vitestCommand = 'vitest --watch' })<cr>",
      { desc = "Run Watch File" }
    )
  end

}
