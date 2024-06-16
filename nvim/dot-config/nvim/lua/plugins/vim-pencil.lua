return {
  {
    "preservim/vim-pencil",
    lazy = true,
    -- enabled = false,
    config = function()
      vim.g["pencil#textwidth"] = 80
    end,
    keys = {
      { mode = { "n" }, "<leader>bf", "<cmd>PencilToggle<cr>", desc = "Toggle pencil format" },
      { mode = { "n" }, "<leader>bt", "<cmd>PencilHard<cr>", desc = "PencilHard" },
      { mode = { "n" }, "<leader>bs", "<cmd>PencilSoft<cr>", desc = "PencilSoft" },
    },
  },
}
