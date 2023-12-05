local my_custom_theme = require 'simon.plugins.startup-theme.startup-theme' -- Adjust the path as needed

return {


  {
    'ahmedkhalf/project.nvim',
    config = function(_, opts)
      require('project_nvim').setup(opts)
    end,
    opts = {
      ignore_lsp = { 'lua_ls' },
    },
  },
  -- SESSION MANAGER SETUP
  {
    'Shatur/neovim-session-manager',

    config = function()
      require('session_manager').setup {

        autoload_mode = require('session_manager.config').AutoloadMode.Disabled, --  Disabled, CurrentDir, LastSession
        vim.keymap.set({ 'n' }, '<leader>s', require('session_manager').load_session),

      }
    end
  },

  -- STARTUP WINDOW SETUP
  {
    "startup-nvim/startup.nvim",

    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim",

      'nvim-telescope/telescope-project.nvim',
    },

    config = function()
      local telescope = require 'telescope'
      -- Set up mappings for session manager
      require "startup".create_mappings({
        ["S"] = ":lua require('session_manager').load_session()<CR>",
        ["C"] = ":lua require('session_manager').load_current_dir_session()<CR>",
        ["L"] = ":lua require('session_manager').load_last_session()<CR>",

        ["N"] = ":lua require('startup').new_file()<CR>",
        ["O"] = ":lua require('telescope.builtin').oldfiles()<CR>",
        ["Q"] = ":q<CR>",

      })


      -- SETTING UP MY CUSTOM THEME
      require("startup").setup(

        my_custom_theme


      )
    end
  } }
