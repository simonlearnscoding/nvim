return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  opts = function()
    require('gitsigns').setup({
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
      },
      -- on_attach = function(bufnr)
      --
      --
      --   utils.load_mappings("gitsigns", { buffer = bufnr })
      -- end,
    })
  end,
  config = function(_, opts)
    -- dofile(vim.g.base46_cache .. "git")
    -- require("gitsigns").setup(opts)
  end,
}
