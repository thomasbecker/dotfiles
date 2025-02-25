return {
  {
    "thomasbecker/obsidian.nvim",
    lazy = true,
    event = {
      "BufReadPre /Users/tbecker/Library/Mobile Documents/com~apple~CloudDocs/Documents/obsidian/**.md",
      "BufNewFile /Users/tbecker/Library/Mobile Documents/com~apple~CloudDocs/Documents/obsidian/**.md",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      picker = {
        name = "snacks.pick",
      },
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
      templates = {
        subdir = "templates",
      },
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "notes/dailies",
        -- Optional, if you want to change the date format for the ID of daily notes.
        -- date_format = "%Y-%m-%d",
        -- Optional, if you want to change the date format of the default alias of daily notes.
        -- alias_format = "%B %-d, %Y",
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = "default.md",
      },
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
      follow_url_func = function(url)
        vim.fn.jobstart({ "open", url })
      end,
    },
    keys = {
      { mode = { "n" }, "<leader>on", "<cmd>ObsidianNewFromTemplate<cr>", desc = "Obsidian new" },
      { mode = { "n" }, "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Obsidian new daily today" },
      { mode = { "n" }, "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Obsidian Search" },
      { mode = { "n" }, "<leader>ot", "<cmd>ObsidianTags<cr>", desc = "Obsidian tags" },
      { mode = { "n" }, "<leader>oe", "<cmd>ObsidianTemplate<cr>", desc = "Obsidian template" },
      { mode = { "n" }, "<leader>ow", "<cmd>ObsidianWorkspace<cr>", desc = "Obsidian workspaces" },
      { mode = { "n" }, "<leader>or", "<cmd>ObsidianRename<cr>", desc = "Obsidian rename" },
    },
  },
}
