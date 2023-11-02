local lspconfig = require 'lspconfig'
local cmp_nvim_lsp = require 'cmp_nvim_lsp'
local typescript = require 'typescript'
local symbols_outline = require('symbols-outline').setup()

M.diagnostic_signs = { Error = ' ', Warn = ' ', Hint = 'ﴞ ', Info = '' }
for type, icon in pairs(diagnostic_signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

-- deactivate this if it will be too annoying
local cfg = {
  transparency = 80,
  toggle_key = '<C-f>', -- This sets the toggle key to C-f
  auto_close_after = 1000, -- This will close the floating
}
-- require('lsp_signature').setup(cfg)
-- [[ configure lsp ]]
--
--
-- will this be registered to which key though?
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  -- set keybinds
  -- TODO Move this to keybinds
  vim.keymap.set('n', '<leader>o', '<cmd>SymbolsOutline<CR>', opts) -- go to implementation
  -- TODO: this needs to be fixed
  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts) -- show documentation for what is under cursor
  if client.name == 'tsserver' then
    vim.keymap.set('n', '<space>lw', vim.lsp.buf.add_workspace_folder)
    vim.keymap.set('n', '<leader>lf', ':TSToolsRenameFile<CR>') -- rename file and update imports
    vim.keymap.set('n', '<leader>lu', ':TSToolsRemoveUnused<CR>') -- remove unused variables (not in youtube nvim video)
    vim.keymap.set('n', '<leader>la', ':TSToolsAddMissingImports<CR>') -- rename file and update imports
  end
end

local servers = {
  tsserver = {},
  -- pyright = {},
  --
  tailwindcss = {
    filetypes_exclude = { 'markdown' },
  },
  html = { filetypes = { 'html', 'twig', 'hbs' } },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}
mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}

typescript.setup {
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
}

lspconfig['emmet_ls'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { 'html', 'css', 'sass', 'scss', 'less' },
}

lspconfig['lua_ls'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand '$VIMRUNTIME/lua'] = true,
          [vim.fn.stdpath 'config' .. '/lua'] = true,
        },
      },
    },
  },
}
