return {
  'aznhe21/actions-preview.nvim',
  event = 'VeryLazy',
  config = function()
    vim.keymap.set({ 'v', 'n' }, '<leader>ca', require('actions-preview').code_actions, { desc = 'Code Actions' })
    -- vim.keymap.set({ 'v', 'n' }, '<leader>ci', ':TSToolsAddMissingImports<CR>')

    require('actions-preview').setup {
      -- options for vim.diff(): https://neovim.io/doc/user/lua.html#vim.diff()
      backend = { 'nui' },
      diff = {
        ctxlen = 16,
      },
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

      -- options for nui.nvim components
      nui = {
        -- component direction. "col" or "row"
        dir = 'row',
        -- keymap for selection component: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/menu#keymap
        keymap = nil,
        -- options for nui Layout component: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/layout
        layout = {
          position = '50%',
          size = {
            width = '60%',
            height = '60%',
          },
          min_width = 40,
          min_height = 10,
          relative = 'editor',
        },
        -- options for preview area: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup
        preview = {
          size = '60%',
          border = {
            style = 'rounded',
            padding = { 0, 1 },
          },
        },
        -- options for selection area: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/menu
        select = {
          size = '40%',
          border = {
            style = 'rounded',
            padding = { 0, 1 },
          },
        },
      },
    }
  end,
}
