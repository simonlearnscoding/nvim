-- install with yarn or npm
return {
  event = "VeryLazy",
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && npm run install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }

    vim.g.mkdp_auto_start = 1
    vim.g.mkdp_auto_close = 1
    vim.g.mkdp_theme = 'light'
  end,
  ft = { "markdown" },
}
