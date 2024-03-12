local utils = require 'simon.utils'
local maps = { i = {}, n = {}, v = {}, t = {} }

maps.n[']T'] = {
  function()
    require('todo-comments').jump_next()
  end,
  { desc = 'Next todo comment' },
}
maps.n['[T'] = {
  function()
    require('todo-comments').jump_prev()
  end,
  { desc = 'Previous todo comment' },
}


utils.set_mappings(maps)
