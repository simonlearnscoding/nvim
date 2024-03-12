local utils = require 'simon.utils'
local maps = { i = {}, n = {}, v = {}, t = {} }
-- GitSigns
maps.n['<leader>g'] = { desc = '󰊢 Git' }
maps.n[']g'] = {
  function()
    require('gitsigns').next_hunk()
  end,
  desc = 'Next Git hunk',
}


maps.n['<leader>gc'] = {
  "<cmd> Git commit<CR>",
  desc = 'Previous Git hunk',
}

maps.n['[g'] = {
  function()
    require('gitsigns').prev_hunk()
  end,
  desc = 'Previous Git hunk',
}
maps.n['<leader>gb'] = {
  function()
    require('gitsigns').blame_line()
  end,
  desc = 'View Git blame',
}
maps.n['<leader>gp'] = {
  function()
    require('gitsigns').preview_hunk()
  end,
  desc = 'Preview Git hunk',
}
maps.n['<leader>grh'] = {
  function()
    require('gitsigns').reset_hunk()
  end,
  desc = 'Reset Git hunk',
}
maps.n['<leader>grb'] = {
  function()
    require('gitsigns').reset_buffer()
  end,
  desc = 'Reset Git buffer',
}
maps.n['<leader>gs'] = {
  function()
    require('gitsigns').stage_hunk()
  end,
  desc = 'Stage Git hunk',
}
maps.n['<leader>ga'] = {
  function()
    require('gitsigns').stage_buffer()
  end,
  desc = 'Stage Git buffer',
}
maps.n['<leader>gu'] = {
  function()
    require('gitsigns').undo_stage_hunk()
  end,
  desc = 'Unstage Git hunk',
}
maps.n['<leader>gd'] = {
  function()
    require('gitsigns').diffthis()
  end,
  desc = 'View Git diff',
}
utils.set_mappings(maps)
