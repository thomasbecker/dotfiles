return {
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  "lewis6991/gitsigns.nvim",
  opts = {
    -- See `:help gitsigns.txt`
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    on_attach = function(bufnr)
      vim.keymap.set(
        "n",
        "<leader>hp",
        require("gitsigns").preview_hunk,
        { buffer = bufnr, desc = " gitsigns: Preview git hunk" }
      )

      -- don't override the built-in and fugitive keymaps
      local gs = package.loaded.gitsigns
      vim.keymap.set({ "n", "v" }, "]c", function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, buffer = bufnr, desc = " gitsigns: Jump to next hunk" })
      vim.keymap.set({ "n", "v" }, "[c", function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, buffer = bufnr, desc = " gitsigns: Jump to previous hunk" })

      vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = " gitsigns: Stage hunk" })
      vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = " gitsigns: Reset hunk" })
      vim.keymap.set("v", "<leader>hs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = " gitsigns: Stage hunk" })
      vim.keymap.set("v", "<leader>hr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = " gitsigns: Reset hunk" })
      vim.keymap.set("n", "<leader>hS", gs.stage_buffer, { desc = " gitsigns: Stage buffer" })
      vim.keymap.set("n", "<leader>hR", gs.reset_buffer, { desc = " gitsigns: Reset buffer" })
      vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { desc = " gitsigns: Undo stage hunk" })
      vim.keymap.set("n", "<leader>hd", gs.diffthis, { desc = " gitsigns: diff this" })
    end,
  },
}
