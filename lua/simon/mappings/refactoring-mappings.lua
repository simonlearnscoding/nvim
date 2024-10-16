local wk = require("which-key")

-- Define the Refactoring-related mappings using which-key
wk.add({
  -- Refactor group
  { "<leader>r", group = " [r]efactor..." },

  -- Individual Refactor commands
  { "<leader>rr", ":IncRename ", desc = "Smart rename" },
  { "<leader>re", ":Refactor extract<CR>", desc = "Refactor Extract", mode = "v" },
  { "<leader>rf", ":Refactor extract_to_file<CR>", desc = "Refactor Extract to File", mode = "v" },
  { "<leader>rv", ":Refactor extract_variable<CR>", desc = "Refactor Extract Variable", mode = "v" },
})

-- Apply the mappings
