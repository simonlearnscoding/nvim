return {

  'gbprod/yanky.nvim',
  event = 'VeryLazy',
  config = function()
    require('yanky').setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      highlight = {
        on_put = false,
        on_yank = true,
        timer = 100,
      },
    }
    -- vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)')
    -- vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)')
    vim.keymap.set('n', '<c-p>', '<Plug>(YankyCycleForward)')
    vim.keymap.set('n', '<c-n>', '<Plug>(YankyCycleBackward)')


    local hint = [[


    _p_ = cycle back
    _P_ = cycle forward
    ]]

    local Hydra = require('hydra')
    local dap_hydra = Hydra({
      -- hint = hint,
      config = {
        timeout = 2000,
        on_enter = function()
          -- The third argument is the mode: 'n' for normal, 't' for special characters to be interpreted as-is
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Plug>(YankyPutAfter)', true, false, true), 'n', true)
        end,
        invoke_on_body = true,
        hint = {
          position = 'middle-right',
          border = 'rounded'
        },
      },


      name = 'yanky',
      mode = { 'n', 'x' },
      body = 'p',
      heads = {
        { 'p', '<Plug>(YankyCycleForward)',  { silent = true } },
        { 'P', '<Plug>(YankyCycleBackward)', { silent = true } },
      }
    })
  end,
}
