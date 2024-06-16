return {
  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        file_ignore_patterns = { "node_modules", ".git", "%.class" },
        vimgrep_arguments = {
          "rg",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
        },
      },
    },
    keys = {
      {
        "<leader>fs",
        function()
          require("telescope.builtin").find_files({ cwd = "~/.dotfiles", hidden = true })
        end,
        desc = "Find dotfiles",
      },
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>fz",
        function()
          require("telescope.builtin").find_files({ cwd = "~/.config/zsh", hidden = true })
        end,
        desc = "Find Zsh Files",
      },
    },
  },
}
