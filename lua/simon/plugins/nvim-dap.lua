-- For nvim-dap
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
        name = 'My custom launch configuration',
        program = '${workspaceFolder}/main.py',
      }
    }
  end

}
