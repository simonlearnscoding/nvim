-- [[ Configure Treesitter ]]treesi
--

-- Define the function to check if inside return statement of functional component
local ts_utils = require 'nvim-treesitter.ts_utils'

function _G.in_return_of_functional_component()
  local node_at_point = ts_utils.get_node_at_cursor()
  if not node_at_point then
    return false
  end

  local current_node = node_at_point

  while current_node do
    if current_node:type() == 'return_statement' then
      local parent = current_node:parent()
      if parent and parent:type() == 'arrow_function' then
        return true
      end
    end
    current_node = current_node:parent()
  end

  return false
end

require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'javascript', 'json', 'dockerfile', 'gitignore', 'lua', 'tsx', 'typescript', 'vimdoc', 'vim' },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = true,

  highlight = { enable = true },
  indent = { enable = true },
  autotag = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>', -- this one is actually pretty controlling
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>h'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>H'] = '@parameter.inner',
      },
    },
  },
}
require('ufo').setup {

  vim.cmd [[
  sign define Folded text=▼
  sign define UnFolded text=▶
  ]],
  FoldClosed = '',
  FoldOpened = '',
  provider_selector = function(bufnr, filetype, buftype)
    return { 'treesitter', 'indent' }
  end,
}
