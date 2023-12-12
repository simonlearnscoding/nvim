return {
  'mfussenegger/nvim-dap',
  config = function()
    local dap = require('dap')
    dap.adapters.python = {
      type = 'executable',

      command = '/usr/bin/python3',
      args = { '-m', 'debugpy.adapter' },
    }
    dap.configurations.python = {
      {
        type = 'python',
        request = 'launch',
        name = 'launch main.py',
        program = '${workspaceFolder}/main.py',
      },

      {
        type = "python",
        request = "launch",
        name = "Launch Current File",
        program = "${file}",
      }
    }
  end

}
