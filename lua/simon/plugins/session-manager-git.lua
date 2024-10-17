return {
  "olimorris/persisted.nvim",
  lazy = false, -- Make sure the plugin is always loaded at startup
  config = function()
    -- Persisted.nvim setup with autoload and Git branch support
    require('persisted').setup({
      autoload = true,                                                  -- Automatically load sessions
      use_git_branch = true,                                            -- Use Git branches in session names
      save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- Resolves to ~/.local/share/nvim/sessions/
    })

    -- Function to close non-session buffers before loading the new session
    local function close_non_session_buffers()
      -- Get all the open buffers
      local buffers = vim.api.nvim_list_bufs()

      -- Iterate over the buffers and delete them if they're not listed in the session
      for _, buf in ipairs(buffers) do
        -- Only delete loaded and listed buffers (not hidden or special buffers)
        if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, "buflisted") then
          vim.api.nvim_buf_delete(buf, { force = true }) -- Force close the buffer
        end
      end
    end

    -- Keybinding for opening the session manager using Telescope
    require("which-key").add({
      ["<leader>s"] = { "<cmd>Telescope persisted<CR>", desc = "󰊢 [s]ession manager" }
    })

    -- Function to change directory to the session's directory
    local function change_to_session_dir(session_path)
      local session_dir = vim.fn.fnamemodify(session_path, ":h")
      if session_dir and vim.fn.isdirectory(session_dir) == 1 then
        vim.cmd('cd ' .. session_dir)
        vim.notify("Changed directory to: " .. session_dir)
      else
        vim.notify("Failed to change directory. Directory not found.", vim.log.levels.ERROR)
      end
    end

    -- Function to get the current Git branch
    local function get_git_branch()
      local branch = vim.fn.system('git branch --show-current 2>/dev/null'):gsub('%s+', '')
      return branch ~= '' and branch or nil
    end

    -- Function to check if a session file exists for the current directory and branch
    local function session_exists_for_branch()
      local branch = get_git_branch()
      if not branch then return false end

      -- Construct the expected session file path
      local session_file = vim.fn.stdpath('data') .. '/sessions/' .. vim.fn.getcwd():gsub('/', '%%') .. '-' .. branch
      return vim.fn.filereadable(session_file) == 1
    end

    -- Variable to store the last known branch
    local last_branch = get_git_branch()
    -- Autocommand to check if a session exists when the Git branch changes
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        local current_branch = get_git_branch()
        local current_dir = vim.fn.getcwd()

        if current_branch and current_branch ~= last_branch then
          -- Check if a session exists for the current branch
          if session_exists_for_branch() then
            echo("Session exists  ")
          else
            echo("No session exists")
          end


          -- List files in the session directory using Lua functions
          local session_dir = vim.fn.stdpath('data') .. "/sessions/"
          local files = vim.fn.readdir(session_dir)

          -- Update the last known branch
          last_branch = current_branch
        end
      end,
    })

    -- Autocommand to handle session saving and echo a message when saved
    vim.api.nvim_create_autocmd("User", {
      pattern = "PersistedSavePost",
      callback = function()
        local session_path = vim.g.persisted_loaded_session
        if session_path then
          vim.cmd('echo "Session saved: ' .. session_path .. '"')
        end
      end
    })

    -- Autocommand to clear non-session buffers and change directory before loading the session
    vim.api.nvim_create_autocmd("User", {
      pattern = "PersistedTelescopeLoadPost",
      callback = function()
        -- Change to the session's directory
        local session_path = vim.g.persisted_loaded_session -- Get the current session path
        if session_path then
          change_to_session_dir(session_path)
        else
          vim.notify("No session loaded", vim.log.levels.WARN)
        end

        -- Clear non-session buffers before loading the new session
        vim.api.nvim_create_autocmd("User", {
          pattern = "PersistedTelescopeLoadPre",
          callback = function(session)
            -- Save the currently loaded session using the global variable
            require("persisted").save({ session = vim.g.persisted_loaded_session })

            -- Delete all of the open buffers
            vim.api.nvim_input("<ESC>:%bd!<CR>")
          end,
        })
      end
    })
  end
}
