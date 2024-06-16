return {
  {
    "tris203/precognition.nvim",
    event = "VeryLazy",
    keys = {
      {
        mode = { "n" },
        "<leader>up",
        "<cmd>lua require('precognition').toggle()<CR>",
        { silent = true, desc = "Toggle precognition" },
      },
      {
        mode = { "n" },
        "<leader>uP",
        "<cmd>lua require('precognition').peek()<CR>",
        { silent = true, desc = "Peek precognition" },
      },
    },
  },
}
