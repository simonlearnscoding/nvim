-- TODO: set up copilot
local cmp = require 'cmp'
local luasnip = require 'luasnip'
local lspkind = require 'lspkind'
luasnip.filetype_extend('javascript', { 'javascriptreact', 'typescript', 'typescriptreact' })
vim.opt.rtp:append '~/.config/nvim/lua/simon/'
require('luasnip.loaders.from_vscode').lazy_load()
-- require('luasnip.loaders.from_vscode').load { paths = { '~/.config/nvim/lua/simon/snippets/' } }
vim.opt.completeopt = 'menu,menuone,noselect'

luasnip.config.set_config {
  history = true,
  updateevents = 'TextChanged, TextChangedI',
  enable_autosnippets = true,
}
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    -- ["<Tab>"] = cmp.mapping.select_next_item(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-j>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ['<C-k>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },

    ['<C-l>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    -- ["<CR>"] = cmp.mapping.complete({ select = false} ),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = cmp.config.sources {

    -- { name = 'ultisnips' },
    -- { name = 'luasnip' },
    -- { name = 'buffer' },

    { name = 'luasnip', max_item_count = 2, keyword_length = 2 },
    { name = 'ultisnips', max_item_count = 3, keyword_length = 2 },
    { name = 'buffer', keyword_length = 2 },
    { name = 'nvim_lsp', max_item_count = 1, keyword_length = 2 },

    -- this was the <h1> kinda thing I think??

    { name = 'path' },
  },

  -- configure lspkind for vs-code like icons
  formatting = {
    format = lspkind.cmp_format {
      maxwidth = 50,
      ellipsis_char = '...',
    },
  },
}
