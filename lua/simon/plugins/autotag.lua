return {
  'windwp/nvim-ts-autotag',
  dependendencies = {
    'nvim-treesitter/nvim-treesitter'
  },
  config = function()
    require('nvim-ts-autotag').setup({
      enable_close_on_slash = false,
    })
  end,
}
