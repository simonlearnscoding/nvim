-- Install lazy package manager

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
-- lua with packer.nvim
require('lazy').setup {
  'mrjones2014/smart-splits.nvim',
  {
    -- makes it easy to extend the functionality of a keymap (appearently??)
    'anuvyklack/keymap-amend.nvim',
  },
  -- icons for nvim
  'nvim-tree/nvim-web-devicons',
  'ron89/thesaurus_query.vim',

  {
    'echasnovski/mini.pairs',
    event = 'VeryLazy',
    opts = {},
  },
  ---@diagnostic disable-next-line: trailing-space

  'famiu/bufdelete.nvim',
  'tpope/vim-sleuth',

  --
  { import = 'simon.plugins' },
}
