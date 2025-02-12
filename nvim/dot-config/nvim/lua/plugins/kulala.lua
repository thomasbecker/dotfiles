return {
  {
    "mistweaverco/kulala.nvim",
    opts = {
      default_view = "verbose",
    },
    keys = {
      {
        mode = { "n", "v" },
        "<leader>Re",
        "<cmd>lua require('kulala').set_selected_env()<cr>",
        desc = "Select environment",
      },
    },
  },
}
