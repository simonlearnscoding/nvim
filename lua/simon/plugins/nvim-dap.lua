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


    dap.adapters.node2 = {
      type = 'executable',
      command = 'node', -- Path to Node.js executable
      args = { '--inspect-brk', '${workspaceFolder}/node_modules/next/dist/bin/next' },
    }


    dap.configurations.javascript = {
      {
        type = 'node2',
        request = 'launch',
        name = 'Launch Next.js',
        program = '${workspaceFolder}/node_modules/next/dist/bin/next',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        -- console = 'integratedTerminal',
        env = function()
          local variables = {}
          -- Set environment variables here
          return variables
        end,
      },
    }
  end

}
