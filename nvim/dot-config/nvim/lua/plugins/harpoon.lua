return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = true,
    opts = {
      settings = {
        save_on_toggle = true,
        save_on_change = true,
      },
    },
    config = function()
      local harpoon = require("harpoon")
      harpoon:extend({
        UI_CREATE = function(cx)
          vim.keymap.set("n", "<C-v>", function()
            harpoon.ui:select_menu_item({ vsplit = true })
          end, { buffer = cx.bufnr })

          vim.keymap.set("n", "<C-x>", function()
            harpoon.ui:select_menu_item({ split = true })
          end, { buffer = cx.bufnr })

          vim.keymap.set("n", "<C-t>", function()
            harpoon.ui:select_menu_item({ tabedit = true })
          end, { buffer = cx.bufnr })
        end,
      })
      harpoon:extend(require("harpoon.extensions").telescope)
    end,
    keys = {
      {
        "<leader>a",
        function()
          require("harpoon"):list():add()
        end,
        silent = true,
        desc = "Add harpoon mark",
      },
      {
        "<C-e>",
        function()
          require("telescope").extensions.harpoon.marks()
        end,
        silent = true,
        desc = "Harpoon toggle",
      },
      {
        "<C-S-P>",
        function()
          require("harpoon"):list():prev({ ui_nav_wrap = true })
        end,
        silent = true,
        desc = "Harpoon prev",
      },
      {
        "<C-S-N>",
        function()
          require("harpoon"):list():next({ ui_nav_wrap = true })
        end,
        silent = true,
        desc = "Harpoon next",
      },
    },
  },
}
