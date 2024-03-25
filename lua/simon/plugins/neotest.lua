return {
  "nvim-neotest/neotest",
  event = "BufReadPost",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    'nvim-neotest/nvim-nio',
    "nvim-neotest/neotest-jest"
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
        require('neotest-jest')({
          jestCommand = "npm test  ",
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
      }
    }
  end

}
