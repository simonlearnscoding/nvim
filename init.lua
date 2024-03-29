--
--          ╭─────────────────────────────────────────────────────────╮
--          │                    IMPORTING KEYMAPS                    │
--          ╰─────────────────────────────────────────────────────────╯
--
require 'simon.core.options'
require 'simon.plugins-setup'
require 'simon.core.keymaps'
require 'simon.core.window-management-mapping'
require 'simon.core.telescope-mappings'
require 'simon.core.neotest-mappings'
require 'simon.core.lsp-mappings'
require 'simon.core.git-mappings'
require 'simon.core.nvim-ufo-mapping'
require 'simon.core.nvim-ufo-mapping'


-- vim.cmd 'colorscheme sonokai'
vim.cmd 'colorscheme kanagawa'
-- vim.cmd 'colorscheme rose-pine'
-- vim.cmd 'colorscheme gruvbox'
-- vim.cmd 'colorscheme catppuccin'
-- vim.cmd 'colorscheme miramare'
-- vim.cmd 'colorscheme nightfox'
-- vim.cmd 'colorscheme gruvbox-material'
-- vim.cmd 'colorscheme tokyonight'
-- vim.cmd 'colorscheme everforest'

-- I have to set this last because something else sets
-- it too and I dont know what it is
-- vim.keymap.set("n", "<leader>/", ":CommentToggle<CR>")
--
--
--

if vim.g.neovide then
  -- vim.g.neovide_transparency = 0.95
  vim.g.neovide_input_macos_alt_is_meta = true
  vim.o.guifont = 'JetBrains Mono:h11'
  vim.cmd [[set guifont=MonoLisa:10,Symbols\ Nerd\ Font:h10]]

  -- Insert mode mappings for Alt + H and Alt + K
  vim.api.nvim_set_keymap('i', '<A-h>', '<Left>', { noremap = true, silent = true })
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 20
  vim.g.light_radius = 8
  vim.api.nvim_set_keymap('i', '<A-l>', '<Right>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>Q', '<cmd>wqa<cr>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<M-j>', ':m .+1<CR>==', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<M-k>', ':m .-2<CR>==', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '<M-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '<M-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<M-l>', '>>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<M-h>', '<<', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '<M-l>', ">>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '<M-h>', "<<", { noremap = true, silent = true })
  vim.g.neovide_transparency = 0.97
  vim.g.neovide_cursor_vfx_mode = "wireframe"
end



local auto_read_group = vim.api.nvim_create_augroup("AutoRead", { clear = true })
vim.api.nvim_create_autocmd(
  { "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" },
  {
    group = auto_read_group,
    pattern = "*",
    command = "checktime"
  }
)

vim.opt.confirm = true
vim.api.nvim_create_autocmd(
  "FileChangedShellPost",
  {
    group = auto_read_group,
    pattern = "*",
    callback = function()
      vim.cmd("echohl WarningMsg")
      print("File changed on disk. Buffer reloaded.")
      vim.cmd("echohl None")
      vim.cmd("edit")
    end
  }
)

-- DAP BREAKPOINTS
vim.cmd('highlight DapBreakpoint ctermbg=0 guifg=#993939 guibg=#31353f')
vim.cmd('highlight DapLogPoint ctermbg=0 guifg=#61afef guibg=#31353f')
vim.cmd('highlight DapStopped ctermbg=0 guifg=#98c379 guibg=#31353f')
vim.fn.sign_define('DapBreakpoint',
  { text = "", texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition',
  { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected',
  { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })

vim.g.dashboard_default_executive = 'telescope'
-- vim.cmd("Dashboard")

-- LSP inlay hints // not working yet
-- vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
--   callback = function() vim.lsp.buf.inlay_hint(0, true) end,
-- })
-- vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
--   callback = function() vim.lsp.buf.inlay_hint(0, false) end,
-- })
--
