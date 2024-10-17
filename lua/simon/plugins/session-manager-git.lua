-- Lua

return {
  "olimorris/persisted.nvim",
  lazy = false, -- make sure the plugin is always loaded at startup
  config = function()
    require("persisted").setup({
      -- Automatically save session files
      autosave = true,
      -- Automatically restore session files
      autorestore = true,
      -- Automatically delete session files
      autodelete = true,
      -- Directory to store session files
      directory = vim.fn.stdpath("data") .. "/sessions",
      -- Include the current session file name in the window title?
      use_window_title = false,
      -- Include the git branch in the session file name?
      use_git_branch = true,
    })
    require("which-key").add({
      "<leader>s", "<cmd>Telescope persisted<CR>", desc = "󰊢 [s]ession manager"
    })
  end

}
