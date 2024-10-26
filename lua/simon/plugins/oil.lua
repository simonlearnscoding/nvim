-- TODO: this will open oil in a ssh buffer
-- nvim oil-ssh://[username@]hostname[:port]/[path]
return {
  'stevearc/oil.nvim',
  event = 'BufRead',
  opts = {},
  tag = 'v2.8.0',
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons', 's1n7ax/nvim-window-picker' },

  config = function()
    local function goToWindow()
      -- Call the window-picker function and get the window ID
      local win_id = require('window-picker').pick_window { hint = 'floating-big-letter' }

      -- Check if a valid window ID was returned
      if win_id and vim.api.nvim_win_is_valid(win_id) then
        -- Get the current line number
        local current_line = vim.fn.line '.'

        -- Set the current window to the one selected
        vim.api.nvim_set_current_win(win_id)

        -- Print current line number
        print('Current line number:', current_line)

        -- Open Oil.nvim in a floating window
        require('oil').toggle_float()

        -- Go to the specified line in Oil.nvim buffer
        vim.fn.execute('call cursor(' .. current_line .. ', 1)')

        -- Open the file by pressing <CR>
        require('oil').select()
      else
        print 'Invalid window ID'
      end
    end

    -- Bind the function to a key combination of your choice
    require('oil').setup {
      delete_to_trash = false,
      skip_confirm_for_simple_edits = true,
      show_hidden = true,

      -- Custom function to handle buffer closing
      -- on_file_delete = function()
      --   local bufnr = vim.api.nvim_get_current_buf()
      --   vim.api.nvim_buf_delete(bufnr, { force = true })
      -- end,

      lsp_file_methods = {
        -- Time to wait for LSP file operations to complete before skipping
        timeout_ms = 2500,
        -- Set to true to autosave buffers that are updated with LSP willRenameFiles
        -- Set to "unmodified" to only save unmodified buffers
        autosave_changes = true,
      },
      preview = {
        max_width = 0.4,
      },
      -- cleanup_delay_ms = 3000,
      float = {
        max_width = 40,

        max_height = 40,
        border = 'rounded',
        -- padding = 10,
        win_options = {
          winblend = 30,
        },
        progress = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = { 10, 0.9 },
          min_height = { 5, 0.1 },
          height = nil,
          border = 'rounded',
          minimized_border = 'none',
          win_options = {
            winblend = 0,
          },
        },
        lsp_file_methods = {
          -- Enable or disable LSP file operations
          enabled = true,
          -- Time to wait for LSP file operations to complete before skipping
          timeout_ms = 2000,
          -- Set to true to autosave buffers that are updated with LSP willRenameFiles
          -- Set to "unmodified" to only save unmodified buffers
          autosave_changes = true,
        },
        override = function(conf)
          -- Set the position of the floating window
          conf.row = 3 -- Change the row (vertical position)
          conf.col = 8 -- Change the column (horizontal position)
          return conf
        end,
      },
      keymaps = {
        ['<C-c>'] = 'actions.close',
        ['q'] = 'actions.close',
        ['w'] = goToWindow,
        ['<BS>'] = 'actions.parent',
        ['|'] = 'actions.select_vsplit',
        ['s'] = 'actions.select_vsplit',
        ['\\'] = 'actions.select_split',
      },
    }
    -- vim.keymap.set("n", "<leader>to", require('oil').toggle_float)
    vim.keymap.set('n', '<leader>e', require('oil').toggle_float)
  end,
}
