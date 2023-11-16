local utils = require 'simon.utils'
local is_available = utils.is_available
local ui = require 'simon.utils.ui'
local keymap = vim.keymap
local maps = { i = {}, n = {}, v = {}, t = {} }
local sections = {
  f = { desc = '󰍉 Find' },
  l = { desc = ' LSP' },
  u = { desc = ' UI' },
  b = { desc = '󰓩 Buffers' },
  bs = { desc = '󰒺 Sort Buffers' },
  d = { desc = ' Debugger' },
  g = { desc = '󰊢 Git' },
  w = { desc = '󰍉  vimwiki' },
  S = { desc = '󱂬 Session' },
  t = { desc = ' Terminal' },
  r = { desc = ' Refactor' },
}

-- [[ LSP ]]
vim.api.nvim_set_keymap('n', '<Leader>gI', ':lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gd', ':lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
--
--
--
-- REFACTORING
maps.n['<leader>rr'] = { ':IncRename ', desc = 'smart rename' }
maps.n['<leader>lr'] = { ':IncRename ', desc = 'smart rename' }
maps.v['<leader>re'] = { ':Refactor extract<CR>', desc = 'Refactor Extract' }
maps.v['<leader>rf'] = { ':Refactor extract_to_file<CR>', desc = 'Refactor Extract' }
maps.v['<leader>rv'] = { ':Refactor extract_variable<CR>', desc = 'Refactor Extract' }

maps.n['<leader>w'] = sections.w
maps.n['<leader>wa'] = { '<cmd>Telekasten insert_link<cr>', desc = 'Insert note' }
maps.v['<C-n>'] = { '<cmd>Telekasten insert_link<cr>', desc = 'Insert note' }
maps.n['<leader>wf'] = { '<cmd>Telekasten find_notes<cr>', desc = 'Find Notes' }
maps.n['<leader>fw'] = { '<cmd>Telekasten find_notes<cr>', desc = 'Find Notes' }

maps.n['<C-s>'] = { '<cmd>w!<cr>', desc = 'Force write' }
maps.n['<leader>r'] = sections.r
maps.n['<leader>p'] = sections.p
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
if not vim.g.icons_enabled then
  vim.tbl_map(function(opts)
    opts.desc = opts.desc:gsub('^.* ', '')
  end, sections)
end
-- TODO stuff
vim.keymap.set('n', ']T', function()
  require('todo-comments').jump_next()
end, { desc = 'Next todo comment' })

vim.keymap.set('n', '[T', function()
  require('todo-comments').jump_prev()
end, { desc = 'Previous todo comment' })

-- makes j and k more intuitive for some reason
maps.n['j'] = { "v:count == 0 ? 'gj' : 'j'", expr = true, desc = 'Move cursor down' }
maps.n['k'] = { "v:count == 0 ? 'gk' : 'k'", expr = true, desc = 'Move cursor up' }

-- [[ WRITE AND SAVE ]]
maps.n['<leader>w'] = { '<cmd>w<cr>', desc = 'Save' }
-- maps.n["<leader>q"] = { "<cmd>wq<cr>", desc = "Save and Quit" } -- cant use because buffertype not set
maps.n['<leader>q'] = { '<cmd>update<cr><cmd>q<cr>', desc = 'Save and Quit if possible, else just Quit' }
maps.n['<C-s>'] = { '<cmd>w!<cr>', desc = 'Force write' }
maps.n['<leader>n'] = { '<cmd>enew<cr>', desc = 'New File' }
maps.n['<leader>c'] = { '<cmd>w | Bdelete<cr>', desc = 'Save and delete buffer' }
-- maps.n['<leader>C'] = { '<cmd>w | Bdelete<cr>', desc = 'Save and delete buffer' }
maps.n['<C-s>'] = { '<cmd>w!<cr>', desc = 'Force write' }
-- maps.n["<C-q>"] = { "<cmd>q!<cr>", desc = "Force quit" }

maps.n['<leader>dd'] = { ':Trouble workspace_diagnostics<cr>', desc = 'Workspace diagnostic' }
-- {{ BUFFERS }}
maps.n['<leader>b'] = sections.b

maps.n['<leader>bp'] = { '<cmd>:BufferLinePick<cr>', desc = 'pick buffer' }
maps.n['<leader>bc'] = { '<cmd>:BufferLinePickClose<cr>', desc = 'pick buffer' }
maps.n['<leader>bl'] = { '<cmd>:BufferLineCloseRight<cr>', desc = 'close every buffer to the right' }
maps.n['<leader>bh'] = { '<cmd>:BufferLineCloseLeft<cr>', desc = 'close every buffer to the left' }

maps.n['<leader>ba'] = { '<cmd>:BufferLineCloseOthers<cr>', desc = 'close every buffer except for the current one' }

-- This doesn't work idk why
maps.n['<S-h>'] = { '<cmd>bprevious<cr>', desc = 'Previous Buffer' }
maps.n['<S-l>'] = { '<cmd>bnext<cr>', desc = 'Next Buffer' }

maps.n['[b'] = { '<cmd>bprevious<cr>', desc = 'Previous Buffer' }
maps.n[']b'] = { '<cmd>bnext<cr>', desc = 'Next Buffer' }

-- Navigate tabs
maps.n['<leader>N'] = { '<cmd>tabnew<cr>', desc = 'New Tab' }
maps.n[']t'] = {
  function()
    vim.cmd.tabnext()
  end,
  desc = 'Next tab',
}
maps.n['[t'] = {
  function()
    vim.cmd.tabprevious()
  end,
  desc = 'Previous tab',
}

maps.n['|'] = { '<cmd>vsplit<cr>', desc = 'Vertical Split' }
maps.n['\\'] = { '<cmd>split<cr>', desc = 'Horizontal Split' }
maps.n['<leader>M'] = { '<cmd>ZenMode<cr>', desc = 'Zen Mode' }
-- Move Lines
--
maps.n['<A-j>'] = { '<cmd>m .+1<cr>==', desc = 'Move down' }
maps.n['<A-k>'] = { '<cmd>m .-2<cr>==', desc = 'Move up' }
maps.i['<A-j>'] = { '<esc><cmd>m .+1<cr>==gi', desc = 'Move down' }
maps.i['<A-k>'] = { '<esc><cmd>m .-2<cr>==gi', desc = 'Move up' }
maps.v['<A-j>'] = { ":m '>+1<cr>gv=gv", desc = 'Move down' }
maps.v['<A-k>'] = { ":m '<-2<cr>gv=gv", desc = 'Move up' }
-- Insert mode mapping
maps.i['<C-v>'] = { '<C-o>p', desc = 'Paste' }

-- Normal mode mapping
maps.n['<C-c>'] = { '"+y', desc = 'Copy' }

-- Visual mode mapping
maps.v['<C-x>'] = { '"+x', desc = 'Cut' }
-- [[ TELESCOPE ]]
--
--

-- Improved Code Folding
if is_available 'nvim-ufo' then
  maps.n['zR'] = {
    function()
      require('ufo').openAllFolds()
    end,
    desc = 'Open all folds',
  }
  maps.n['zM'] = {
    function()
      require('ufo').closeAllFolds()
    end,
    desc = 'Close all folds',
  }
  maps.n['zr'] = {
    function()
      require('ufo').openFoldsExceptKinds()
    end,
    desc = 'Fold less',
  }
  maps.n['zm'] = {
    function()
      require('ufo').closeFoldsWith()
    end,
    desc = 'Fold more',
  }
  maps.n['zp'] = {
    function()
      require('ufo').peekFoldedLinesUnderCursor()
    end,
    desc = 'Peek fold',
  }
end
maps.n['<leader>f'] = sections.f
-- maps.v["<leader>s"] = {"S", desc = "Surround Selection" }
maps.n['<leader>ft'] = { '<cmd>TodoTelescope<CR>', desc = 'TODO' }
maps.n['<leader>fd'] = { "<cmd>lua require('telescope.builtin').diagnostics()<CR>" }

maps.n['<leader>/'] = { '<cmd>Telescope current_buffer_fuzzy_find <CR>', desc = 'find in buffer' }
maps.n['<leader>fb'] = {
  function()
    require('telescope.builtin').buffers()
  end,
  desc = 'Find buffers',
}
maps.n['<leader><Tab>'] = {
  function()
    require('telescope.builtin').buffers()
  end,
  desc = 'Find buffers',
}
-- Comment
maps.n['<leader>fo'] = {
  function()
    require('telescope.builtin').oldfiles()
  end,
  desc = 'Find history',
}
maps.n['<leader>fs'] = { '<cmd> Telescope luasnip<cr>', desc = 'Find Snippets' }
maps.n['<leader>u'] = sections.p
maps.n['<leader>g'] = sections.g
maps.n['<leader>uc'] = {
  function()
    require('telescope.builtin').colorscheme { enable_preview = true }
  end,
  desc = 'Find themes',
}
maps.n['<leader>gc'] = {
  function()
    require('telescope.builtin').git_commits()
  end,
  desc = 'Git commits',
}
maps.n['<leader>fm'] = {
  function()
    require('telescope.builtin').marks()
  end,
  desc = 'Find marks',
}
maps.n['<leader>fb'] = {
  function()
    require('telescope.builtin').buffers()
  end,
  desc = 'Find buffers',
}
-- maps.n['<leader>fw'] = {
--   function()
--     require('telescope.builtin').grep_string()
--   end,
--   desc = 'Find for word under cursor',
-- }
maps.n['<leader>f<CR>'] = {
  function()
    require('telescope.builtin').resume()
  end,
  desc = 'Resume previous search',
}
maps.n['<leader>ff'] = {
  function()
    require('telescope.builtin').find_files()
  end,
  desc = 'Find files',
}

maps.n['<leader>fC'] = {
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

maps.n['<leader>fF'] = {
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

maps.n['<leader>fz'] = { '<cmd>Telescope zoxide list<cr>', desc = 'Zoxide' }
maps.n['<leader>fB'] = { '<cmd>Telescope bibtex<cr>', desc = 'Find BibTeX' }
maps.n['<leader>fM'] = { '<cmd>Telescope media_files<cr>', desc = 'Find media' }
maps.n['<leader>fp'] = {
  function()
    require('telescope').extensions.projects.projects {}
  end,
  desc = 'Find projects',
}
--
-- Smart Splits
if is_available 'smart-splits.nvim' then
  maps.n['<C-h>'] = {
    function()
      require('smart-splits').move_cursor_left()
    end,
    desc = 'Move to left split',
  }
  maps.n['<C-j>'] = {
    function()
      require('smart-splits').move_cursor_down()
    end,
    desc = 'Move to below split',
  }
  maps.n['<C-k>'] = {
    function()
      require('smart-splits').move_cursor_up()
    end,
    desc = 'Move to above split',
  }
  maps.n['<C-l>'] = {
    function()
      require('smart-splits').move_cursor_right()
    end,
    desc = 'Move to right split',
  }
  maps.n['<C-Up>'] = {
    function()
      require('smart-splits').resize_up()
    end,
    desc = 'Resize split up',
  }
  maps.n['<C-Down>'] = {
    function()
      require('smart-splits').resize_down()
    end,
    desc = 'Resize split down',
  }
  maps.n['<C-Left>'] = {
    function()
      require('smart-splits').resize_left()
    end,
    desc = 'Resize split left',
  }
  maps.n['<C-Right>'] = {
    function()
      require('smart-splits').resize_right()
    end,
    desc = 'Resize split right',
  }
else
  maps.n['<C-h>'] = { '<C-w>h', desc = 'Move to left split' }
  maps.n['<C-j>'] = { '<C-w>j', desc = 'Move to below split' }
  maps.n['<C-k>'] = { '<C-w>k', desc = 'Move to above split' }
  maps.n['<C-l>'] = { '<C-w>l', desc = 'Move to right split' }
  maps.n['<C-Up>'] = { '<cmd>resize -2<CR>', desc = 'Resize split up' }
  maps.n['<C-Down>'] = { '<cmd>resize +2<CR>', desc = 'Resize split down' }
  maps.n['<C-Left>'] = { '<cmd>vertical resize -2<CR>', desc = 'Resize split left' }
  maps.n['<C-Right>'] = { '<cmd>vertical resize +2<CR>', desc = 'Resize split right' }
end

maps.n['<M-h>'] = { '<Left>', noremap = false, desc = 'Left' }
maps.n['<M-j>'] = { '<Down>', noremap = false, desc = 'Down' }
maps.n['<M-k>'] = { '<Up>', noremap = false, desc = 'Up' }
maps.n['<M-l>'] = { '<Right>', noremap = false, desc = 'Right' }
maps.n['<leader>.'] = { '<cmd>cd %:p:h<cr>', desc = 'Set CWD' }

-- NeoTree
if is_available 'Comment.nvim' then
  -- maps.n["<leader>/"] = {
  --   function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
  --   desc = "Comment line",
  -- }
  maps.v['<leader>/'] = {
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    desc = 'Toggle comment line',
  }
end
-- GitSigns
if is_available 'gitsigns.nvim' then
  maps.n['<leader>g'] = sections.g
  maps.n[']g'] = {
    function()
      require('gitsigns').next_hunk()
    end,
    desc = 'Next Git hunk',
  }
  maps.n['[g'] = {
    function()
      require('gitsigns').prev_hunk()
    end,
    desc = 'Previous Git hunk',
  }
  maps.n['<leader>gl'] = {
    function()
      require('gitsigns').blame_line()
    end,
    desc = 'View Git blame',
  }
  maps.n['<leader>gL'] = {
    function()
      require('gitsigns').blame_line { full = true }
    end,
    desc = 'View full Git blame',
  }
  maps.n['<leader>gp'] = {
    function()
      require('gitsigns').preview_hunk()
    end,
    desc = 'Preview Git hunk',
  }
  maps.n['<leader>gh'] = {
    function()
      require('gitsigns').reset_hunk()
    end,
    desc = 'Reset Git hunk',
  }
  maps.n['<leader>gr'] = {
    function()
      require('gitsigns').reset_buffer()
    end,
    desc = 'Reset Git buffer',
  }
  maps.n['<leader>gs'] = {
    function()
      require('gitsigns').stage_hunk()
    end,
    desc = 'Stage Git hunk',
  }
  maps.n['<leader>gS'] = {
    function()
      require('gitsigns').stage_buffer()
    end,
    desc = 'Stage Git buffer',
  }
  maps.n['<leader>gu'] = {
    function()
      require('gitsigns').undo_stage_hunk()
    end,
    desc = 'Unstage Git hunk',
  }
  maps.n['<leader>gd'] = {
    function()
      require('gitsigns').diffthis()
    end,
    desc = 'View Git diff',
  }
end
-- [[ SNIPS ]]
maps.n['<leader><leader>s'] = {
  '<cmd>source ~/.config/nvim/lua/simon/snippets<cr>',
  desc = 'reload snippets',
}
-- the utils.buffer stuff is too much of a pain in the ass for now so Ill leave it commented out
--
-- maps.n["<leader>bl"] = { function() require("simon.utils.buffer").move(vim.v.count > 0 and vim.v.count or 1) end, desc = "Move buffer tab right",
-- }
-- maps.n["<leader>bh"] = { function() require("simon.utils.buffer").move(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Move buffer tab left",
-- }
--
-- maps.n["<leader>bb"] = { function() require("simon.utils.status").heirline.buffer_picker(function(bufnr) vim.api.nvim_win_set_buf(0, bufnr) end) end, desc = "Select buffer from tabline",
-- }
--
-- maps.n["<leader>bd"] = {
--   function() require("astronvim.utils.status").heirline.buffer_picker( function(bufnr) require("astronvim.utils.buffer").close(bufnr) end) end,
--   desc = "Delete buffer from tabline",
-- }

-- set_mappings(maps, base_opts)
utils.set_mappings(maps)
