return {
  {
    "mxsdev/nvim-dap-vscode-js",
    requires = { "mfussenegger/nvim-dap" },

    opts = function(_, opts)
      opts.adapters = { "pwa-node" }
      opts.debugger_path = "/Users/rehan.lalani/Projects/vscode-js-debug"

      local dap = require("dap")
      for _, language in ipairs({ "typescript", "typescriptreact", "javascript" }) do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end
    end,
  },
}
-- return {
--   "mfussenegger/nvim-dap",
--   optional = true,
--   dependencies = {
--     {
--       "williamboman/mason.nvim",
--       opts = function(_, opts)
--         opts.ensure_installed = opts.ensure_installed or {}
--         table.insert(opts.ensure_installed, "js-debug-adapter")
--       end,
--     },
--   },
--   opts = function()
--     local dap = require("dap")
--     for _, language in ipairs({ "typescript", "typescriptreact", "javascript" }) do
--       if not dap.configurations[language] then
--         dap.configurations[language] = {
--           {
--             type = "chrome",
--             name = "Attach",
--             request = "attach",
--             program = "${file}",
--             cwd = vim.fn.getcwd(),
--             sourceMaps = true,
--             protocol = "inspector",
--             port = 9229,
--             webRoot = "${workspaceFolder}",
--           },
--         }
--       end
--     end
--   end,
-- }
