--debugger setup
vim.keymap.set('n', '<leader>ds', function() require('dap').continue() end)
vim.keymap.set('n', '<leader>dt', function() require('dap-go').debug_test() end)
vim.keymap.set('n', '<F1>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F2>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F3>', function() require('dap').step_out() end)
vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<leader>cb', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set('n', '<leader>B', function() require('dap').clear_breakpoints() end)
vim.keymap.set('n', '<leader>dl', function() require('dap').list_breakpoints() end)

-- vim.keymap.set('n', '<Leader>lp',
--     function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
-- vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
-- vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)

vim.keymap.set('n', '<leader>dv', function() require('dapui').open() end)
vim.keymap.set('n', '<leader>dc', function() require('dapui').close() end)

require('dapui').setup()
require('nvim-dap-virtual-text').setup()
require('dap-go').setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
