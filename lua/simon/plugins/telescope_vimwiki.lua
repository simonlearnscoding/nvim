return {
  "ElPiloto/telescope-vimwiki.nvim",
  event = "VeryLazy",
  config = function()
    require("telescope").load_extension "vimwiki"

    vim.keymap.set("n", "<leader>fv", "<cmd>:Telescope vimwiki<cr>", opts)
  end,
}
