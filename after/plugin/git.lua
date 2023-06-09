local gitsigns = require('gitsigns')

vim.keymap.set('n', '<leader>gL', '<cmd>Git blame<cr>')

gitsigns.setup({
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', '<leader>gj', function()
      if vim.wo.diff then return '<leader>gj' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '<leader>gk', function()
      if vim.wo.diff then return '<leader>gk' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>gl', function() gs.blame_line{full=true} end)
    map('n', '<leader>gd', gs.diffthis)

  end
})

vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>')
