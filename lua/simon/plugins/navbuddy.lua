return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "SmiteshP/nvim-navbuddy",
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim"
      },
      opts = {
        lsp = {
          auto_attach = true,
        }
      }
    }
  },
  -- config = function()
  --   local lsp = require("lsp-zero")
  --   lsp.on_attach(
  --     vim.keymap.set("n", "<C-n>", "<cmd>Navbuddy<CR>")
  --   )
  -- end

  -- your lsp config or other stuff
}
