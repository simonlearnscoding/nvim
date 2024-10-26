-- "gc" to comment visual regions/lines
return {
  {
    'JoosepAlviste/nvim-ts-context-commentstring',

    config = function()
      require('ts_context_commentstring').setup {
        enable_autocmd = false,
      }
    end,
  },
  {
    'terrortylor/nvim-comment',
    event = 'BufReadPost',
    config = function()
      require('nvim_comment').setup {
        hook = function()
          require('ts_context_commentstring').update_commentstring()
        end,
      }
      vim.keymap.set('n', '<leader>/', ':CommentToggle<CR>')
    end,
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      lazy = false,
    },
  },
}
