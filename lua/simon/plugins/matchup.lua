return {
  "andymass/vim-matchup",
  dependencies = 'nvim-treesitter/nvim-treesitter',
  setup = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
    require("nvim-treesitter.configs").setup {
      matchup = {
        enable = true
      }
    }
  end,
}
