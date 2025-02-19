return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    opts = {},
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      -- {
      --   -- support for image pasting
      --   "HakonHarnes/img-clip.nvim",
      --   event = "VeryLazy",
      --   opts = {
      --     -- recommended settings
      --     default = {
      --       embed_image_as_base64 = false,
      --       prompt_for_file_name = false,
      --       drag_and_drop = {
      --         insert_mode = true,
      --       },
      --       -- required for Windows users
      --       use_absolute_path = true,
      --     },
      --   },
      -- },
      -- Make sure to set this up properly if you have lazy=true
      -- },
    },
    keys = {
      { mode = { "n", "v" }, "<leader>ac", "<cmd>AvanteChat<cr>", desc = "Avante chat" },
      { mode = { "n", "v" }, "<leader>at", "<cmd>AvanteToggle<cr>", desc = "Avante toggle" },
      { mode = { "n", "v" }, "<leader>as", "<cmd>AvanteSwitchProvider<cr>", desc = "Avante switch provider" },
    },
  },
}
