return {
  {
    "preservim/vim-pencil",
    lazy = true,
    ft = { "markdown", "text" },
    -- enabled = false,
    keys = {
      { mode = { "n" }, "<leader>bf", "<cmd>PFormatToggle<cr>", desc = "Toggle pencil format" },
    },
  },
}
