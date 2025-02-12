return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      debug = false, -- Enable debugging
      model = "claude-3.5-sonnet",
      auto_insert_mode = false,
      mappings = {
        reset = {
          normal = "C-c",
          insert = "C-c",
        },
      },
    },

    --   local chat = require("CopilotChat")
    --   require("CopilotChat.integrations.cmp").setup()
    --
    --   vim.api.nvim_create_autocmd("BufEnter", {
    --     pattern = "copilot-chat",
    --     callback = function()
    --       vim.opt_local.relativenumber = true
    --       vim.opt_local.number = false
    --     end,
    --   })
    --   chat.setup(opts)
    -- end,

    keys = {
      { mode = { "n", "v" }, "<leader>aa", false },
      {
        mode = { "n", "v" },
        "<leader>ap",
        function()
          return require("CopilotChat").toggle()
        end,
        desc = "Toggle (CopilotChat)",
      },
      { mode = { "n", "v" }, "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "Copilot explain" },
      { mode = { "n", "v" }, "<leader>af", "<cmd>CopilotChatFix<cr>", desc = "Copilot fix" },
      { mode = { "n", "v" }, "<leader>ao", "<cmd>CopilotChatOptimize<cr>", desc = "Copilot optimize" },
      {
        mode = { "n", "v" },
        "<leader>am",
        "<cmd>CopilotChatCommitStaged<cr>",
        desc = "Copilot write commit message for staged changes",
      },
    },
  },
}
