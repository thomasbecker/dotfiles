return {
  {
    "rest-nvim/rest.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "http")
      end,
    },
    ft = "http",
    config = function()
      require("telescope").load_extension("rest")
    end,
    keys = {
      { mode = { "n", "v" }, "<leader>rr", "<cmd>Rest run<cr>", desc = "Rest: run" },
      { mode = { "n", "v" }, "<leader>rl", "<cmd>Rest run last<cr>", desc = "Rest: Re-run last request" },
      { mode = { "n", "v" }, "<leader>re", "<cmd>Telescope rest select_env<cr>", desc = "Rest: Select env file" },
    },
  },
}
