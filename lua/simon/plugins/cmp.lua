-- Autocompletion

return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    { 'L3MON4D3/LuaSnip' },
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'gbprod/yanky.nvim',

    --     -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',

    --     -- Adds a number of user-friendly snippets
    'rafamadriz/friendly-snippets',
  },
  config = function()
    -- Here is where you configure the autocompletion settings.
    require('luasnip.loaders.from_vscode').lazy_load()
    require('luasnip.loaders.from_vscode').lazy_load {
      paths = { "~/.config/nvim/snippets" }
    }

    require('luasnip.loaders.from_snipmate').lazy_load()
    local lsp_zero = require('lsp-zero')
    lsp_zero.extend_cmp()

    -- And you can configure cmp even more, if you want to.
    local cmp = require('cmp')
    local cmp_action = lsp_zero.cmp_action()
    cmp.setup({
      sources = {
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },


      },
      formatting = lsp_zero.cmp_format(),
      mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-f>'] = cmp.mapping.confirm({ select = true }),
        -- Navigate between snippet placeholder
        ['<C-h>'] = cmp_action.luasnip_jump_backward(),
        ['<C-l>'] = cmp_action.luasnip_jump_forward(),
        ['<C-Space>'] = cmp.mapping.complete(),
      }),
    })
  end
}
