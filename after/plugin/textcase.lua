local textcase = require('textcase')

textcase.setup {}

-- Telescope
vim.api.nvim_set_keymap('n', 'ga.', '<cmd>TextCaseOpenTelescope<CR>', { desc = "Telescope" })
vim.api.nvim_set_keymap('v', 'ga.', "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })

-- Quick commands
vim.keymap.set({ 'n', 'v' }, 'gac', function()
  textcase.current_word('to_camel_case')
end, {})

vim.keymap.set({ 'n', 'v' }, 'gas', function()
  textcase.current_word('to_snake_case')
end, {})
