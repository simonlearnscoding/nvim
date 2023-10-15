return {
  "vimwiki/vimwiki",
  event = "VeryLazy",
  init = function()
    vim.g.vimwiki_list = {
      {
        path = "~/projects/pages",
        syntax = "markdown",
        vimwiki_global_ext = 0,
        ext = ".md",
      },
    }
    vim.keymap.set("n", "<leader>ww", "<cmd>VimwikiIndex 1<cr>")
  end,
}
