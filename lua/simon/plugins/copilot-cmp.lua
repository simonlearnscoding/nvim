return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {

      suggestion = {
        auto_trigger = true,
        enabled = true,
        keymap = {

          accept = '<C-s>',
          accept_word = false,
          accept_line = false,
          next = '<C-.>',
          prev = '<C-,>',
          -- dismiss = '<C/>',
          --dismiss = false,
        },
      },
    }
  end,
}

-- Path: .config/nvim/lua/simon/plugins/cmp.lua
