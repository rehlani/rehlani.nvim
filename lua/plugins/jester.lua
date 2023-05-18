return {
  {
    "David-Kunz/jester",
    opts = {
      path_to_jest_run = "./node_modules/.bin/jest",
      dap = {
        name = "jest",
        type = "node2",
        request = "launch",
        sourceMaps = "true",
        disableOptimisticBPs = "true",
      },
    },
  },
}
