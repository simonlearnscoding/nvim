local show_virtual_text = false -- Start with virtual text turned off

function ToggleDiagnosticsDisplay()
  show_virtual_text = not show_virtual_text
  vim.diagnostic.config({
    virtual_text = show_virtual_text,
    underline = true, -- Keeping the underline configuration here for consistency
  })
end

-- Keymap for toggling
vim.api.nvim_set_keymap('n', '<Leader>dt', ':lua ToggleDiagnosticsDisplay()<CR>', { noremap = true, silent = true })

-- Initial diagnostic configuration
vim.diagnostic.config({
  underline = true,
  virtual_text = show_virtual_text, -- Use the variable to keep the state in sync
})

-- Autocmd for CursorHold
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  callback = function()
    if not show_virtual_text then
      local diagnostics = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
      if #diagnostics > 0 then
        vim.diagnostic.open_float(nil, { scope = "line", focusable = false })
      end
    end
  end,
})
ToggleDiagnosticsDisplay()
return {}
