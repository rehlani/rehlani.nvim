local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup({
  extensions = {
    file_browser = {
      path = "%:p:h",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      grouped = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
})

telescope.load_extension "file_browser"
telescope.load_extension "lazygit"
telescope.load_extension "harpoon"

vim.keymap.set('n', '<leader>f', builtin.git_files, {})
vim.keymap.set('n', '<leader>F', builtin.find_files, {})
vim.keymap.set({ 'n', 'i' }, '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>s', builtin.live_grep)
vim.keymap.set('n', '<leader>b', builtin.buffers)
vim.keymap.set('n', '<leader>lr', builtin.lsp_references)
-- File Explorer
vim.keymap.set(
  "n",
  "<leader>e",
  telescope.extensions.file_browser.file_browser,
  { noremap = true }
)
-- File Explore from project root
vim.keymap.set(
  "n",
  "<leader>E",
  function()
    telescope.extensions.file_browser.file_browser({ path = vim.loop.cwd() })
  end,
  { noremap = true }
)

-- Git stuff
vim.keymap.set('n', '<leader>go', builtin.git_status)

-- harpoon
vim.keymap.set('n', '<leader>mm', ':Telescope harpoon marks<cr>', { noremap = true, silent = true })
