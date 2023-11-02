-- TODO: fix refactoring plugin
return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('refactoring').setup {}
    vim.keymap.set({ 'n', 'v' }, '<leader>rx', '<Cmd>:Refactor extract<cr>')
    -- vim.keymap.set({ 'n', 'v' },  ,'<Cmd>:Refactor extract<cr>')
  end,
}
