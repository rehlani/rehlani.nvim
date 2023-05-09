local harpoon = require("harpoon")
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

harpoon.setup()

-- Making marks
vim.keymap.set('n', '<leader>ma', function()
  harpoon_mark.add_file()
end,
  { noremap = true })

-- Go to harpoon
local function jump_to(key)
  harpoon_ui.nav_file(key)
end

vim.keymap.set('n', '<leader>m1', function()
  jump_to(1)
end, { noremap = true })

vim.keymap.set('n', '<leader>m2', function()
  jump_to(2)
end, { noremap = true })

vim.keymap.set('n', '<leader>m3', function()
  jump_to(3)
end, { noremap = true })
