return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  event = {
    "BufReadPre /Users/tbecker/Library/Mobile Documents/com~apple~CloudDocs/Documents/obsidian/**.md",
    "BufNewFile /Users/tbecker/Library/Mobile Documents/com~apple~CloudDocs/Documents/obsidian/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Library/Mobile Documents/com~apple~CloudDocs/Documents/obsidian/personal",
      },
      {
        name = "work",
        path = "~/Library/Mobile Documents/com~apple~CloudDocs/Documents/obsidian/work",
      },
    },
  },
  keys = {
    { mode = { "n" }, "<leader>on", "<cmd>ObsidianNew<cr>", desc = "Obsidian new" },
    { mode = { "n" }, "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Obsidian search" },
    { mode = { "n" }, "<leader>ot", "<cmd>ObsidianTags<cr>", desc = "Obsidian tags" },
    { mode = { "n" }, "<leader>ow", "<cmd>ObsidianWorkspace<cr>", desc = "Obsidian workspaces" },
    { mode = { "n" }, "<leader>or", "<cmd>ObsidianRename<cr>", desc = "Obsidian rename" },
  },
}
