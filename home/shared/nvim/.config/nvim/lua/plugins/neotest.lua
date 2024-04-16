return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- JEST
    "nvim-neotest/neotest-jest",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
          -- smell if we jave yarn or npm????
          jestCommand = "yarn test",
          -- jestConfigFile = "custom.jest.config.ts",
          -- env = { CI = true },
          cwd = function(_path)
            return vim.fn.getcwd()
          end,
        }),
      },
    })
  end,
}
