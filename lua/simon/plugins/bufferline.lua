return {
  'akinsho/bufferline.nvim',
  config = function()
    local bufferline = require 'bufferline'

    bufferline.setup {
      options = {
        groups = {
          items = {
            require('bufferline.groups').builtin.pinned:with { icon = '' },
          },
        },
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          if context.buffer:current() then
            return ''
          end
          if level ~= 'error' then
            return ''
          end
          return ''
        end,
        separator_style = 'thin',
        always_show_bufferline = true,

        indicator_icon = '▎',
        -- buffer_close_icon = '',
        -- close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = true,
        enforce_regular_tabs = true,
        color_icons = true,

        -- tab_size = 10,
        modified_icon = '',
        -- max_name_length = 12,
        --
        persist_buffer_sort = true,
        -- themable = true,
        diagnostics = 'nvim_lsp',
        hover = {
          enabled = true,
          delay = 100,
          reveal = { 'close' },
        },
      },
    }
    vim.keymap.set('n', '<leader>bt', ':BufferLineTogglePin<CR>', { desc = 'Toggle Pinned' })

    -- Map a key to toggle sorting order
    -- vim.keymap.set(
    --   'n',
    --   '<leader>bs',
    --   "<cmd>lua require'bufferline'.sort_by(function (buf_a, buf_b) return buf_a.modified < buf_b.modified end)<CR>",
    --   { desc = 'Sort Buffers by last edit' }
    -- )
    vim.keymap.set('n', '<leader>bs', "<cmd>lua require'bufferline'.sort_by(directory)<CR>", { desc = 'Sort Buffers by last edit' })
  end,
}
