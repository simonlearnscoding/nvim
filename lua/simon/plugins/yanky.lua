return {

  'gbprod/yanky.nvim',
  config = function()
    require('yanky').setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      highlight = {
        on_put = true,
        on_yank = true,
        timer = 100,
      },
    }

    vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)')
    vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)')
    vim.keymap.set('n', '<c-p>', '<Plug>(YankyCycleForward)')
    vim.keymap.set('n', '<c-n>', '<Plug>(YankyCycleBackward)')
  end,
}
