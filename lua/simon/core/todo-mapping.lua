local utils = require 'simon.utils'
local wk = require 'which-key'

-- Using wk.add to define the key mappings
wk.add { ']T', '<cmd>lua require("todo-comments").jump_next()<cr>', group = 'Todo Comments', desc = 'Next todo comment' }
wk.add { '[T', '<cmd>lua require("todo-comments").jump_prev()<cr>', group = 'Todo Comments', desc = 'Previous todo comment' }

wk.add { '<leader>tb', '<cmd>TodoTelescope keywords=FIX<cr>', group = 'Todo Comments', desc = 'Todo Marked Bugs' }
wk.add { '<leader>tt', '<cmd>TodoTelescope keywords=NOW,TODO,LATER<cr>', group = 'Todo Comments', desc = 'NOW | TODO | LATER' }
wk.add { '<leader>tr', '<cmd>TodoTelescope keywords=REFACTOR<cr>', group = 'Todo Comments', desc = 'Todo Refactors' }
