-- Install lazy packassge manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
-- lua with packer.nvim
require('lazy').setup {
  'lervag/vimtex',
  {
    'chentoast/marks.nvim',
    config = function()
      require('marks').setup {
        default_mappings = true,   -- whether to map keybinds or not. default true
        builtin_marks = { '.' },   -- which builtin marks to show. default {}
        cyclic = true,             -- whether movements cycle back to the beginning/end of buffer. default true
        force_write_shada = false, -- whether the shada file is updated after modifying uppercase marks. default false
        bookmark_0 = {             -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own sign/virttext
          sign = '⚑',
          virt_text = 'hello world',
        },
        mappings = {},
      }
    end,
  },
  'mrjones2014/smart-splits.nvim',
  -- Git related plugins
  'tpope/vim-fugitive',
  'windwp/nvim-ts-autotag',
  -- 'anuvj'
  'tpope/vim-rhubarb',
  {
    'anuvyklack/keymap-amend.nvim',
  },
  -- icons
  'nvim-tree/nvim-web-devicons',
  { 'folke/trouble.nvim',     dependencies = { 'nvim-tree/nvim-web-devicons' }, opts = {} },

  -- color picker
  {
    'uga-rosa/ccc.nvim',
    opts = {},
    cmd = { 'CccPick', 'CccConvert', 'CccHighlighterEnable', 'CccHighlighterDisable', 'CccHighlighterToggle' },
    keys = {
      { '<leader>zp', '<cmd>CccPick<cr>',              desc = 'Pick' },
      { '<leader>zc', '<cmd>CccConvert<cr>',           desc = 'Convert' },
      { '<leader>zh', '<cmd>CccHighlighterToggle<cr>', desc = 'Toggle Highlighter' },
    },
  },
  'windwp/nvim-autopairs',
  'ron89/thesaurus_query.vim',
  'hrsh7th/cmp-nvim-lsp',
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end,
  },
  { 'kosayoda/nvim-lightbulb' },
  'simrat39/symbols-outline.nvim',
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  'akinsho/bufferline.nvim',
  {
    'echasnovski/mini.pairs',
    event = 'VeryLazy',
    opts = {},
  },
  ---@diagnostic disable-next-line: trailing-space

  'jose-elias-alvarez/typescript.nvim',
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
      require('window-picker').setup()
    end,
  },
  -- Debugging
  { 'Weissle/persistent-breakpoints.nvim' },
  --{'rcarriga/nvim-dap-ui',
  --  dependencies = {}
  -- Lua
  {
    'max397574/better-escape.nvim',
    config = function()
      require('better_escape').setup {
        mapping = { 'jk', 'jj' }, -- a table with mappings to use
        timeout = 200,            -- the time in which the keys must be hit in ms. Use option timeoutlen by default
      }
    end,
  },
  {
    'folke/zen-mode.nvim',
    opts = {
      window = {
        width = 0.65, -- width will be 85% of the editor width
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        options = {
          signcolumn = 'no',      -- disable signcolumn
          number = false,         -- disable number column
          relativenumber = false, -- disable relative numbers
          cursorline = false,     -- disable cursorline
          cursorcolumn = false,   -- disable cursor column
          foldcolumn = '0',       -- disable fold column
          list = false,           -- disable whitespace characters
        },
      },
    },
  },

  -- Lua
  {
    'folke/twilight.nvim',
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      dimming = {
        alpha = 0.45,    -- amount of dimming
      },
      context = 15,      -- amount of lines we will try to show around the current line
      treesitter = true, -- use treesitter when available for the filetype
    },
  },

  -- FORMATTING AND LINTING
  'jose-elias-alvarez/null-ls.nvim',
  'jayp0521/mason-null-ls.nvim',

  -- Detect tabstop and shiftwidth automatically
  'famiu/bufdelete.nvim',
  'tpope/vim-sleuth',

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  { 'williamboman/mason.nvim',            config = true },

  'williamboman/mason-lspconfig.nvim',
  'onsails/lspkind.nvim',
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'onsails/lspkind.nvim',
      'kkharji/lspsaga.nvim',
      -- {
      --   'weilbith/nvim-code-action-menu',
      --   cmd = 'CodeActionMenu',
      -- },
      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

      -- TODO: what does this do??
      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },
  --
  --
  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',       opts = {} },

  -- COLOR THEMES --
  {
    'rose-pine/neovim',
    name = 'rose-pine',
  },
  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    name = 'onedark',
  },
  { 'bluz71/vim-nightfly-colors', name = 'nightfly' },

  -- STATUSLINE
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        -- theme = 'onedark',
        component_separators = '|',
        section_separators = '',
        sections = {
          lualine_b = { '' },
        },
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  --
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  { import = 'simon.plugins' },
}
