return {
  'Shatur/neovim-session-manager',

  config = function()
    require('session_manager').setup {

      autoload_mode = require('session_manager.config').AutoloadMode.Disabled, --  Disabled, CurrentDir, LastSession
      vim.keymap.set({ 'n' }, '<leader>Ss', require('session_manager').load_session),
      vim.keymap.set({ 'n' }, '<leader>fS', require('session_manager').load_session),
      vim.keymap.set({ 'n' }, '<leader>Sd', require('session_manager').delete_session),
      vim.keymap.set({ 'n' }, '<leader>fD', require('session_manager').delete_session),
      vim.keymap.set({ 'n' }, '<leader>Sl', require('session_manager').load_last_session),
      vim.keymap.set({ 'n' }, '<leader>Sc', require('session_manager').load_current_dir_session),

    }
    local function run_command_if_not_home()
      local cwd = vim.fn.getcwd()
      local home = vim.fn.expand('~') -- Expands to the user's home directory

      if cwd ~= home then
        -- Replace 'your_command_here' with the command you want to run
        -- vim.cmd('your_command_here')
        require('session_manager').load_current_dir_session()
      end
    end
    run_command_if_not_home()
  end
}
