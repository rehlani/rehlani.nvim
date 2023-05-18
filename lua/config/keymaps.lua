-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- clipboard
map({ "n", "v" }, "<leader>y", '"*y', { desc = "Yank to system clipboard", noremap = false })

-- jest testing
map("n", "<leader>jr", function()
  require("jester").run()
end, { desc = "Jest: run test" })

map("n", "<leader>jf", function()
  require("jester").run_file()
end, { desc = "Jest: run all tests in file" })

map("n", "<leader>jl", function()
  require("jester").run_last()
end, { desc = "Jest: run last test(s)" })

map("n", "<leader>jd", function()
  require("jester").debug()
end, { desc = "Jest: debug test" })

map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "clear highlights" })

map({ "n" }, "<leader>gb", function()
  require("gitsigns").blame_line()
end, { desc = "Git blame line" })

map({ "n", "v" }, "<leader>gl", function()
  require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle blame current line" })
