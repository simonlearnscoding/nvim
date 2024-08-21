local wk = require("which-key")

-- Buffers management group
wk.add({
  { "<leader>b", group = "󰓩 Buffers" },

  { "<leader>bp", "<cmd>:BufferLinePick<cr>", desc = "[p]ick" },
  { "<leader>bc", "<cmd>:BufferLinePickClose<cr>", desc = "[c]lose" },
  { "<leader>bl", "<cmd>:BufferLineCloseRight<cr>", desc = "Close Right" },
  { "<leader>bh", "<cmd>:BufferLineCloseLeft<cr>", desc = "Close Left" },
  { "<leader>ba", "<cmd>:BufferLineCloseOthers<cr>", desc = "Close Others" },
})

-- Other key mappings group
wk.add({
  { "<leader>N", "<cmd>tabnew<cr>", desc = "[N]ew Tab" },
  { "<leader>M", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
  { "<leader>x", ":bprevious | bdelete #<CR>", desc = "󰅖 Close Buffer" },
  { "<leader>.", "<cmd>cd %:p:h<cr>", desc = "Set cwd" },
  { "<leader>q", "<cmd>update<cr><cmd>q<cr>", desc = "Save and Quit" },
})

-- Debugger group
wk.add({
  { "<leader>d", group = " Debugger" },
})

-- Vimwiki group
wk.add({
  { "<leader>w", group = "󰍉  vimwiki" },
})

-- UI group
wk.add({
  { "<leader>u", group = " [u]I" },
})

-- Sessions group
wk.add({
  { "<leader>S", group = "󱂬 Session" },
})

-- Terminal group
wk.add({
  { "<leader>t", group = " Terminal" },
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

