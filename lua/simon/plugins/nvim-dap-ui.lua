return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "mfussenegger/nvim-dap", 'folke/neodev.nvim',

    'Weissle/persistent-breakpoints.nvim',
  },
  config = function()
    -- set up persistent breakpoints
    require('persistent-breakpoints').setup {
      load_breakpoints_event = { "BufReadPost" }
    }

    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    require("neodev").setup({
      library = { plugins = { "nvim-dap-ui" }, types = true },
    })
    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'red', linehl = '', numhl = '' })
    dap.listeners.before.event_exited["dapui_config"] = function()
      -- dapui.close()
    end
    require("dapui").setup({
      layouts = { {
        elements = { {
          id = "repl",
          size = 0.65
        },
          {
            id = "scopes",
            size = 0.2
          },
          {
            id = "watches",
            size = 0.15
          }

        },
        position = "bottom",
        size = 10
      } }
    })
    local Hydra = require('hydra')


    local hint = [[
_<C-j>_: step into   _B_: Clear Breakpoints
_<C-l>_: step over   _<CR>_: Continue/Start
_<C-k>_: step out    _b_: Breakpoint
  _K_: Eval          _q_: exit
 _c_: to cursor      _C_: Toggle UI

 _w_: add watch     _f_: find BP
_e_: eval expression  _?_: Cond BP
]]

    local dap_hydra = Hydra({
      hint = hint,
      config = {
        on_enter = function()
          require('dapui').toggle()
        end,
        on_exit = function()
          require('dapui').toggle()
          require('dap').close()
        end,
        color = 'pink',
        -- offset = 20,
        invoke_on_body = true,
        hint = {
          position = 'top-right',
          border = 'rounded'
        },
      },
      name = 'debug',
      mode = { 'n', 'x' },
      body = '<leader>db',
      heads = {
        { '<C-l>',      dap.step_over,                                                                                                        { silent = true } },
        { '<C-j>',      dap.step_into,                                                                                                        { silent = true } },
        { '<C-k>',      dap.step_out,                                                                                                         { silent = true } },
        { 'c',          dap.run_to_cursor,                                                                                                    { silent = true } },
        { '<CR>',       dap.continue,                                                                                                         { silent = true } },
        { 'C',          ":lua require('dapui').toggle()<cr>:DapVirtualTextForceRefresh<CR>",                                                  { silent = true } },
        { 'b',          "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>",                                             { silent = true } },
        { '?',          "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>",                                    { silent = true } },
        { 'B',          "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>",                                         { silent = true } },
        { 'f',          "<cmd>Telescope dap list_breakpoints<cr>",                                                                            { silent = true } },
        { 'e',          "require('dapui').eval()",                                                                                            { silent = true } },


        { 'K',          ":lua require('dap.ui.widgets').hover()<CR>",                                                                         { silent = true } },
        { 'w',          ":lua require('dapui').float_element('watches', { enter = true, position = 'center', width = 80, height = 20 })<CR>", { silent = true } },


        { 'q',          nil,                                                                                                                  { exit = true, nowait = true } },
        { '<leader>q',  nil,                                                                                                                  { exit = true, nowait = true } },
        { '<leader>db', nil,                                                                                                                  { exit = true, nowait = true } },
      }
    })
  end

}
