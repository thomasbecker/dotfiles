return {
  {
    "sQVe/sort.nvim",
    lazy = true,
    keys = {
      { mode = { "n" }, "go", "<cmd>Sort<cr>", desc = "Sort" },
      { mode = { "v" }, "go", "<esc><cmd>Sort<cr>", desc = "Sort" },
    },
  },
}
