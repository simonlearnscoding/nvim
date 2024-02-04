return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'mfussenegger/nvim-dap-python',
    -- {
    --   'microsoft/vscode-js-debug',
    --   build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
    -- },
    {
      'mxsdev/nvim-dap-vscode-js',
      run = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
    },
    'leoluz/nvim-dap-go',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    -- Set keymaps to control the debugger
    -- vim.keymap.set('n', '<F5>', require('dap').continue)
    -- vim.keymap.set('n', '<F10>', require('dap').step_over)
    -- vim.keymap.set('n', '<F11>', require('dap').step_into)
    -- vim.keymap.set('n', '<leader>dU', require('dapui').toggle())
    -- vim.keymap.set('n', '<F12>', require('dap').step_out)
    -- vim.keymap.set('n', '<leader>B', function()
    --   require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    -- end)

    require('dap-vscode-js').setup {
      debugger_path = vim.fn.stdpath 'data' .. '/lazy/vscode-js-debug', -- Path to vscode-js-debug installation.
      adapters = { 'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node',
        'chrome' },
    }
    local js_based_languages = { 'typescript', 'javascriptreact', 'javascript', 'typescriptreact' }
    for _, language in ipairs(js_based_languages) do
      require('dap').configurations[language] = {
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          cwd = '${workspaceFolder}',
        },
        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Attach',
          processId = require('dap.utils').pick_process,
          cwd = '${workspaceFolder}',
        },
        {
          type = 'pwa-chrome',
          request = 'launch',
          name = 'Start Chrome with "localhost"',
          url = 'http://localhost:3000',
          webRoot = '${workspaceFolder}',
          userDataDir = '${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir',
        },
      }
    end
    require('dapui').setup {}
    -- dap.listeners.after.event_initialized['dapui_config'] = function()
    --   dapui.open {}
    -- end
    -- dap.listeners.before.event_terminated['dapui_config'] = function()
    --   dapui.open {}
    -- end
    -- dap.listeners.before.event_exited['dapui_config'] = function()
    --   dapui.open {}
    -- end
    -- vim.keymap.set('n', '<leader>ui', require('dapui').toggle)

    -- dap.adapters.python = {
    --   type = 'executable',
    --   command = 'python3',
    --   args = { '-m', 'debugpy.adapter' },
    -- }
    --
    -- dap.configurations.python = {
    --   {
    --     -- The name of the configuration. Appears in the menu for selecting configuration.
    --     name = 'Python',
    --     type = 'python',
    --
    --     -- Request type of configuration. Can be 'launch' or 'attach'.
    --     request = 'launch',
    --
    --     -- The program that you want to debug.
    --     program = '${file}',
    --
    --     -- Automatically stop target after launch. If not specified, target does not stop.
    --     stopOnEntry = true,
    --
    --     -- Use this for environment variables such as PYTHONPATH.
    --     pythonPath = function()
    --       local cwd = vim.fn.getcwd()
    --       if vim.fn.executable 'direnv' == 1 then
    --         return vim.fn.trim(vim.fn.system('direnv exec ' .. cwd .. ' echo $VIRTUAL_ENV'))
    --       elseif vim.fn.exists '$VIRTUAL_ENV' then
    --         return vim.fn.getenv 'VIRTUAL_ENV' .. '/bin/python'
    --       else
    --         return '/usr/bin/python3'
    --       end
    --     end,
    --   },
    -- }
  end,
}
