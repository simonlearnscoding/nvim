return {
  commit = 'b552ee8', -- Pinning to the specific commit
  'Shatur/neovim-session-manager',
  config = function()
    local session_manager = require 'session_manager'
    local config = require 'session_manager.config'

    session_manager.setup {
      autoload_mode = config.AutoloadMode.CurrentDir, -- Disabled, CurrentDir, LastSession
    }

    -- Safely set up key mappings to avoid conflicts
    local set_keymap = vim.keymap.set
    local function safe_load_session()
      local status_ok, err = pcall(session_manager.load_session)
      if not status_ok then
        vim.notify('Failed to load session: ' .. err, vim.log.levels.ERROR)
      end
    end

    -- Set keymap with safety check
    set_keymap('n', '<leader>s', safe_load_session, { desc = 'Load Session' })
  end,
}
