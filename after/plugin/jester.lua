local jester = require("jester")

-- dap_vscode.setup({
--   -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
--   debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
--   -- debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
--   adapters = { 'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node', 'chrome' }, -- which adapters to register in nvim-dap
--   -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
--   -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
--   -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
-- })
-- local js_based_languages = { "typescript", "javascript", "typescriptreact" }
--
-- for _, language in ipairs(js_based_languages) do
--   dap.configurations[language] = {
--     {
--       type = "pwa-node",
--       request = "launch",
--       name = "Launch file",
--       program = "${file}",
--       cwd = "${workspaceFolder}",
--     },
--     {
--       type = "pwa-node",
--       request = "attach",
--       name = "Attach",
--       processId = require 'dap.utils'.pick_process,
--       cwd = "${workspaceFolder}",
--     },
--     {
--       type = "pwa-chrome",
--       request = "launch",
--       name = "Start Chrome with \"localhost\"",
--       url = "http://localhost:3000",
--       webRoot = "${workspaceFolder}",
--       userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
--     }
--   }
-- end

-- dapui.setup({})
--
-- dap.listeners.after.event_initialized["dapui_config"] = function()
--   dapui.open({}) end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close({})
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close({})
-- end
--
-- vim.keymap.set('n', '<leader>ui', require 'dapui'.toggle)

jester.setup({
  path_to_jest_run = 'yarn test',
  dap = { -- debug adapter configuration
    type = 'pwa-node',
    request = 'launch',
    cwd = vim.fn.getcwd(),
    runtimeArgs = {'--inspect-brk', '$path_to_jest', '--no-coverage', '-t', '$result', '--', '$file'},
    args = { '--no-cache' },
    sourceMaps = false,
    protocol = 'inspector',
    skipFiles = {'<node_internals>/**/*.js'},
    console = 'integratedTerminal',
    port = 9229,
    disableOptimisticBPs = true
  }
})

vim.keymap.set('n', '<leader>t', jester.run, { noremap=true })
vim.keymap.set('n', '<leader>T', jester.debug, { noremap=true })
