return {
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  "lewis6991/gitsigns.nvim",
  lazy = true,
  opts = {
    -- See `:help gitsigns.txt`
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    signcolumn = true,
    numhl = true,
    linehl = true,
    word_diff = true,
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 100,
      virt_text_priority = 100,
    },
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d %H:%M:%S> - <summary>",
    -- on_attach = function(bufnr)
    --   vim.keymap.set(
    --     "n",
    --     "<leader>hp",
    --     require("gitsigns").preview_hunk,
    --     { buffer = bufnr, desc = " gitsigns: Preview git hunk" }
    --   )
    --   vim.keymap.set(
    --     "n",
    --     "<leader>hP",
    --     require("gitsigns").preview_hunk_inline,
    --     { buffer = bufnr, desc = " gitsigns: Preview git hunk inline" }
    --   )
    --
    --   -- don't override the built-in and fugitive keymaps
    --   local gs = package.loaded.gitsigns
    --   vim.keymap.set({ "n", "v" }, "]c", function()
    --     if vim.wo.diff then
    --       return "]c"
    --     end
    --     vim.schedule(function()
    --       gs.next_hunk()
    --     end)
    --     return "<Ignore>"
    --   end, { expr = true, buffer = bufnr, desc = " gitsigns: Jump to next hunk" })
    --   vim.keymap.set({ "n", "v" }, "[c", function()
    --     if vim.wo.diff then
    --       return "[c"
    --     end
    --     vim.schedule(function()
    --       gs.prev_hunk()
    --     end)
    --     return "<Ignore>"
    --   end, { expr = true, buffer = bufnr, desc = " gitsigns: Jump to previous hunk" })
    --
    --   vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = " gitsigns: Stage hunk" })
    --   vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = " gitsigns: Reset hunk" })
    --   vim.keymap.set("v", "<leader>hs", function()
    --     gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    --   end, { desc = " gitsigns: Stage hunk" })
    --   vim.keymap.set("v", "<leader>hr", function()
    --     gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    --   end, { desc = " gitsigns: Reset hunk" })
    --   vim.keymap.set("n", "<leader>hS", gs.stage_buffer, { desc = " gitsigns: Stage buffer" })
    --   vim.keymap.set("n", "<leader>hR", gs.reset_buffer, { desc = " gitsigns: Reset buffer" })
    --   vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { desc = " gitsigns: Undo stage hunk" })
    --   vim.keymap.set("n", "<leader>hd", gs.diffthis, { desc = " gitsigns: diff this" })
    -- end,
  },
}
