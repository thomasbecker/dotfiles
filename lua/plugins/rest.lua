return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
    },
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("rest-nvim").setup()
    end,
    keys = {
      { mode = { "n", "v" }, "<leader>rr", "<cmd>Rest run<cr>", desc = "Rest run" },
      { mode = { "n", "v" }, "<leader>rl", "<cmd>Rest run last<cr>", desc = "Re-run last request" },
    },
  },
}
