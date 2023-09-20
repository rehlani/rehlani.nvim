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

-- Splits
map({ "n", "v" }, "<C-h>", "<C-w>h")
map({ "n", "v" }, "<C-l>", "<C-w>l")
map({ "n", "v" }, "<C-k>", "<C-w>k")
map({ "n", "v" }, "<C-j>", "<C-w>j")

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

-- harpoon
map({ "n", "v" }, "<leader>ma", function()
  require("harpoon.mark").add_file()
end, { desc = "Add current file to harpoon" })
map({ "n", "v" }, "<leader>m1", function()
  require("harpoon.ui").nav_file(1)
end, { desc = "Navigate to file 1" })
map({ "n", "v" }, "<leader>m2", function()
  require("harpoon.ui").nav_file(2)
end, { desc = "Navigate to file 2" })
map({ "n", "v" }, "<leader>m3", function()
  require("harpoon.ui").nav_file(3)
end, { desc = "Navigate to file 3" })

map({ "n", "v" }, "<leader>mm", function()
  require("harpoon.ui").toggle_quick_menu()
end, { desc = "Toggle quick menu" })

map({ "n", "v" }, "<leader>mf", function()
  require("harpoon.ui").nav_next() -- navigates to next mark
end, { desc = "Next file" })

map({ "n", "v" }, "<leader>mb", function()
  require("harpoon.ui").nav_prev() -- navigates to next mark
end, { desc = "Previous file" })

map({ "n"}, "<leader>E", "<cmd>Oil<cr>")

-- missing keymap for snakecase
map({ "n", "v"}, "gas", function () 
  require("textcase").current_word('to_snake_case')
end, {desc = "Convert to snake_case"})

map({ "n", "v"}, "gaS", function () 
  require("textcase").lsp_rename('to_snake_case')
end, {desc = "Lsp rename to snake_case"})

-- telescrope
map({"n", "v"}, "<leader>e", function()
  require("telescope").extensions.file_browser.file_browser({path='%:p:h'})
end)
map({"n", "v"}, "<leader>E", function()
  require("telescope").extensions.file_browser.file_browser()
end)
