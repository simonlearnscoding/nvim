local wk = require("which-key")

-- Define the Todo-related mappings using which-key
wk.add({
  -- Navigation for todo comments
  { "]T", '<cmd>lua require("todo-comments").jump_next()<cr>', desc = "Next todo comment" },
  { "[T", '<cmd>lua require("todo-comments").jump_prev()<cr>', desc = "Previous todo comment" },

  -- Todo Telescope commands
  { "<leader>tb", '<cmd>TodoTelescope keywords=FIX<cr>', desc = "Todo Marked Bugs" },
  { "<leader>tt", '<cmd>TodoTelescope keywords=NOW,TODO,LATER<cr>', desc = "NOW | TODO | LATER" },
  { "<leader>tr", '<cmd>TodoTelescope keywords=REFACTOR<cr>', desc = "Todo Refactors" },
})

