local cmp = require 'cmp'
local luasnip = require 'luasnip'
local lspkind = require 'lspkind'
luasnip.filetype_extend('javascript', { 'javascriptreact', 'typescript', 'typescriptreact' })
vim.opt.rtp:append '~/.config/nvim/lua/simon/'
require('luasnip.loaders.from_vscode').lazy_load()
require('luasnip.loaders.from_snipmate').lazy_load()
-- require('luasnip.loaders.from_vscode').load { paths = { '~/.config/nvim/lua/simon/snippets/' } }
vim.opt.completeopt = 'menu,menuone,noselect'
-- Define a function to jump to the next snippet position
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

    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-j>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ['<C-k>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },

    -- ['<CR>'] = cmp.mapping.confirm {
    --   behavior = cmp.ConfirmBehavior.Replace,
    --   select = true,
    -- },
    -- ["<CR>"] = cmp.mapping.complete({ select = false} ),
    ['<C-l>'] = cmp.mapping(function(fallback)
      if luasnip.locally_jumpable() then
        luasnip.jump(1)
      else
        if luasnip.expand() then
          luasnip.expand()
          return '' -- Return an empty string to consume the keypress
        end
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-h>'] = cmp.mapping(function(fallback)
      if luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = cmp.config.sources {

    -- { name = 'luasnip', max_item_count = 2, keyword_length = 2 },
    -- { name = 'ultisnips', max_item_count = 3, keyword_length = 2 },
    -- { name = 'buffer', keyword_length = 2 },
    -- { name = 'nvim_lsp', max_item_count = 1, keyword_length = 2 },

    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'nvim_lsp' },

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
