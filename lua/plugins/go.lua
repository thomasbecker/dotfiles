return {
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
      require("go.format").gofmt()
      require("go.format").goimport()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    keys = {
      { mode = { "n" }, "<leader>gb", "<cmd>GoBuild<cr>", desc = "Go build" },
      { mode = { "n" }, "<leader>gr", "<cmd>GoRun<cr>", desc = "Go run" },
      { mode = { "n" }, "<leader>gt", "<cmd>GoTest<cr>", desc = "Go test" },
      { mode = { "n" }, "<leader>gc", "<cmd>GoCoverage<cr>", desc = "Go coverage toggle" },
      { mode = { "n" }, "<leader>gl", "<cmd>GoLint<cr>", desc = "Go lint" },
      { mode = { "n" }, "<leader>gd", "<cmd>GoDoc<cr>", desc = "Go doc" },
    },
  },
}
