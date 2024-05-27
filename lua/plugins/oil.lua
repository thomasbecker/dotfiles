return {

  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    keys = {
      { mode = { "n" }, "<leader>oi", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
    opts = {
      keymaps = {
        ["<C-v>"] = "actions.select_vsplit",
        ["<C-s>"] = nil,
      },
    },
  },
}
