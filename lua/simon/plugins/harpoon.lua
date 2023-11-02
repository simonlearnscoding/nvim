return {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    vim.keymap.set({ 'n' }, '<leader>mm', ':lua require("harpoon.mark").add_file()<CR>')
    vim.keymap.set({ 'n' }, '<leader>mn', ':lua require("harpoon.ui").nav_next()<CR>')
    vim.keymap.set({ 'n' }, '<leader>mp', ':lua require("harpoon.ui").nav_prev()<CR>')
    vim.keymap.set({ 'n' }, '<leader>fh', '<cmd> :Telescope harpoon marks<CR>')
    vim.keymap.set({ 'n' }, '<leader>mf', '<cmd> :Telescope harpoon marks<CR>')
    vim.keymap.set({ 'n' }, '<leader>mM', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
  end,
}
