return {
  { "akinsho/bufferline.nvim", enabled = false },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    "folke/which-key.nvim",
    enabled = function()
      if vim.g.started_by_firenvim == true then
        return false
      else
        return true
      end
    end,
  },
  {
    "folke/noice.nvim",
    enabled = function()
      if vim.g.started_by_firenvim == true then
        return false
      else
        return true
      end
    end,
  },
}
