local utils = require 'simon.utils'
local maps = { i = {}, n = {}, v = {}, t = {} }

-- TELESCOPE

-- maps.n['<leader>gc'] = {
--   function()
--     require('telescope.builtin').git_commits()
--   end,
--   desc = 'Git commits',
-- }
local prefix = '<leader>f'
maps.n[prefix .. 'f'] = { desc = '󰍉 Find' }
maps.n[prefix .. 'n'] = { '<cmd>Telekasten find_notes<cr>', desc = 'Find Notes' }
maps.n[prefix .. 't'] = { '<cmd>TodoTelescope<CR>', desc = 'TODO' }
maps.n[prefix .. 'g'] = { desc = ' git...' }
maps.n[prefix .. 'r'] = { desc = ' reset...' }
maps.n[prefix .. 'gb'] = { '<cmd>Telescope git_branches<CR>', desc = ' ...branches' }
maps.n[prefix .. 'gc'] = { '<cmd>Telescope git_commits<CR>', desc = ' ...commits' }
maps.n[prefix .. 'gs'] = { '<cmd>Telescope git_status<CR>', desc = ' ...status' }
maps.n[prefix .. 'gf'] = { '<cmd>Telescope git_files<CR>', desc = ' ...files' }
maps.n[prefix .. 'd'] = { "<cmd>lua require('telescope.builtin').diagnostics()<CR>", desc = 'Diagnostics' }
maps.n[prefix .. 'l'] = { "<cmd>lua require('telescope.builtin').lsp_references()<CR>", desc = 'LSP References' }
maps.n[prefix .. 'w'] = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", desc = 'find word' }
maps.n[prefix .. 'r'] = { "<cmd>lua require('telescope.builtin').lsp_references()<CR>", desc = 'LSP References' }

maps.n[prefix .. 'o'] = {
  function()
    require('telescope.builtin').oldfiles()
  end,
  desc = 'Find file history',
}

maps.n[prefix .. 'f'] = {
  function()
    require('telescope.builtin').find_files()
  end,
  desc = 'Find files',
}

maps.n[prefix .. 'C'] = {
  function()
    local cwd = vim.fn.expand '~/react-components' -- use the home directory as the working directory
    require('telescope.builtin').find_files {
      cwd = cwd,
      hidden = true,
      no_ignore = true,
    }
  end,
  desc = 'Find react components',
}

maps.n[prefix .. 'F'] = {
  function()
    local cwd = vim.fn.expand '~' -- use the home directory as the working directory
    require('telescope.builtin').find_files {
      cwd = cwd,
      hidden = true,
      no_ignore = true,
    }
  end,
  desc = 'Find all files',
}

maps.n[prefix .. 'z'] = { '<cmd>Telescope zoxide list<cr>', desc = 'Zoxide' }
maps.n[prefix .. 'B'] = { '<cmd>Telescope bibtex<cr>', desc = 'Find BibTeX' }
maps.n[prefix .. 'p'] = {
  function()
    require('telescope').extensions.projects.projects {}
  end,
  desc = 'Find projects',
}
utils.set_mappings(maps)
