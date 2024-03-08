return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    {

      'nvim-telescope/telescope-fzf-native.nvim', enabled = vim.fn.executable 'make' == 1, build = 'make' },
    'nvim-telescope/telescope-hop.nvim',
    -- {
    -- 'benfowler/telescope-luasnip.nvim',
    -- module = 'telescope._extensions.luasnip', -- if you wish to lazy-load
    -- },
    -- 'nvim-telescope/telescope-media-files.nvim',

    'ThePrimeagen/harpoon',
    -- 'rmagatti/session-lens',
    'nvim-telescope/telescope-project.nvim',
    'jvgrootveld/telescope-zoxide',
    -- 'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-bibtex.nvim',
    'nvim-lua/plenary.nvim',
    {
      'ahmedkhalf/project.nvim',
      config = function(_, opts)
        require('project_nvim').setup(opts)
      end,
      opts = {
        ignore_lsp = { 'lua_ls' },
      },
    },
  },
  opts = function()
    local actions = require 'telescope.actions'
    local telescope = require 'telescope'
    -- telescope.load_extension 'luasnip'
    -- telescope.load_extension 'session-lens'
    telescope.load_extension 'bibtex'

    telescope.load_extension 'ui-select'
    telescope.load_extension 'zoxide'
    telescope.load_extension 'fzf'
    require('telescope').load_extension 'harpoon'
    local get_icon = require('simon.utils').get_icon

    local mappings = {
      i = {
        ["<C-r"] = actions.open_qflist,
        ["<C-l>"] = actions.preview_scrolling_down,
        ["<C-h>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.results_scrolling_down,
        ["<C-u>"] = actions.results_scrolling_up,
        ['<C-n>'] = actions.cycle_history_next,
        ['<C-p>'] = actions.cycle_history_prev,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-q>'] = actions.close,
        ['<C-k>'] = actions.move_selection_previous,
        ['|'] = actions.file_vsplit,
        ['\\'] = actions.file_split,
      },
      n = {
        ['|'] = actions.file_vsplit,
        ['\\'] = actions.file_split,
        ['<C-l>'] = actions.file_vsplit,
        ['q'] = actions.close,
        ['<leader>q'] = actions.close,
      },
    }

    if vim.fn.has 'nvim-0.10' == 1 then
      for _, key in ipairs { '<CR>', '<C-x>', '<C-v>', '<C-t>', '<C-q>', '<M-q>' } do
        mappings.i[key] = function()
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>' .. key, true, false, true), 'i', false)
        end
      end
    end
    return {
      defaults = {
        prompt_prefix = string.format('%s ', get_icon 'Search'),
        selection_caret = string.format('%s ', get_icon 'Selected'),
        path_display = { 'truncate' },
        sorting_strategy = 'ascending',
        layout_config = {
          horizontal = {
            prompt_position = 'top',
            preview_width = 0.55,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        mappings = mappings,
      },
    }
  end,



}
