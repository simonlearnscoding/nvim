local wk = require("which-key")

-- Define the sections for key mappings
local sections = {
  u = { desc = ' [u]I' },
  b = { desc = '󰓩 Buffers' },
  bs = { desc = '󰒺 Sort Buffers' },
  d = { desc = ' Debugger' },
  w = { desc = '󰍉  vimwiki' },
  S = { desc = '󱂬 Session' },
  t = { desc = ' Terminal' },
}

-- Set up key mappings using which-key
wk.add({
  ['<leader>'] = {
    -- Buffers management
    b = {
      name = sections.b.desc,
      p = { '<cmd>:BufferLinePick<cr>', '[p]ick' },
      c = { '<cmd>:BufferLinePickClose<cr>', '[c]lose' },
      l = { '<cmd>:BufferLineCloseRight<cr>', 'Close Right' },
      h = { '<cmd>:BufferLineCloseLeft<cr>', 'Close Left' },
      a = { '<cmd>:BufferLineCloseOthers<cr>', 'Close Others' },
    },

    -- Other key mappings
    N = { '<cmd>tabnew<cr>', '[N]ew Tab' },
    M = { '<cmd>ZenMode<cr>', 'Zen Mode' },
    x = { ':bprevious | bdelete #<CR>', '󰅖 Close Buffer' },
    ['.'] = { '<cmd>cd %:p:h<cr>', 'Set cwd' },
    q = { '<cmd>update<cr><cmd>q<cr>', 'Save and Quit' },
  },
  -- Debugger
  d = sections.d,
  -- Vimwiki
  w = sections.w,
  -- UI
  u = sections.u,
  -- Sessions
  S = sections.S,
  -- Terminal
  t = sections.t,
})

-- General key mappings outside of which-key
vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', { noremap = true, silent = true })
vim.keymap.set('v', '<Tab>', '<cmd>BufferLineCycleNext<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', { noremap = true, silent = true })
vim.keymap.set('v', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'cw', 'ciw', { noremap = true, silent = true, desc = 'Change inside word' })
vim.api.nvim_set_keymap('n', 'dw', 'diw', { noremap = true, silent = true, desc = 'Delete inside word' })

-- Disable space in normal and visual mode
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Make j and k more intuitive
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = 'Move cursor down' })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = 'Move cursor up' })

-- Buffer navigation
vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<cr>', { silent = true, desc = 'Next Buffer' })
vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<cr>', { silent = true, desc = 'Previous Buffer' })
vim.keymap.set('n', '[b', '<cmd>bprevious<cr>', { silent = true, desc = 'Previous Buffer' })
vim.keymap.set('n', ']b', '<cmd>bnext<cr>', { silent = true, desc = 'Next Buffer' })

-- Tab navigation
vim.keymap.set('n', ']t', function() vim.cmd.tabnext() end, { silent = true, desc = 'Next Tab' })
vim.keymap.set('n', '[t', function() vim.cmd.tabprevious() end, { silent = true, desc = 'Previous Tab' })

-- Splits
vim.keymap.set('n', '|', '<cmd>vsplit<cr>', { silent = true, desc = 'Vertical Split' })
vim.keymap.set('n', '\\', '<cmd>split<cr>', { silent = true, desc = 'Horizontal Split' })

-- Move lines
vim.keymap.set('n', '<A-j>', '<cmd>m .+1<cr>==', { silent = true, desc = 'Move down' })
vim.keymap.set('n', '<A-k>', '<cmd>m .-2<cr>==', { silent = true, desc = 'Move up' })
vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { silent = true, desc = 'Move down' })
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { silent = true, desc = 'Move up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<cr>gv=gv", { silent = true, desc = 'Move down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<cr>gv=gv", { silent = true, desc = 'Move up' })

