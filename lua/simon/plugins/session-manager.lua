-- SESSION MANAGER SETUP
return {
  'Shatur/neovim-session-manager',

  config = function()
    require('session_manager').setup {
      autoload_mode = require('session_manager.config').AutoloadMode.Disabled, --  Disabled, CurrentDir, LastSession
      vim.keymap.set({ 'n' }, '<leader>s', require('session_manager').load_session),

    }
  end
}
