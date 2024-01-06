return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    init = function()
      require("harpoon"):setup()
      local conf = require("telescope.config").values
      function Toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon Marks",
            finder = require("telescope.finders").new_table({
              results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
          })
          :find()
      end
    end,
    keys = {
      {
        "<leader>a",
        function()
          require("harpoon"):list():append()
        end,
        silent = true,
        desc = "Add harpoon mark",
      },
      {
        "<C-e>",
        function()
          local harpoon = require("harpoon")
          Toggle_telescope(harpoon:list())
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
