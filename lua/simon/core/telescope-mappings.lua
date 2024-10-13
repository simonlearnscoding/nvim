local utils = require 'simon.utils'
local maps = { i = {}, n = {}, v = {}, t = {} }
-- local wk = require 'which-key'

--          ╭─────────────────────────────────────────────────────────╮
--          │                        TELESCOPE                        │
--          ╰─────────────────────────────────────────────────────────╯

local wk = require 'which-key'

-- Replace the keybindings with wk.add
wk.add { '<leader>fn', '<cmd>Telekasten find_notes<cr>', group = '󰍉 [f]ind..', desc = ' [n]otes' }
wk.add { '<leader>ft', '<cmd>TodoTelescope<CR>', group = '󰍉 [f]ind..', desc = '󰱑 [t]asks' }
wk.add { '<leader>fg', nil, group = '󰍉 [f]ind..', desc = ' [g]it..' }
wk.add { '<leader>fgr', nil, group = '󰍉 [f]ind..', desc = ' [r]eset..' }
wk.add { '<leader>fgb', '<cmd>Telescope git_branches<CR>', group = '󰍉 [f]ind..', desc = ' [b]ranches' }
wk.add { '<leader>fgc', '<cmd>Telescope git_commits<CR>', group = '󰍉 [f]ind..', desc = ' [c]ommits' }
wk.add { '<leader>fgs', '<cmd>Telescope git_status<CR>', group = '󰍉 [f]ind..', desc = ' [s]tatus' }
wk.add { '<leader>fgf', '<cmd>Telescope git_files<CR>', group = '󰍉 [f]ind..', desc = ' [f]iles' }
wk.add { '<leader>fd', "<cmd>lua require('telescope.builtin').diagnostics()<CR>", group = '󰍉 [f]ind..', desc = ' [d]iagnostics' }
wk.add { '<leader>fl', "<cmd>lua require('telescope.builtin').lsp_references()<CR>", group = '󰍉 [f]ind..', desc = ' [l]sp' }
wk.add { '<leader>fw', "<cmd>lua require('telescope.builtin').live_grep()<CR>", group = '󰍉 [f]ind..', desc = ' [w]ord' }
wk.add {
  '<leader>fo',
  function()
    require('telescope.builtin').oldfiles()
  end,
  group = '󰍉 [f]ind..',
  desc = ' [o]ld files',
}
wk.add {
  '<leader>ff',
  function()
    require('telescope.builtin').find_files()
  end,
  group = '󰍉 [f]ind..',
  desc = ' [f]iles',
}
wk.add { '<leader>fz', '<cmd>Telescope zoxide list<cr>', group = '󰍉 [f]ind..', desc = ' [z]oxide' }
wk.add { '<leader>fb', '<cmd>Telescope bibtex<cr>', group = '󰍉 [f]ind..', desc = ' [b]ibliography' }
wk.add {
  '<leader>fp',
  function()
    require('telescope').extensions.projects.projects {}
  end,
  group = '󰍉 [f]ind..',
  desc = ' [p]rojects',
}

-- Bind <leader><Tab> for Telescope buffers
wk.add { '<leader><Tab>', '<cmd>Telescope buffers<cr>', group = '󰍉 [f]ind..', desc = 'Buffers', noremap = true, silent = true }
