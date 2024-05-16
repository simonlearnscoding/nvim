if vim.g.neovide then
  return {}
end
return {
  "tribela/vim-transparent",
  config = function()
    vim.g.transparent_enabled = 1
    -- vim.g.transparent_darkness = 0.7
  end,
}
