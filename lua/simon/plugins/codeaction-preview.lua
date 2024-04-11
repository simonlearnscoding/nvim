return {
  'aznhe21/actions-preview.nvim',
  config = function()
    vim.keymap.set({ 'v', 'n' }, '<leader>fc', require('actions-preview').code_actions)
    vim.keymap.set({ 'v', 'n' }, '<leader>ca', require('actions-preview').code_actions)
    vim.keymap.set({ 'v', 'n' }, '<leader>ci', ':TSToolsAddMissingImports<CR>')

    require('actions-preview').setup {
      -- options for vim.diff(): https://neovim.io/doc/user/lua.html#vim.diff()
      backend = { 'telescope', 'nui' },

      -- options related to telescope.nvim
      telescope = vim.tbl_extend(
        'force',
        -- telescope theme: https://github.com/nvim-telescope/telescope.nvim#themes
        require('telescope.themes').get_dropdown(),
        -- a table for customizing content
        {
          -- a function to make a table containing the values to be displayed.
          -- fun(action: Action): { title: string, client_name: string|nil }
          make_value = nil,

          -- a function to make a function to be used in `display` of a entry.
          -- see also `:h telescope.make_entry` and `:h telescope.pickers.entry_display`.
          -- fun(values: { index: integer, action: Action, title: string, client_name: string }[]): function
          make_make_display = nil,
        }
      ),
    }
    --
    --     vim.cmd [[
    -- augroup AutoImport
    --   autocmd!
    --   autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx TSToolsAddMissingImports
    -- augroup END
    -- ]]
  end,
}
