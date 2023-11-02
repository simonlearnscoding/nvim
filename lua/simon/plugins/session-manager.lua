return {
  'Shatur/neovim-session-manager',
  config = function()
    require('session_manager').setup {

      autoload_mode = 'Disabled',
    }
    vim.keymap.set({ 'n' }, '<leader>Ss', require('session_manager').load_session)
    vim.keymap.set({ 'n' }, '<leader>fS', require('session_manager').load_session)
    vim.keymap.set({ 'n' }, '<leader>Sd', require('session_manager').delete_session)
    vim.keymap.set({ 'n' }, '<leader>fD', require('session_manager').delete_session)
    vim.keymap.set({ 'n' }, '<leader>Sl', require('session_manager').load_last_session)
  end,
}
