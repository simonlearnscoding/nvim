return {
  'aznhe21/actions-preview.nvim',
  config = function()
    vim.keymap.set({ 'v', 'n' }, '<leader>lc', require('actions-preview').code_actions)
    vim.keymap.set({ 'v', 'n' }, '<leader>ca', require('actions-preview').code_actions)
    vim.keymap.set({ 'v', 'n' }, '<leader>ci', ':TSToolsAddMissingImports<CR>')


    vim.cmd [[
augroup AutoImport
  autocmd!
  autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx TSToolsAddMissingImports
augroup END
]]
  end,
}
