return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    opts = {
      keymaps = {
        ["<S-v>"] = "actions.select_vsplit",
        ["<S-h>"] = "actions.select_split",
        ["<C-s>"] = false,
        ["<C-h>"] = false,
      },
      columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
      },
      view_options = {
        show_hidden = true,
      },
    },
    keys = {
      { mode = { "n" }, "<leader>oi", "<cmd>Oil --float<cr>", desc = "Open parent directory" },
    },
  },
}
