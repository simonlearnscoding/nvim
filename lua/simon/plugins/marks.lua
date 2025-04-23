return {
  'LintaoAmons/bookmarks.nvim',
  event = 'UiEnter',
  dependencies = {
    { 'kkharji/sqlite.lua' },
    { 'nvim-telescope/telescope.nvim' },
    { 'stevearc/dressing.nvim' }, -- optional
  },
  config = function()
    local opts = {
      -- Directory to store the database file
      db_dir = nil, -- if nil, fallback to default `stdpath("data")`
      backup = {
        enabled = true,
        dir = nil, -- Custom backup directory; defaults to vim.fn.stdpath("data").."/bookmarks.backup"
        delay = 5, -- Delay in minutes before nvim is opened; no backup if nvim opens earlier than the scheduled backup time
      },

      -- Navigation configurations
      navigation = {
        next_prev_wraparound_same_file = true,
      },

      -- Bookmarks sign configurations with Catppuccin-inspired colors
      signs = {
        mark = {
          icon = "󰃁",
          color = "#C9CBFF",    -- Catppuccin mauve
          line_bg = "#3B4261",  -- Softer background for the sign
        },
        desc_format = function(bookmark)
          return bookmark.order .. ": " .. bookmark.name
        end,
      },

      -- Telescope/picker configurations
      picker = {
        sort_by = "last_visited",
        entry_display = nil,
      },

      -- Bookmark position calibration
      calibrate = {
        auto_calibrate_cur_buf = true,
        show_calibrate_logs = true,
      },

      -- Custom commands available in command picker
      commands = {
        mark_warning = function()
          vim.ui.input({ prompt = "[Warn Bookmark]" }, function(input)
            if input then
              local Service = require("bookmarks.domain.service")
              Service.toggle_mark("⚠ " .. input)
              require("bookmarks.sign").safe_refresh_signs()
            end
          end)
        end,
        create_project_list = function()
          local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
          local Service = require("bookmarks.domain.service")
          local new_list = Service.create_list(project_name)
          Service.set_active_list(new_list.id)
          require("bookmarks.sign").safe_refresh_signs()
        end,
      },

      -- Treeview configurations including keymap updates
      treeview = {
        render_bookmark = function(node)
          local icon = (node.description and #node.description > 0) and "●" or "○" -- Filled/Empty dot based on description presence
          local filename = require("bookmarks.domain.location").get_file_name(node.location)
          local name = node.name .. ": " .. filename
          if node.name == "" then
            name = "[Untitled]"
          end
          return icon .. " " .. name
        end,
        highlights = {
          active_list = {
            bg = "#2C323C",
            fg = "#ffffff",
            bold = true,
          },
        },
        active_list_icon = "󰮔 ",
        keymap = {
          quit = { "q", "<ESC>" },      -- Close the tree view window and return to the previous window
          refresh = "R",                -- Reload and redraw the tree view
          create_list = "a",            -- Create a new list under the current node
          level_up = "u",               -- Navigate up one level in the tree hierarchy
          set_root = ".",               -- Set current list as root of the tree view and as active list
          set_active = "m",             -- Set current list as the active list for bookmarks
          toggle = "o",                 -- Toggle list expansion or go to bookmark location
          move_up = "<localleader>k",   -- Move current node up in the list
          move_down = "<localleader>j", -- Move current node down in the list
          delete = "d",                 -- Remapped: now 'd' deletes the node
          rename = "r",                 -- Rename current node
          goto = { "g", "<CR>" },       -- 'goto' is now bound to both "g" and the Enter key (<CR>)
          cut = "x",                    -- Cut node
          copy = "c",                   -- Copy node
          paste = "p",                  -- Paste node
          show_info = "i",              -- Show node info
          reverse = "t",                -- Reverse the order of nodes in the tree view
          preview = "P",                -- Preview node
        },
        window_split_dimension = 30,    -- Dimension of the window spawned for Treeview
      },

      query = {
        keymap = {},
      },
    }

    require('bookmarks').setup(opts)
    vim.keymap.set('n', '<leader>m', ':BookmarksMark<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>tm', ':BookmarksTree<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>fm', ':BookmarksGoto<CR>', { noremap = true, silent = true })
  end,
}
