return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      backdrop = 0.95,
      height = 1.0,
      width = 0.95,
      options = {
        -- signcolumn = "no", -- disable signcolumn
        -- number = false, -- disable number column
        -- relativenumber = false, -- disable relative numbers
        -- cursorline = false, -- disable cursorline
        -- cursorcolumn = false, -- disable cursor column
        -- foldcolumn = "0", -- disable fold column
        -- list = false, -- disable whitespace characters
      },
    },
    plugins = {
      gitsigns = { enabled = false },
    },
  },
  keys = {
    { mode = { "n" }, "<leader>zz", "<cmd>ZenMode<cr>", desc = "Zen mode" },
  },
}
