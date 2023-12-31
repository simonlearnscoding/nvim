require 'simon.core.options'
require 'simon.plugins-setup'
require 'simon.core.keymaps'


-- local current_dir = vim.fn.getcwd()
-- vim.api.nvim_set_current_dir(current_dir)
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
vim.keymap.set("n", "<leader>/", ":CommentToggle<CR>")

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

  vim.g.neovide_transparency = 0.95
  vim.g.neovide_cursor_vfx_mode = "wireframe"
end
