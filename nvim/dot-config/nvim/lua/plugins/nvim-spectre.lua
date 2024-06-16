return {
  {
    "nvim-pack/nvim-spectre",
    keys = {
      {
        mode = { "n" },
        "<leader>Ss",
        "<cmd>lua require('spectre').toggle()<CR>",
        desc = "Replace in Files (Spectre)",
      },
      {
        mode = { "n" },
        "<leader>Sw",
        "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
        desc = "Search current word (Spectre)",
      },
      {
        mode = { "v" },
        "<leader>Sw",
        "<esc><cmd>lua require('spectre').open_visual()<CR>",
        desc = "Search current word (Spectre)",
      },
      {
        mode = { "n" },
        "<leader>Sp",
        "<esc><cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
        desc = "Search on current file (Spectre)",
      },
    },
  },
}
