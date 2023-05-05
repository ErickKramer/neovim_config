-- ===================================================
-- Adapters
-- ====================================================
local dap = require('dap')
local sign = vim.fn.sign_define

sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = '/home/ekramer/.local/share/nvim/mason/bin/codelldb',
    args = {"--port", "${port}"},
  }
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
  {
      -- If you get an "Operation not permitted" error using this, try disabling YAMA:
      --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
      name = "Attach to process",
      type = 'codelldb',  -- Adjust this to match your adapter name (`dap.adapters.<name>`)
      request = 'attach',
      pid = require('dap.utils').pick_process,
      args = {},
    },
}
dap.configurations.rust = dap.configurations.cpp
-- ====================================================
-- Extensions
-- ====================================================
require("dapui").setup()
require("nvim-dap-virtual-text").setup()
-- require('dap-python').setup('~/py_venv/debugpy/bin/python')
require('dap-python').setup()
table.insert(require('dap').configurations.python, {
  type = 'python',
  request = 'launch',
  name = 'Python: ROS2 lauch test',
  program = '/opt/ros/humble/bin/launch_test',
  args = { "${file}" },
})

require('dap-python').test_runner = 'pytest'

