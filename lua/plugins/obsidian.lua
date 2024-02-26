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
        name = "Work",
        path = "/Users/tbecker/Library/Mobile Documents/iCloud~md~obsidian/Documents/Work",
      },
      {
        name = "Personal",
        path = "/Users/tbecker/Library/Mobile Documents/iCloud~md~obsidian/Documents/Personal",
      },
    },
    -- Optional, customize how names/IDs for new notes are created.
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,
  },
  keys = {
    { mode = { "n" }, "<leader>on", "<cmd>ObsidianNew<cr>", desc = "Obsidian new" },
    { mode = { "n" }, "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Obsidian search" },
    { mode = { "n" }, "<leader>ot", "<cmd>ObsidianTags<cr>", desc = "Obsidian tags" },
    { mode = { "n" }, "<leader>ow", "<cmd>ObsidianWorkspace<cr>", desc = "Obsidian workspaces" },
    { mode = { "n" }, "<leader>or", "<cmd>ObsidianRename<cr>", desc = "Obsidian rename" },
  },
}
