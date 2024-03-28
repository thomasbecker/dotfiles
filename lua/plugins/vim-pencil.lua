return {
  {
    "preservim/vim-pencil",
    lazy = true,
    -- enabled = false,
    keys = {
      { mode = { "n" }, "<leader>bf", "<cmd>PFormatToggle<cr><cmd>PencilHard<cr>", desc = "Toggle pencil format" },
    },
  },
}
