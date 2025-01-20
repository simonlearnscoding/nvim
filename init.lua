--
package.path = package.path .. ';' .. vim.fn.expand '$HOME' .. '/.luarocks/share/lua/5.1/?/init.lua;'
package.path = package.path .. ';' .. vim.fn.expand '$HOME' .. '/.luarocks/share/lua/5.1/?.lua;'
--          ╭─────────────────────────────────────────────────────────╮
--          │                    IMPORTING KEYMAPS                    │
--          ╰─────────────────────────────────────────────────────────╯
-- require 'simon.core.env'
require 'simon.core.options'
require 'simon.plugins-setup'

vim.cmd 'cnoreabbrev w silent w'
require 'simon.mappings.keymaps'
require 'simon.mappings.window-management-mapping'
require 'simon.mappings.neotest-mappings'
-- require 'simon.mappings.lsp-mappings'
require 'simon.mappings.git-mappings'
require 'simon.mappings.nvim-ufo-mapping'
require 'simon.mappings.telescope-mappings'
require 'simon.mappings.obsidian-mapping'
require 'simon.mappings.todo-mapping'
-- require 'simon.core.todokanban'

vim.g.sqlite_clib_path = '/nix/store/220jcypl4rj05ffv1c074lf244av622g-sqlite-3.46.1/lib/libsqlite3.so'
vim.opt.guifont = { 'JetBrainsMono Nerd Font', ':h12' }

if vim.g.neovide then
  vim.g.neovide_transparency = 0.97
  vim.g.neovide_input_macos_alt_is_meta = true
  -- vim.cmd [[set guifont=MonoLisa:10,Symbols\ Nerd\ Font:h10]]

  -- Insert mode mappings for Alt + H and Alt + K
  -- TODO: this should also cound if its not in neovide
  -- TODO: can I turn off cmp when I am writing a comment?
  -- Insert mode mappings for Alt + H and Alt + L
  vim.api.nvim_set_keymap('i', '<A-h>', '<Left>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('i', '<A-l>', '<Right>', { noremap = true, silent = true })

  -- Normal mode mappings
  vim.api.nvim_set_keymap('n', '<leader>Q', '<cmd>wqa<cr>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<M-j>', ':m .+1<CR>==', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<M-k>', ':m .-2<CR>==', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<M-l>', '>>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<M-h>', '<<', { noremap = true, silent = true })

  -- Visual mode mappings
  vim.api.nvim_set_keymap('v', '<M-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '<M-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '<M-l>', '>>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '<M-h>', '<<', { noremap = true, silent = true })

  -- Neovide specific settings
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_cursor_smooth_blink = true
  vim.g.neovide_floating_z_height = 8
  vim.g.light_radius = 6
  -- vim.g.neovide_transparency = 0.95
  vim.g.neovide_cursor_vfx_mode = 'wireframe'
  -- vim.g.neovide_cursor_vfx_mode = 'railgun'
  --
end

local auto_read_group = vim.api.nvim_create_augroup('AutoRead', { clear = true })
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  group = auto_read_group,
  pattern = '*',
  command = 'checktime',
})
-- LATER: what does this one do?
vim.opt.confirm = true
vim.api.nvim_create_autocmd('FileChangedShellPost', {
  group = auto_read_group,
  pattern = '*',
  callback = function()
    vim.cmd 'edit'
  end,
})

-- vim.cmd 'hi Normal guibg=NONE ctermbg=NONE'
-- vim.cmd 'hi NormalNC guibg=NONE ctermbg=NONE'
-- DAP BREAKPOINTS
vim.cmd 'highlight DapBreakpoint ctermbg=0 guifg=#993939 guibg=#31353f'
vim.cmd 'highlight DapLogPoint ctermbg=0 guifg=#61afef guibg=#31353f'
vim.cmd 'highlight DapStopped ctermbg=0 guifg=#98c379 guibg=#31353f'
vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
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
-- Example for configuring Neovim to load user-installed installed Lua rocks:
--
vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('TS_add_missing_imports', { clear = true }),
  desc = 'TS_add_missing_imports',
  pattern = { '*.ts', '*.tsx', '*.jsx', '*.js' },
  callback = function()
    vim.lsp.buf.code_action {
      apply = true,
      context = {
        only = { 'source.addMissingImports.ts' },
      },
    }
  end,
})

--

vim.cmd [[
hi Normal guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE
]]

-- init.lua
vim.cmd [[
augroup suppress_md_errors
    autocmd!
    autocmd BufWritePre *.md silent! execute "silent! call v:lua.SuppressErrors()"
    autocmd BufWritePost *.md silent! execute "silent! call v:lua.SuppressErrors()"
augroup END
]]

-- Flutter wrapper for hot-reloading
-- Put this in your plugin directory (Default is $HOME/.config/nvim/lua/plugin/flutter.lua)
--
--
-- local function flutter_hot_reload()
--   vim.fn.system 'kill -s USR1 "$(pgrep -f flutter_tools.snapshot\\ run)" &> /dev/null'
-- end
--
-- -- Autocommand for hot-reloading on save
-- vim.api.nvim_create_autocmd('BufWritePost', {
--   pattern = '*/lib/*.dart',
--   callback = flutter_hot_reload,
-- })
-- Function to suppress errors
function _G.SuppressErrors()
  -- You can leave this function empty or add specific error handling logic if needed
end

local cmp = require 'cmp'

function AcceptFirstCmdlineCompletion()
  if vim.fn.pumvisible() == 1 then
    cmp.confirm { select = true }
    return ''
  else
    return '<C-f>'
  end
end

vim.api.nvim_set_keymap('c', '<C-f>', 'v:lua.AcceptFirstCmdlineCompletion()', { expr = true, noremap = true })
