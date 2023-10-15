local lspconfig = require 'lspconfig'
local cmp_nvim_lsp = require 'cmp_nvim_lsp'
local typescript = require 'typescript'
local symbols_outline = require('symbols-outline').setup()

-- deactivate this if it will be too annoying
local cfg = {
  transparency = 80,
  toggle_key = '<C-f>',    -- This sets the toggle key to C-f
  auto_close_after = 1000, -- This will close the floating
}
-- require('lsp_signature').setup(cfg)
-- [[ configure lsp ]]
--
--
-- will this be registered to which key though?
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  --   nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  -- set keybinds
  -- TODO: test this with treesitter
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts) -- go to implementation
  -- vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)    -- got to declaration
  -- vim.keymap.set({ 'i' }, '<C-k>', function()
  --   require('lsp_signature').toggle_float_win()
  -- end, { silent = true, noremap = true, desc = 'toggle signature' })
  vim.keymap.set('n', '<leader>o', '<cmd>SymbolsOutline<CR>', opts)  -- go to implementation
  -- TODO: test if it renames in other files too
  vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts) -- smart rename

  -- TODO: put this into the keymaps
  vim.keymap.set('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>', opts)     -- show definition and references
  vim.keymap.set('n', '<leader>ca', '<cmd>CodeActionMenu<CR>', opts) -- see available code actions
  -- vim.keymap.set('n', '<C-d>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {})
  --
  -- show  diagnostics for line
  vim.keymap.set('n', '<leader>D', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
  -- show diagnostics for cursor
  vim.keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts) -- jump to previous diagnostic in buffer
  vim.keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts) -- jump to next diagnostic in buffer
  --
  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)       -- show documentation for what is under cursor

  -- Toggle outline doesnt work right now
  -- vim.keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

  -- typescript specific keymaps (e.g. rename file and update imports)
  if client.name == 'tsserver' then
    vim.keymap.set('n', '<leader>rf', ':TypescriptRenameFile<CR>')   -- rename file and update imports
    -- vim.keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
    vim.keymap.set('n', '<leader>ru', ':TypescriptRemoveUnused<CR>') -- remove unused variables (not in youtube nvim video)
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
