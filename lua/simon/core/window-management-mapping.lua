--          ╭─────────────────────────────────────────────────────────╮
--          │                      Smart Splits                       │
--          ╰─────────────────────────────────────────────────────────╯
--
if is_available 'smart-splits.nvim' then
  maps.n['<C-h>'] = {
    function()
      require('smart-splits').move_cursor_left()
    end,
    desc = 'Move to left split',
  }
  maps.n['<C-j>'] = {
    function()
      require('smart-splits').move_cursor_down()
    end,
    desc = 'Move to below split',
  }
  maps.n['<C-k>'] = {
    function()
      require('smart-splits').move_cursor_up()
    end,
    desc = 'Move to above split',
  }
  maps.n['<C-l>'] = {
    function()
      require('smart-splits').move_cursor_right()
    end,
    desc = 'Move to right split',
  }
  maps.n['<C-Up>'] = {
    function()
      require('smart-splits').resize_up()
    end,
    desc = 'Resize split up',
  }
  maps.n['<C-Down>'] = {
    function()
      require('smart-splits').resize_down()
    end,
    desc = 'Resize split down',
  }
  maps.n['<C-Left>'] = {
    function()
      require('smart-splits').resize_left()
    end,
    desc = 'Resize split left',
  }
  maps.n['<C-Right>'] = {
    function()
      require('smart-splits').resize_right()
    end,
    desc = 'Resize split right',
  }
else
  maps.n['<C-h>'] = { '<C-w>h', desc = 'Move to left split' }
  maps.n['<C-j>'] = { '<C-w>j', desc = 'Move to below split' }
  maps.n['<C-k>'] = { '<C-w>k', desc = 'Move to above split' }
  maps.n['<C-l>'] = { '<C-w>l', desc = 'Move to right split' }
  maps.n['<C-Up>'] = { '<cmd>resize -2<CR>', desc = 'Resize split up' }
  maps.n['<C-Down>'] = { '<cmd>resize +2<CR>', desc = 'Resize split down' }
  maps.n['<C-Left>'] = { '<cmd>vertical resize -2<CR>', desc = 'Resize split left' }
  maps.n['<C-Right>'] = { '<cmd>vertical resize +2<CR>', desc = 'Resize split right' }
end

maps.n['<M-h>'] = { '<Left>', noremap = false, desc = 'Left' }
maps.n['<M-j>'] = { '<Down>', noremap = false, desc = 'Down' }
maps.n['<M-k>'] = { '<Up>', noremap = false, desc = 'Up' }
maps.n['<M-l>'] = { '<Right>', noremap = false, desc = 'Right' }
