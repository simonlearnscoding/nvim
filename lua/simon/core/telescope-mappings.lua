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
maps.n['<leader>f'] = { desc = '󰍉 Find..' }
maps.n[prefix .. 'n'] = { '<cmd>Telekasten find_notes<cr>', desc = ' [n]otes' }
maps.n[prefix .. 't'] = { '<cmd>TodoTelescope<CR>', desc = '󰱑 [t]asks' }
maps.n[prefix .. 'g'] = { desc = ' [g]it..' }
maps.n[prefix .. 'r'] = { desc = ' [r]eset..' }
maps.n[prefix .. 'gb'] = { '<cmd>Telescope git_branches<CR>', desc = ' [b]ranches' }
maps.n[prefix .. 'gc'] = { '<cmd>Telescope git_commits<CR>', desc = ' [c]ommits' }
maps.n[prefix .. 'gs'] = { '<cmd>Telescope git_status<CR>', desc = ' [s]tatus' }
maps.n[prefix .. 'gf'] = { '<cmd>Telescope git_files<CR>', desc = ' [f]iles' }
maps.n[prefix .. 'd'] = { "<cmd>lua require('telescope.builtin').diagnostics()<CR>", desc = '  [d]iagnostics' }
maps.n[prefix .. 'l'] = { "<cmd>lua require('telescope.builtin').lsp_references()<CR>", desc = ' [l]sp' }
maps.n[prefix .. 'w'] = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", desc = ' [w]ord' }
-- maps.n[prefix .. 'r'] = { "<cmd>lua require('telescope.builtin').lsp_references()<CR>", desc = 'LSP References' }

maps.n[prefix .. 'o'] = {
  function()
    require('telescope.builtin').oldfiles()
  end,
  desc = ' [o]ld files',
}

maps.n[prefix .. 'f'] = {
  function()
    require('telescope.builtin').find_files()
  end,
  desc = ' [f]iles',
}

maps.n[prefix .. 'r'] = {
  function()
    local cwd = vim.fn.expand '~/react-components' -- use the home directory as the working directory
    require('telescope.builtin').find_files {
      cwd = cwd,
      hidden = true,
      no_ignore = true,
    }
  end,
  desc = ' [r]eact',
}

maps.n[prefix .. 'a'] = {
  function()
    local cwd = vim.fn.expand '~' -- use the home directory as the working directory
    require('telescope.builtin').find_files {
      cwd = cwd,
      hidden = true,
      no_ignore = true,
    }
  end,
  desc = ' [a]ll files',
}

maps.n[prefix .. 'z'] = { '<cmd>Telescope zoxide list<cr>', desc = ' [z]oxide' }
maps.n[prefix .. 'b'] = { '<cmd>Telescope bibtex<cr>', desc = ' [b]ibliography' }
maps.n[prefix .. 'p'] = {
  function()
    require('telescope').extensions.projects.projects {}
  end,
  desc = ' [p]rojects',
}
utils.set_mappings(maps)
