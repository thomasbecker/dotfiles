return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<leader>a",
        function()
          require("harpoon.mark").add_file()
        end,
        silent = true,
        desc = "Add harpoon mark",
      },
      {
        "<C-e>",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        silent = true,
        desc = "Harpoon toggle",
      },
      {
        "<C-S-P>",
        function()
          require("harpoon.ui").nav_prev()
        end,
        silent = true,
        desc = "Harpoon prev",
      },
      {
        "<C-S-N>",
        function()
          require("harpoon.ui").nav_next()
        end,
        silent = true,
        desc = "Harpoon next",
      },
    },
  },
}
