local wk = require("which-key")

-- Define the Git-related mappings using which-key
wk.add({
  -- Git group
  { "<leader>g", group = "󰊢 [g]it" },

  -- Individual Git commands
  { "<leader>gc", "<cmd>Git commit<CR>", desc = "󰊢 [c]ommit" },
  { "<leader>gb", function() require('gitsigns').blame_line() end, desc = "󰊢 [b]lame" },
  { "<leader>gP", "<cmd>Git push<CR>", desc = "󰊢 [p]ush" },
  { "<leader>gv", function() require('gitsigns').preview_hunk() end, desc = "󰊢 [v]iew hunk" },
  { "<leader>grh", function() require('gitsigns').reset_hunk() end, desc = "󰊢 [r]eset [h]unk" },
  { "<leader>grb", function() require('gitsigns').reset_buffer() end, desc = "󰊢 [r]eset [b]uffer" },
  { "<leader>gh", function() require('gitsigns').stage_hunk() end, desc = "󰊢 [h]unk stage" },
  { "<leader>ga", function() require('gitsigns').stage_buffer() end, desc = "󰊢 stage buffer" },
  { "<leader>gu", function() require('gitsigns').undo_stage_hunk() end, desc = "󰊢 [u]nstage hunk" },
  -- { "<leader>gd", function() require('gitsigns').diffthis() end, desc = "󰊢 [d]iff" },
  { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "󰊢 [d]iffview open" },

  -- Git hunk navigation mappings
  { "]g", function() require('gitsigns').next_hunk(); require('gitsigns').preview_hunk() end, desc = "Next Git hunk" },
  { "[g", function() require('gitsigns').prev_hunk(); require('gitsigns').preview_hunk() end, desc = "Previous Git hunk" },
})

