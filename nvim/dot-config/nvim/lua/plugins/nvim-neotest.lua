return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-jest",
    },
    opts = {
      adapters = {
        ["neotest-jest"] = {
          jestCommand = "npm test --",
          jestConfigFile = "jest.config.ts",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        },
      },
    },
    keys = {
      {
        "<leader>tc",
        function()
          require("neotest").output_panel.clear()
        end,
        desc = "Clear output panel",
      },
    },
  },
}
