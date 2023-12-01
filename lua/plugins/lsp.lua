return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
      servers = {
        tsserver = {
          init_options = {
            preferences = {
              -- other preferences...
              importModuleSpecifierPreference = "relative",
              importModuleSpecifierEnding = "minimal",
            },
          },
        },
      },
    },
  },
}
