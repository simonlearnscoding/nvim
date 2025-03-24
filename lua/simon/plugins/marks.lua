return {
  'LintaoAmons/bookmarks.nvim',
  event = 'UiEnter',
  dependencies = {
    { 'kkharji/sqlite.lua' },
    { 'nvim-telescope/telescope.nvim' },
    { 'stevearc/dressing.nvim' }, -- optional
  },
  config = function()
    local opts = {}
    require('bookmarks').setup(opts)
    vim.keymap.set('n', '<leader>m', ':BookmarksMark<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>tm', ':BookmarksTree<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>fm', ':BookmarksGoto<CR>', { noremap = true, silent = true })
  end,
}
