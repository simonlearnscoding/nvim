-- LOAD FILES IN CONF
-- local config_dir = vim.fn.stdpath('config') .. '/conf.d/*.lua'
-- Run the Vimscript command to source all Lua files
-- vim.cmd('for luafile in glob("'..config_dir..'", v:true, v:true) | execute "luafile " . luafile | endfor')

-- require('config.d.setup')
-- require('essential')
-- require('config_files.lazy_setup')
-- require('plugins.init')

require 'simon.core.options'
require 'simon.plugins-setup'
require 'simon.core.keymaps'
require 'simon.core.colorscheme'
require 'simon.plugin-settings.hydra'
require 'simon.plugin-settings.autocomplete'
require 'simon.plugin-settings.LSP.mason'
require 'simon.plugin-settings.LSP.lspsaga'
require 'simon.plugin-settings.LSP.lspconfig'
require 'simon.plugin-settings.treesitter'
require 'simon.plugin-settings.bufferline'
require 'simon.plugin-settings.formatting'

-- NEOVIDE SETTINGS
if vim.g.neovide then
  -- vim.g.neovide_transparency = 0.95
  vim.g.neovide_input_macos_alt_is_meta = true
  vim.o.guifont = 'FiraMono Nerd Font Mono:h11'
  -- vim.cmd [[set guifont=MonoLisa:10,Symbols\ Nerd\ Font:h10]]
  vim.g.transparency = 0.85
  vim.g.neovide_cursor_vfx_mode = 'wireframe'
end
