local wk = require("which-key")

wk.add({
  -- Group for 'file' related mappings
  { "<leader>f", group = "󰍉 [f]ind.." },

  -- Telescope mappings
  { "<leader>fn", "<cmd>Telekasten find_notes<cr>", desc = " [n]otes" },
  { "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "󰱑 [t]asks" },
  
  -- Git related mappings
  { "<leader>fg", desc = " [g]it.." },
  { "<leader>fgr", desc = " [r]eset.." },
  { "<leader>fgb", "<cmd>Telescope git_branches<CR>", desc = " [b]ranches" },
  { "<leader>fgc", "<cmd>Telescope git_commits<CR>", desc = " [c]ommits" },
  { "<leader>fgs", "<cmd>Telescope git_status<CR>", desc = " [s]tatus" },
  { "<leader>fgf", "<cmd>Telescope git_files<CR>", desc = " [f]iles" },

  -- Other mappings
  { "<leader>fd", "<cmd>lua require('telescope.builtin').diagnostics()<CR>", desc = " [d]iagnostics" },
  { "<leader>fl", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", desc = " [l]sp" },
  { "<leader>fw", "<cmd>lua require('telescope.builtin').live_grep()<CR>", desc = " [w]ord" },
  { "<leader>fo", function() require('telescope.builtin').oldfiles() end, desc = " [o]ld files" },
  { "<leader>ff", function() require('telescope.builtin').find_files() end, desc = " [f]iles" },
  { "<leader>fz", "<cmd>Telescope zoxide list<cr>", desc = " [z]oxide" },
  { "<leader>fb", "<cmd>Telescope bibtex<cr>", desc = " [b]ibliography" },
  { "<leader>fp", function() require('telescope').extensions.projects.projects {} end, desc = " [p]rojects" },

  -- Buffer management
  { "<leader><Tab>", "<cmd>Telescope buffers<cr>", desc = "Buffers", mode = "n" },
})
