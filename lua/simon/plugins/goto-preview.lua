-- TODO: remove keybinds on leave
return {
  'rmagatti/goto-preview',
  config = function()
    require('goto-preview').setup {

      default_mappings = false,
      post_open_hook = function(bufnr)
        vim.cmd 'setlocal winblend=10'
        vim.keymap.set('n', '<Esc>', '<cmd>q<CR>', { buffer = bufnr, silent = true })
        vim.keymap.set('n', 'q', '<cmd>q<CR>', { buffer = bufnr, silent = true })
        -- Custom keybinding to open the buffer of the preview window in the last open pane and close the preview window
        vim.keymap.set('n', '<CR>', '<C-w>L', { silent = true })
      end,
    }

    vim.keymap.set('n', 'gr', "<cmd>lua require('goto-preview').goto_preview_references()<CR>")
  end,
}
