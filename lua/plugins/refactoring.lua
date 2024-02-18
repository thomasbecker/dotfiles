return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-treesitter/playground",
    },
    cmd = { "Refactoring" },
    init = function()
      require("refactoring").setup({
        prompt_func_return_type = {
          java = true,
          go = true,
        },
        prompt_func_param_type = {
          java = true,
          go = true,
        },
        show_success_message = true,
      })
    end,
    keys = {
      { mode = { "x" }, "<leader>re", "<cmd>Refactor extract<cr>", desc = "Refactor extract" },
      { mode = { "x" }, "<leader>rf", "<cmd>Refactor extract_to_file<cr>", desc = "Refactor extract to file" },
      { mode = { "x" }, "<leader>rv", "<cmd>Refactor extract_var<cr>", desc = "Refactor extract variable" },

      { mode = { "n", "x" }, "<leader>ri", "<cmd>Refactor inline_var<cr>", desc = "Refactor inline variable" },
      { mode = { "n" }, "<leader>rI", "<cmd>Refactor inline_func<cr>", desc = "Refactor inline function" },

      { mode = { "n" }, "<leader>rB", "<cmd>Refactor extract_block<cr>", desc = "Refactor extract block" },
      {
        mode = { "n" },
        "<leader>rbf",
        "<cmd>Refactor extract_block_to_file<cr>",
        desc = "Refactor extract block to file",
      },
    },
  },
}
