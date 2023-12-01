return ({
  -- {
  --   "symbols-outline.nvim",
  --   config = function()
  --     require("symbols-outline").setup({
  --
  --     })
  --   end
  --
  -- },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    dependencies = "nvim-treesitter/nvim-treesitter"

    ,

    config = function()
      -- ignore the diagnostics
      require 'nvim-treesitter.configs'.setup {
        textobjects = {

          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              -- You can optionally set descriptions to the mappings (used in the desc parameter of
              -- nvim_buf_set_keymap) which plugins like which-key display
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              -- You can also use captures from other query groups like `locals.scm`
              ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
            move = {
              enable = true,
              set_jumps = true, -- whether to set jumps in the jumplist
              goto_next_start = {
                ["]f"] = "@function.outer",
                ["]c"] = { query = "@class.outer", desc = "Next class start" },
                --
                -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
                ["]o"] = "@loop.*",
                -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
                --
                -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
              },
              goto_next_end = {
                ["]F"] = "@function.outer",
                ["]C"] = "@class.outer",
              },
              goto_previous_start = {
                ["[f"] = "@function.outer",
                ["[c"] = "@class.outer",
              },
              goto_previous_end = {
                ["[F"] = "@function.outer",
                ["[C"] = "@class.outer",
              },
              -- Below will go to either the start or the end, whichever is closer.
              -- Use if you want more granular movements
              -- Make it even more gradual by adding multiple queries and regex.
              goto_next = {
                ["]i"] = "@conditional.outer",
              },
              goto_previous = {
                ["[i"] = "@conditional.outer",
              }
            },
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * selection_mode: eg 'v'
          -- and should return true of false
          include_surrounding_whitespace = true,
        },
      }
      local Hydra = require('hydra')
      --
      --
      local hint = [[
      _f_: Next Function Body  _c_: Next Class Start
      _F_: Prev Function Body  _C_: Prev Class Start
      _?_: Next if() _g_: Prev Function Def
      _r_: Next return          _R_: Prev return
      _v_: Next Attribute       _V_: Prev Attribute
      _p_: Next Parameter       _P_: Prev Parameter
      _K_: Prev Block           _J_: Next Block
      _=_: Assignment
      _q_: Quit
      ]]
      Hydra({

        hint = hint,
        name = 'Text Objects',
        config = {

          -- on_enter =
          --     function()
          --       vim.cmd('SymbolsOutline')
          --     end,


          color = 'pink',
          invoke_on_body = true,
          hint = {
            position = 'bottom-right',
            border = 'rounded'
          },
        },
        mode = { 'n', 'x' },
        body = '<leader>a', -- Replace '<leader>t' with your preferred prefix
        heads = {

          { '<leader>q', nil,                                                                                           { exit = true, nowait = true } },
          { 'q',         nil,                                                                                           { exit = true, nowait = true } },
          { 'a',         'a',                                                                                           { exit = true, nowait = true } },
          { 'I',         'I',                                                                                           { exit = true, nowait = true } },
          { 'A',         'A',                                                                                           { exit = true, nowait = true } },
          { 'o',         'o',                                                                                           { exit = true, nowait = true } },
          { 'O',         'O',                                                                                           { exit = true, nowait = true } },
          { 'v',         ':lua require"nvim-treesitter.textobjects.move".goto_next_start("@attribute.inner")<CR>',      { desc = 'Next Function Start' } },
          { 'V',         ':lua require"nvim-treesitter.textobjects.move".goto_previous_start("@attribute.inner")<CR>',  { desc = 'Next Function Start' } },
          -- { '/',         ':lua require"nvim-treesitter.textobjects.move".goto_next_start("@comment.inner")<CR>',         { desc = 'Next Function Start' } },
          -- { 'a',         ':lua require"nvim-treesitter.textobjects.move".goto_next_start("@attribute.inner")<CR>',       { desc = 'Next Function Start' } },

          { '[',         ':lua require"nvim-treesitter.textobjects.move".goto_previous_start("@block.outer")<CR>',      { desc = 'Next Function Start' } },

          { ']',         ':lua require"nvim-treesitter.textobjects.move".goto_next_start("@block.inner")<CR>',          { desc = 'Next Function Start' } },


          { '=',         ':lua require"nvim-treesitter.textobjects.move".goto_next_start("@assignment.inner")<CR>',     { desc = 'Next Function Start' } },
          -- { 'j',         'j',                                                                                            { silent = true } },
          -- { 'k',         'k', },
          -- { 'p',         'p', },
          -- { 'l',         'l', },
          -- { 'h',         'h', },
          -- { '/',         '/', },
          -- { 'y',         'y', },
          { 'F',         ':lua require"nvim-treesitter.textobjects.move".goto_previous_start("@assignment.inner")<CR>', { desc = 'Last Function Start' } },
          { 'g',         ':lua require"nvim-treesitter.textobjects.move".goto_next_start("@function.outer")<CR>',       { desc = 'Next Function Start' } },
          -- { 'G',         ':lua require"nvim-treesitter.textobjects.move".goto_previous_start("@function.outer")<CR>',    { desc = 'Last Function Start' } },
          { 'f',         ':lua require"nvim-treesitter.textobjects.move".goto_next_start("@function.inner")<CR>',       { desc = 'Next Function Start' } },
          { 'c',         ':lua require"nvim-treesitter.textobjects.move".goto_next_start("@class.inner")<CR>',          { desc = 'Next Function End' } },
          { 'C',         ':lua require"nvim-treesitter.textobjects.move".goto_previous_start("@class.inner")<CR>',      { desc = 'Next Class Start' } },
          { 'gg',        'gg',                                                                                          { desc = 'Next Class Start' } },
          { '?',         ':lua require"nvim-treesitter.textobjects.move".goto_next_start("@conditional.inner")<CR>',    { desc = 'Next if()' } },
          { 'r',         ':lua require"nvim-treesitter.textobjects.move".goto_next_start("@return.outer")<CR>',         { desc = 'Next if()' } },
          { 'R',         ':lua require"nvim-treesitter.textobjects.move".goto_previous_start("@return.outer")<CR>',     { desc = 'Previous if()' } },
          { 'P',         ':lua require"nvim-treesitter.textobjects.move".goto_previous_start("@parameter.inner")<CR>',  { desc = 'Previous if()' } },
          { 'p',         ':lua require"nvim-treesitter.textobjects.move".goto_next_start("@parameter.inner")<CR>',      { desc = 'Next if()' } },
          { 'K',         ':lua require"nvim-treesitter.textobjects.move".goto_previous_start("@block.inner")<CR>',      { desc = 'Previous if()' } },
          { 'J',         ':lua require"nvim-treesitter.textobjects.move".goto_next_start("@block.inner")<CR>',          { desc = 'Next if()' } },
          -- Add more heads as needed
        }
      })
    end,

  }
})
