return {
  '3rd/diagram.nvim',
  dependencies = {
    '3rd/image.nvim',
  },
  config = function()
    require('diagram').setup {
      -- Configuration options for diagram.nvim
      -- You can customize the settings here
      integrations = {
        require 'diagram.integrations.markdown',
      },
      renderer_options = {
        -- Example: Set the default renderer to 'svg'
        mermaid = {
          theme = 'dark',
          background = 'transparent',
          scale = 2,
        },
      },
    }
  end,
}
