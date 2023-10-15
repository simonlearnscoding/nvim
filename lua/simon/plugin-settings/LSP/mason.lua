local mason = require 'mason'
local mason_lspconfig = require 'mason-lspconfig'
--
--
mason.setup()
-- making sure things that I need will be installed
mason_lspconfig.setup {
  ensure_installed = {
    'tsserver',
    'html',
    'cssls',
    'tailwindcss',
  },
}

local mason_null_ls = require 'mason-null-ls'
mason_null_ls.setup {
  ensure_installed = {
    'prettier',
    'stylua',
    'eslint_d',
  },
}
