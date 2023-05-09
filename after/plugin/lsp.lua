local lsp = require("lsp-zero")
local prettier = require("prettier")
local cmp = require('cmp')
local luasnip = require('luasnip')

lsp.preset({})

lsp.ensure_installed({
  'tsserver',
  'eslint'
})

local cmp_action = lsp.cmp_action()

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'buffer', keyword_length = 4},
    {name = 'luasnip'},
  },
  mapping = {
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
    ['<Tab>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  },
  snippet= {
    expand = function (args)
      luasnip.lsp_expand(args.body)
    end
  }
})

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.22+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
  ["null-ls"] = {
    condition = function()
      return prettier.config_exists({
        -- if `false`, skips checking `package.json` for `"prettier"` key
        check_package_json = true,
      })
    end,
    runtime_condition = function(params)
      -- return false to skip running prettier
      return true
    end,
    timeout = 5000,
  }
})


lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "<leader>j", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>k", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("i", "<C-l>", function()
    if luasnip.choice_active() then
      luasnip.change_choice(1)
    end
  end)
  vim.keymap.set('n', '<leader>lf', function()
    if prettier.config_exists({ check_package_json = true })
    then
      vim.cmd('Prettier')
    else
      vim.lsp.format()
    end
  end, opts)
end)


local mason_nullls = require("mason-null-ls")
mason_nullls.setup({
  ensure_installed = { 'prettier', 'eslint' },
  automatic_installation = true,
  automatic_setup = true,
})
-- mason_nullls.setup_handlers({})

-- organize_imports
local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.fn.expand("%:p") },
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

vim.api.nvim_create_user_command('OrganizeImports', organize_imports, {})

lsp.setup()

