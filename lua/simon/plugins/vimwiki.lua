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
    -- vim.g.vimwiki_key_mappings = {
    --   -- all_maps = 0,
    -- }
    -- vim.keymap.set("n", "<leader>vw", "<cmd>VimwikiIndex 1<cr>")
    -- vim.keymap.set("n", "<leader>vt", "<cmd>VimwikiDiaryIndex <cr>")
    -- vim.keymap.set("n", "<leader>vt", "<cmd>VimwikiDiaryIndex <cr>")
    -- vim.keymap.set("n", "<leader>vy", "<cmd>VimwikiMakeYesterdayDiaryNote <cr>")
    vim.keymap.set("n", "<Backspace>", "<Plug>VimwikiGoBackLink ")
    vim.keymap.set("n", "<leader>w<leader>", "<Plug>VimwikiGoBackLink ")
    vim.keymap.set("n", "<Tab>", "<Plug>VimwikiNextLink ")
    vim.keymap.set("n", "<S-Tab>", "<Plug>VimwikiPrevLink ")
    vim.keymap.set("n", "<leader>d", "<Plug>TaskWikiDone ")
    vim.keymap.set("n", "<leader>p", "<Plug>TaskWikiProjects ")
  end,
}
