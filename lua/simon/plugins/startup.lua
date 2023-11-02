return {
  'startup-nvim/startup.nvim',
  requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  config = function()
    require('startup').setup { theme = 'dashboard' } -- put theme name here
    require('startup').create_mappings {
      ['<leader>ffooooo'] = '<cmd>Telescope find_files<CR>',
      ['<leader>lg'] = '<cmd>Telescope live_grep<CR>',
    }
  end,
}
