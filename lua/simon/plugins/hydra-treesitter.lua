return {
  'anuvyklack/hydra.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
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

      -- hint = {
      --   type = 'statusline'
      -- },
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
