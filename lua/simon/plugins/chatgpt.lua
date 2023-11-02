-- Lazy
return {
  'jackMort/ChatGPT.nvim',
  event = 'VeryLazy',
  config = function()
    vim.keymap.set({ 'n' }, '<leader>cg', '<cmd>:ChatGPT<CR>')
    vim.keymap.set({ 'n' }, '<leader>ce', '<cmd>:ChatGPTEditWithInstructions<CR>')
    vim.keymap.set({ 'n' }, '<leader>cr', '<cmd>:ChatGPTActAs<CR>')

    require('chatgpt').setup {
      api_key_cmd = 'gpg --decrypt /home/simon/secret.txt.gpg',
      popup_input = {

        submit = '<CR>',
      },
    }
  end,
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
}
