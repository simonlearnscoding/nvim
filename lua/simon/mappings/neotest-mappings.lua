local wk = require("which-key")

-- Define the Toggle-related mappings using which-key
wk.add({
  -- Toggle group
  { "<leader>t", group = "Toggle.." },

  -- Individual Toggle commands
  { "<leader>tn", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "...neotest" },
})
