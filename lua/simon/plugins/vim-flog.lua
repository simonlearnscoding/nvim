-- to view git branches
return {
  'rbong/vim-flog',
  lazy = true,
  event = 'VeryLazy',
  cmd = { 'Flog', 'Flogsplit', 'Floggit' },
  dependencies = {
    'tpope/vim-fugitive',
  },
}
