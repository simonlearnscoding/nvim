return {
  'akinsho/bufferline.nvim',

  config = function()
    local bufferline = require 'bufferline'

    bufferline.setup {
      options = {
        -- mode = "tabs",
        separator_style = 'slant',
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
      },
    }
  end,
}
