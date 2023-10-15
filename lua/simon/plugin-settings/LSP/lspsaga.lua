-- import lspsaga safely
local lspsaga = require("lspsaga")
lspsaga.setup({
  -- move_in_saga = { prev = "C-k", next = "C-j"},
  finder_action_keys = { open = "<CR>", scroll_down = "<C-f>", scroll_up = "<C-b>" },
  finder_action_keys = {
    open = "<CR>",
  },
})
